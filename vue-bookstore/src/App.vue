<script setup>
import { ref, watch, provide, computed, onMounted } from 'vue';
import axios from 'axios';
import debounce from 'lodash.debounce';

import Drawer from './components/Drawer.vue';
import Header from './components/Header.vue';
import Footer from './components/Footer.vue';
import ScrollToTop from './components/ScrollToTop.vue';
import { useCartSync } from './useCart';

const searchQuery = ref('');

/* Корзина (start) */
const cart = ref([]);

const drawerOpen = ref(false);

const price = computed(() =>
  cart.value.reduce((acc, item) => acc + item.price * item.quantity, 0)
);
const salePrice = computed(() => Math.round((price.value * 5) / 100));
const totalPrice = computed(() => price.value - salePrice.value);

const closeDrawer = () => {
  drawerOpen.value = false;
};

const openDrawer = () => {
  drawerOpen.value = true;
};

const addToCart = (item) => {
  const existingItem = cart.value.find(i => i.code_book === item.code_book);
  if (existingItem) {
    existingItem.quantity += 1;
  } else {
    cart.value.push({ ...item, quantity: 1 });
    item.isAdded = true;
  }
};

const removeFromCart = (codeBook) => {
  const index = cart.value.findIndex((i) => i.code_book === codeBook);
  if (index !== -1) {
    if (cart.value[index].quantity > 1) {
      cart.value[index].quantity -= 1;
    } else {
      cart.value[index].isAdded = false;
      cart.value.splice(index, 1);
    }
  }
};

const deleteBookFromCart = (codeBook) => {
  const index = cart.value.findIndex(i => i.code_book === codeBook);
  if (index !== -1) {
    cart.value[index].isAdded = false;
    cart.value.splice(index, 1);
  }
};

watch(cart, () => {
  localStorage.setItem('cart', JSON.stringify(cart.value));
}, { deep: true });

provide('cart', {
  cart,
  addToCart,
  removeFromCart,
  deleteBookFromCart,
  closeDrawer,
  openDrawer
});

const { loadCartFromLocalStorage } = useCartSync(cart);
onMounted(loadCartFromLocalStorage);

/* Корзина (end) */

const onChangeSearchInput = debounce((event) => {
  searchQuery.value = event.target.value;
}, 500);

// Состояние авторизации и роли
const isAuthorized = ref(!!localStorage.getItem('user_id'));
const setUserAuthorized = (value) => {
  isAuthorized.value = value;
};

const userName = ref(localStorage.getItem('user_name') || '');
const setUserName = (name) => {
  userName.value = name;
  localStorage.setItem('user_name', name);
};

const userRole = ref(localStorage.getItem('user_role') || '');  // Роль пользователя
const setUserRole = (role) => {
  userRole.value = role;
  localStorage.setItem('user_role', role);
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
    console.log("Удаление, favoriteId:", item.favoriteId);
    console.log('Ошибка при добавлении/удалении из избранного:', err);
  }
};

// Передаем данные через provide
provide('userName', userName);
provide('setUserName', setUserName);
provide('isAuthorized', isAuthorized);
provide('setUserAuthorized', setUserAuthorized);
provide('userRole', userRole);   // Роль пользователя
provide('setUserRole', setUserRole); // Функция для изменения роли
provide('searchQuery', searchQuery);
provide('onChangeSearchInput', onChangeSearchInput);
provide('addFavorite', addFavorite);
</script>

<template>
  <div class="bg-white max-w-screen-xl mx-auto pt-8">
    <Drawer v-if="drawerOpen" :price="price" :sale-price="salePrice" :total-price="totalPrice"/>
    <Header :price="price" @open-drawer="openDrawer"/>
    <div class="mt-[140px] p-10 md:p-10 mb-16">
      <router-view></router-view>
    </div>
    <ScrollToTop/>
    <Footer/>
  </div>
</template>
