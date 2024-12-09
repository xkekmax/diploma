<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { onMounted, ref, watch, provide, inject } from 'vue';
import axios from 'axios';
import BookList from '../components/BookList.vue'

const items = ref([])

const { cart, addToCart, removeFromCart } = inject('cart')

const sortBy = ref('title')
const searchQuery = inject('searchQuery')

const onClickPlus = (item) => {
  if (!item.isAdded) {
    addToCart(item);
  } else {
    removeFromCart(item);
  }
}

const onChangeSelect = (event) => {
  sortBy.value = event.target.value;
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
      section: sortBy.value,
    };

    if (searchQuery.value) {
      params.title = searchQuery.value;
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

watch([sortBy, searchQuery], fetchItems)

watch(cart, () => {
  items.value = items.value.map((item) => ({
    ...item,
    isAdded: false
  }))
})

provide('addFavorite', addFavorite);
</script>

<template>
  <div class="flex justify-between items-center mb-8">
      <h2 class="text-3xl font-bold text-orange-900">Все книги</h2>
      <select @change="onChangeSelect" class="py-2 px-3 border rounded-md outline-none">
        <option value=title>Все книги</option>
        <option value=1>Проза</option>
        <option value=2>Фантастика</option>
        <option value=3>Фэнтези</option>
      </select>
  </div>

  <div class="mt-12">
    <BookList :items="items" @add-favorite="addFavorite" @add-to-cart="onClickPlus"/>
  </div>

</template>
