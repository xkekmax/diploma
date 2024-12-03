<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import Search from './SearchBar.vue'
import { useRouter, useRoute } from 'vue-router';


const router = useRouter();
const route = useRoute();

const goToHomePage = () => {
  // Проверяем, находимся ли мы уже на HomePage
  if (route.name === 'HomePage') {
    // Если да, то перезагружаем страницу
    window.location.reload();
  } else {
    // Если нет, то переходим на HomePage
    router.push({ name: 'HomePage' });
  }
}

const goToDrawerPage = () => {
  router.push({ name: 'DrawerPage' });
}

</script>
<template>
  <header class="flex justify-between border-b border-red-200 px-16 py-12">
      <div @click="goToHomePage" class="flex items-center cursor-pointer gap-4">
        <img src="/logo.png" alt="Logo" class="w-14" />
        <div>
          <h2 class="text-xl font-bold uppercase text-orange-900">Witch books</h2>
          <p class="text-orange-400">Магазин книг</p>
        </div>
      </div>
      <Search />

      <ul class="flex items-center gap-10">
        <li @click="goToDrawerPage" class="flex items-center cursor-pointer gap-3 text-gray-500 hover:text-red-400">
          <img src="/cart.svg" alt="Cart" />
          <b>2199 руб.</b>
        </li>

        <li class="flex items-center cursor-pointer gap-3 text-gray-500 hover:text-red-400">
          <img src="/heart.svg" alt="Cart" />
          <span>Закладки</span>
        </li>

        <li class="flex items-center cursor-pointer gap-3 text-gray-500 hover:text-red-400">
          <img src="/profile.svg" alt="Cart" />
          <span>Войти</span>
        </li>
      </ul>
    </header>
</template>
