<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { inject, ref } from 'vue';
import { useRouter } from 'vue-router';
import Search from './SearchBar.vue';

defineProps({ price: Number });
const emit = defineEmits(['openDrawer']);
const router = useRouter();
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
  const userId = localStorage.getItem('user_id');
  if (!userId) {
    alert('Пользователь не авторизован');
    return;
  }

  const currentRoute = router.currentRoute.value;
  const isOnProfile = currentRoute.name === 'Profile';
  const isEditMode = currentRoute.query.edit === 'true';

  if (isOnProfile && isEditMode) {
    window.location.reload();
  } else {
    router.push({ name: 'Profile', query: { edit: 'true' } });
  }
};

const reloadHome = () => {
  window.location.href = '/'; // Принудительная перезагрузка на главную
};

const goToFavorites = () => {
  if (router.currentRoute.value.name === 'Favorites') {
    window.location.reload();
  } else {
    router.push({ name: 'Favorites' });
  }
};

const goToOrders = () => {
  if (router.currentRoute.value.name === 'Profile' && router.currentRoute.value.query.edit !== 'true') {
    window.location.reload();
  } else {
    router.push({ name: 'Profile' }); // Без query — это и есть страница заказов
  }
};
</script>

<template>
  <header class="flex justify-between items-center border-b border-red-200 px-4 md:px-20 py-12 fixed top-0 left-1/2 transform -translate-x-1/2 z-10 bg-white w-full max-w-screen-xl">
    <div @click="reloadHome" class="flex items-center cursor-pointer gap-4">
      <img src="/logo.png" alt="Logo" class="w-12" />
      <div>
        <h2 class="text-lg font-bold uppercase text-orange-900">Witch books</h2>
        <p class="text-orange-400 text-sm">Магазин книг</p>
      </div>
    </div>

    <Search />

    <ul class="flex items-center gap-8 pl-4">
      <li @click="() => emit('openDrawer')" class="flex items-center cursor-pointer gap-3 text-gray-500 hover:text-red-400 w-32">
        <img src="/cart.svg" alt="Cart" class="w-7"/>
        <b>{{ price }} руб.</b>
      </li>

      <li
        class="flex items-center cursor-pointer gap-3 text-gray-500 hover:text-red-400"
        @click="goToFavorites"
      >
        <img src="/heart.svg" alt="Favorites" class="w-7"/>
        <span>Закладки</span>
      </li>

      <li
        v-if="isAuthorized"
        class="relative flex items-center cursor-pointer gap-3 text-gray-500"
        @mouseenter="onMouseEnter"
        @mouseleave="onMouseLeave"
      >
        <!-- перемещаем hover сюда -->
        <div class="flex items-center gap-3 hover:text-red-400">
          <img src="/cat.svg" alt="Profile" class="w-7"/>
          <span>{{ userName }}</span>
        </div>

        <!-- выпадающий список не унаследует hover -->
        <ul
          v-show="showDropdown"
          class="absolute top-full right-0 mt-2 bg-white border border-gray-200 shadow-lg rounded-md z-10 w-40 transition-opacity duration-200"
        >
          <li class="px-4 py-2 hover:bg-gray-100 cursor-pointer" @click="goToOrders">Заказы</li>
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
