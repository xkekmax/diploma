<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { onMounted, ref, watch, inject } from 'vue';
import axios from 'axios';
import BookList from '../components/BookList.vue'
import Swiper from '@/components/Swiper.vue';
import InfoBlock from '../components/InfoBlock.vue';
import AlertMessage from '@/components/AlertMessage.vue';

const showAlert = ref(false);
const alertMessage = ref('');

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
    removeFromCart(item.code_book);
  }

  saveCartToLocalStorage(cart.value);  // Сохраняем корзину в localStorage
};

const onChangeSelect = (event) => {
  sortBy.value = event.target.value;
  searchQuery.value = ''; // Очищаем строку поиска
};

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
      alertMessage.value = 'Войдите в систему, чтобы добавлять книги в закладки';
      showAlert.value = true;
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

      // Обновляем локальный список избранных
      items.value = items.value.map((book) => {
        if (book.code_book === item.code_book) {
          book.isFavorite = true;
          book.favoriteId = data.id_fav;
        }
        return book;
      });
    } else {
      await axios.delete('http://localhost:8080/witch/favorite/' + item.favoriteId);
      item.isFavorite = false;
      item.favoriteId = null;

      // Обновляем локальный список избранных
      items.value = items.value.map((book) => {
        if (book.code_book === item.code_book) {
          book.isFavorite = false;
          book.favoriteId = null;
        }
        return book;
      });
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

    // Обновляем isAdded согласно корзине:
    items.value = items.value.map((item) => ({
      ...item,
      isAdded: cart.value.some((cartItem) => cartItem.code_book === item.code_book)
    }));

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

</script>

<template>

  <Swiper/>

  <AlertMessage
    v-if="showAlert"
    :message="alertMessage"
    :is-delete="false"
    @close="showAlert = false"
  />

  <div class="flex justify-between items-center mb-8 text-sm">
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

    <BookList :items="items" @add-favorite="addFavorite" @add-to-cart="onClickPlus" class="mx-8"/>
  </div>

</template>
