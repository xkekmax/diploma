<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { inject, ref } from 'vue';

defineProps({ price: Number });
const emit = defineEmits(['openDrawer']);
const isAuthorized = inject('isAuthorized');
const userName = inject('userName');
const setUserAuthorized = inject('setUserAuthorized');
const setUserName = inject('setUserName');

const showDropdown = ref(false);
let hideTimeout;

const onMouseEnter = () => {
  clearTimeout(hideTimeout);
  showDropdown.value = true;
};

const onMouseLeave = () => {
  hideTimeout = setTimeout(() => {
    showDropdown.value = false;
  }, 300); // задержка в 300 мс
};

const logout = () => {
  localStorage.removeItem('user_id');
  localStorage.removeItem('user_name');
  setUserAuthorized(false);
  setUserName('');
  window.location.reload(); // Перезагрузка страницы
};

const editProfile = () => {
  alert('Редактирование профиля пока не реализовано');
};
</script>

<template>
  <header class="flex justify-between border-b border-red-200 px-16 py-12">
    <router-link to="/">
      <div class="flex items-center cursor-pointer gap-4">
        <img src="/logo.png" alt="Logo" class="w-14" />
        <div>
          <h2 class="text-xl font-bold uppercase text-orange-900">Witch books</h2>
          <p class="text-orange-400">Магазин книг</p>
        </div>
      </div>
    </router-link>
    <Search />

    <ul class="flex items-center gap-10">
      <li @click="() => emit('openDrawer')" class="flex items-center cursor-pointer gap-3 text-gray-500 hover:text-red-400 w-32">
        <img src="/cart.svg" alt="Cart" />
        <b>{{ price }} руб.</b>
      </li>

      <router-link to="/favorites">
        <li class="flex items-center cursor-pointer gap-3 text-gray-500 hover:text-red-400">
          <img src="/heart.svg" alt="Cart" />
          <span>Закладки</span>
        </li>
      </router-link>

      <li
        v-if="isAuthorized"
        class="relative flex items-center cursor-pointer gap-3 text-gray-500"
        @mouseenter="onMouseEnter"
        @mouseleave="onMouseLeave"
      >
        <!-- перемещаем hover сюда -->
        <div class="flex items-center gap-3 hover:text-red-400">
          <img src="/cat.svg" alt="Profile" />
          <span>{{ userName }}</span>
        </div>

        <!-- выпадающий список не унаследует hover -->
        <ul
          v-show="showDropdown"
          class="absolute top-full right-0 mt-2 bg-white border border-gray-200 shadow-lg rounded-md z-10 w-40 transition-opacity duration-200"
        >
          <li class="px-4 py-2 hover:bg-gray-100 cursor-pointer" @click="$router.push('/profile')">Заказы</li>
          <li class="px-4 py-2 hover:bg-gray-100 cursor-pointer" @click="editProfile">Редактировать</li>
          <li class="px-4 py-2 hover:bg-gray-100 cursor-pointer text-red-500" @click="logout">Выйти</li>
        </ul>
      </li>

      <router-link v-else to="/autorization">
        <li class="flex items-center cursor-pointer gap-3 text-gray-500 hover:text-red-400">
          <img src="/profile.svg" alt="Login" />
          <span>Войти</span>
        </li>
      </router-link>
    </ul>
  </header>
</template>
