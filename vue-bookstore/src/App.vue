<script setup>
import { ref, watch, provide, computed } from 'vue';
import debounce from 'lodash.debounce';

import Drawer from './components/Drawer.vue';
import Header from './components/Header.vue';
import Footer from './components/Footer.vue';

const searchQuery = ref('');

/* Корзина (start) */
const cart = ref([])

const drawerOpen = ref(false)

const price = computed(() => cart.value.reduce((acc, item) => acc + item.price, 0));
const salePrice = computed(() => Math.round((price.value * 5) / 100))
const totalPrice = computed(() => price.value - salePrice.value)

const closeDrawer = () => {
  drawerOpen.value = false
}

const openDrawer = () => {
  drawerOpen.value = true
}

const addToCart = (item) => {
  cart.value.push(item)
  item.isAdded = true
  
}

const removeFromCart = (item) => {
  cart.value.splice(cart.value.indexOf(item), 1)
  item.isAdded = false
}

watch(cart, () => {
    localStorage.setItem('cart', JSON.stringify(cart.value))
  },
  { deep: true }
)

provide('cart', {
  cart,
  addToCart,
  removeFromCart,
  closeDrawer,
  openDrawer
})
/* Корзина (end) */

const onChangeSearchInput = debounce((event) => {
  searchQuery.value = event.target.value;
}, 500)

provide('searchQuery', searchQuery)
provide('onChangeSearchInput', onChangeSearchInput);

</script>

<template>
  <div class="bg-white w-4/5 m-auto rounded-2xl shadow-xl mt-10">

  <Drawer v-if="drawerOpen" :price="price" :sale-price="salePrice" :total-price="totalPrice"/>

  <Header :price="price" @open-drawer="openDrawer"/>

  <div class="p-14 mb-16">
    <router-view></router-view>
  </div>

  <Footer/>
</div>
</template>
