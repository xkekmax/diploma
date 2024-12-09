<script setup>
import { ref, watch, provide, computed } from 'vue';
import axios from 'axios';

import Drawer from './components/Drawer.vue';
import Header from './components/Header.vue'

const searchQuery = ref('');

/* Корзина (start) */
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

watch(cart, () => {
    localStorage.setItem('cart', JSON.stringify(cart.value))
  },
  { deep: true }
)

provide('cart', {
  cart,
  addToCart,
  removeFromCart
})
/* Корзина (end) */

const onChangeSearchInput = (event) => {
  searchQuery.value = event.target.value;
}

provide('searchQuery', searchQuery)
provide('onChangeSearchInput', onChangeSearchInput);

</script>

<template>
  <div class="bg-white w-4/5 m-auto rounded-2xl shadow-xl mt-10">

  <Drawer v-if="drawerOpen" :price="price" :sale-price="salePrice" :total-price="totalPrice"
          @close-drawer="closeDrawer" @create-order="createOrder"
          :button-disabled="cartButtonDisabled"/>

  <Header :price="price" @open-drawer="openDrawer"/>

  <div class="p-14">
    <router-view></router-view>
  </div>
</div>
</template>
