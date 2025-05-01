<script setup>
import { ref, watch, provide, computed, onMounted } from 'vue';
import debounce from 'lodash.debounce';

import Drawer from './components/Drawer.vue';
import Header from './components/Header.vue';
import Footer from './components/Footer.vue';
import { useCartSync } from './useCart';

const searchQuery = ref('');

/* Корзина (start) */
const cart = ref([]);

const drawerOpen = ref(false);

const price = computed(() => cart.value.reduce((acc, item) => acc + item.price, 0));
const salePrice = computed(() => Math.round((price.value * 5) / 100));
const totalPrice = computed(() => price.value - salePrice.value);

const closeDrawer = () => {
  drawerOpen.value = false;
};

const openDrawer = () => {
  drawerOpen.value = true;
};

const addToCart = (item) => {
  cart.value.push(item);
  item.isAdded = true;
};

const removeFromCart = (item) => {
  cart.value.splice(cart.value.indexOf(item), 1);
  item.isAdded = false;
};

watch(cart, () => {
  localStorage.setItem('cart', JSON.stringify(cart.value));
}, { deep: true });

provide('cart', {
  cart,
  addToCart,
  removeFromCart,
  closeDrawer,
  openDrawer
});

const { loadCartFromLocalStorage } = useCartSync(cart);
onMounted(loadCartFromLocalStorage); // <---- Вот это нужно

/* Корзина (end) */

const onChangeSearchInput = debounce((event) => {
  searchQuery.value = event.target.value;
}, 500);

const isAuthorized = ref(!!localStorage.getItem('user_id'));
const setUserAuthorized = (value) => {
  isAuthorized.value = value;
};

const userName = ref(localStorage.getItem('user_name') || '');
const setUserName = (name) => {
  userName.value = name;
  localStorage.setItem('user_name', name);
};

provide('userName', userName);
provide('setUserName', setUserName);
provide('isAuthorized', isAuthorized);
provide('setUserAuthorized', setUserAuthorized);
provide('searchQuery', searchQuery);
provide('onChangeSearchInput', onChangeSearchInput);
</script>

<template>
  <div class="bg-white w-4/5 m-auto rounded-2xl shadow-xl mt-10">

  <Drawer v-if="drawerOpen" :price="price" :sale-price="salePrice" :total-price="totalPrice"/>

  <Header :price="price" @open-drawer="openDrawer"/>

  <div class="mt-[140px] p-14 mb-16">
    <router-view></router-view>
  </div>

  <Footer/>
</div>
</template>
