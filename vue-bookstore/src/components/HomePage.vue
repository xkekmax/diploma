<script setup>
import { onMounted, ref, watch, reactive, provide, computed } from 'vue';
import axios from 'axios';

import Drawer from './Drawer.vue';
import Header from './Header.vue'
import BookList from './BookList.vue'

const items = ref([])
const cart = ref([])
const isCreatingOrder = ref(false)

const drawerOpen = ref(false)

const price = computed(() => cart.value.reduce((acc, item) => acc + item.price, 0));
const salePrice = computed(() => Math.round((price.value * 5) / 100))
const totalPrice = computed(() => price.value - salePrice.value)

const cartIsEmpty = computed(() => cart.value.length === 0)

const cartButtonDisabled = computed(() => isCreatingOrder.value || cartIsEmpty.value)

const closeDrawer = () => {
  drawerOpen.value = false
}

const openDrawer = () => {
  drawerOpen.value = true
}

const filters = reactive({
  sortBy: 'title',
  searchQuerry: '',
})

const addToCart = (item) => {
  cart.value.push(item)
  item.isAdded = true
}

const removeFromCart = (item) => {
  cart.value.splice(cart.value.indexOf(item), 1)
  item.isAdded = false
}

const createOrder = async () => {
  isCreatingOrder.value = true
  try {
    const {data} = await axios.post('http://localhost:8080/witch/drawer', {
      items: cart.value,
      totalPrice: totalPrice.value,
    })

    cart.value = []

    return data;
  } catch (err) {
    console.log(err)
  } finally {isCreatingOrder.value = false}
}

const onClickPlus = (item) => {
  if (!item.isAdded) {
    addToCart(item);
  } else {
    removeFromCart(item);
  }
}

const onChangeSelect = (event) => {
  filters.sortBy = event.target.value;
}

const onChangeSearchInput = (event) => {
  filters.searchQuerry = event.target.value;
}

const fetchFavorites = async () => {
  try {
    const { data: favorites } = await axios.get('http://localhost:8080/witch/favorites')
    items.value = items.value.map(item => {
      const favorite = favorites.find(favorite => favorite.code_book === item.code_book);

      if (!favorite) { return item; }

      return {
        ...item,
        isFavorite: true,
        favoriteId: favorite.id_fav,
      }
    });

  } catch (err) {
    console.log(err);
  }
}

const addFavorite = async (item) => {
  try {
    if (!item.isFavorite) {
      const obj = {
        codeBook: item.code_book
      };

      item.isFavorite = true;
      const { data } = await axios.post('http://localhost:8080/witch/favorite', obj)
      item.favoriteId = data.id_fav;
    }
    else {
      item.isFavorite = false;
      await axios.delete('http://localhost:8080/witch/favorite/' + item.favoriteId)
      item.favoriteId = null;
    }

  } catch (err) {
    console.log(err)
  }
}

const fetchItems = async () => {
  try {
    const params = {
      section: filters.sortBy,
    };

    if (filters.searchQuerry) {
      params.title = filters.searchQuerry;
    }

    const { data } = await axios.get(
      'http://localhost:8080/witch/books',
      {
        params
      }
    )
    items.value = data.map((obj) => ({
      ...obj,
      isFavorite: false,
      favoriteId: null,
      isAdded: false
    }));
    // После загрузки книг, загружаем избранные
    await fetchFavorites();
  } catch (err) {
    console.log(err);
  }
}

onMounted(async () => {
  const localCart = localStorage.getItem('cart');
  cart.value = localCart ? JSON.parse(localCart) : []

  await fetchItems();
  await fetchFavorites();

  items.value = items.value.map((item) => ({
    ...item,
    isAdded: cart.value.some((cartItem) => cartItem.code_book === item.code_book)
  }))
});

watch(filters, fetchItems)

watch(cart, () => {
  items.value = items.value.map((item) => ({
    ...item,
    isAdded: false
  }))
})

watch(cart, () => {
    localStorage.setItem('cart', JSON.stringify(cart.value))
  },
  { deep: true }
)

provide('onChangeSearchInput', onChangeSearchInput);
provide('addFavorite', addFavorite);
provide('cart', {
  cart,
  addToCart,
  removeFromCart
})

</script>
<template>

  <div class="bg-white w-4/5 m-auto rounded-2xl shadow-xl mt-14">

  <Drawer v-if="drawerOpen" :price="price" :sale-price="salePrice" :total-price="totalPrice"
          @close-drawer="closeDrawer" @create-order="createOrder"
          :button-disabled="cartButtonDisabled"/>

  <Header :price="price" @open-drawer="openDrawer"/>

  <div class="p-14">
    <div class="flex justify-between items-center mb-8">
      <h2 class="text-3xl font-bold text-orange-900">Все книги</h2>
      <select @change="onChangeSelect" class="py-2 px-3 border rounded-md outline-none">
        <option value=1>Проза</option>
        <option value=2>Фантастика</option>
        <option value=3>Фэнтези</option>
      </select>
    </div>

    <div class="mt-12">
      <BookList :items="items" @add-favorite="addFavorite" @add-to-cart="onClickPlus"/>
    </div>

  </div>
</div>
</template>
