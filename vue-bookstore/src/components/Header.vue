<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { inject } from 'vue';

defineProps({ price: Number });
const emit = defineEmits(['openDrawer']);
const isAuthorized = inject('isAuthorized');
const userName = inject('userName');

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

      <router-link v-if="isAuthorized" to="/profile">
        <li class="flex items-center cursor-pointer gap-3 text-gray-500 hover:text-red-400">
          <img src="/cat.svg" alt="Profile" />
          <span>{{ userName }}</span> <!-- Отображаем имя пользователя -->
        </li>
      </router-link>

      <router-link v-else to="/autorization">
        <li class="flex items-center cursor-pointer gap-3 text-gray-500 hover:text-red-400">
          <img src="/profile.svg" alt="Login" />
          <span>Войти</span>
        </li>
      </router-link>
    </ul>
  </header>
</template>
