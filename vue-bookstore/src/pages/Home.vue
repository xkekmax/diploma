<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { onMounted, ref, watch, provide, inject } from 'vue';
import axios from 'axios';
import BookList from '../components/BookList.vue'
import Swiper from '@/components/Swiper.vue';
import InfoBlock from '../components/InfoBlock.vue';

const items = ref([])

const { cart, addToCart, removeFromCart } = inject('cart')

const sortBy = ref('title')
const searchQuery = inject('searchQuery')

// В компоненте Home.vue добавьте функцию для сохранения корзины
const saveCartToLocalStorage = (cart) => {
  localStorage.setItem('cart', JSON.stringify(cart));
};

// Измените код добавления и удаления товаров в корзину
const onClickPlus = (item) => {
  if (!item.isAdded) {
    addToCart(item);
  } else {
    removeFromCart(item);
  }

  saveCartToLocalStorage(cart.value);  // Сохраняем корзину в localStorage
};

const onChangeSelect = (event) => {
  sortBy.value = event.target.value;
}

const fetchFavorites = async () => {
  try {
    const userId = localStorage.getItem('user_id');
    if (!userId) return;

    const { data: favorites } = await axios.get(`http://localhost:8080/witch/favorites?userId=${userId}`);

    items.value = items.value.map(item => {
      const favorite = favorites.find(fav => fav.code_book === item.code_book);
      return favorite
        ? { ...item, isFavorite: true, favoriteId: favorite.id_fav }
        : item;
    });
  } catch (err) {
    console.log(err);
  }
};

const addFavorite = async (item) => {
  try {
    const idCustomer = localStorage.getItem('user_id');
    if (!idCustomer) {
      alert('Пользователь не авторизован');
      return;
    }

    if (!item.isFavorite) {
      const obj = {
        codeBook: item.code_book,
        idCustomer
      };

      const { data } = await axios.post('http://localhost:8080/witch/favorite', obj);
      item.isFavorite = true;
      item.favoriteId = data.id_fav;
    } else {
      await axios.delete('http://localhost:8080/witch/favorite/' + item.favoriteId);
      item.isFavorite = false;
      item.favoriteId = null;
    }
  } catch (err) {
    console.log('Ошибка при добавлении/удалении из избранного:', err);
  }
};

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

// При авторизации восстанавливаем корзину из localStorage, если она существует
onMounted(async () => {
  const localCart = localStorage.getItem('cart');
  cart.value = localCart ? JSON.parse(localCart) : [];

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
    isAdded: cart.value.some((cartItem) => cartItem.code_book === item.code_book)
  }));
}, { deep: true });

provide('addFavorite', addFavorite);
</script>

<template>

  <Swiper/>

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
    <div v-if="items.length === 0" class="mt-40 mb-12">
      <InfoBlock
      title="Таких книг нет :("
      description="В данный момент книг этого жанра нет в системе"
      image-url="/bookmark.png"/>
    </div>

    <BookList :items="items" @add-favorite="addFavorite" @add-to-cart="onClickPlus"/>
  </div>

</template>
