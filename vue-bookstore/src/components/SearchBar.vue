<script setup>
import { inject } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();
const onChangeSearchInput = inject('onChangeSearchInput');
const searchQuery = inject('searchQuery');

// Отправка формы: переход на главную с параметром title
const onSubmit = () => {
  router.push({ name: 'Home', query: { title: searchQuery.value } });
};
</script>

<template>
  <form @submit.prevent="onSubmit" class="w-5/12">
    <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only">Search</label>
    <div class="relative">
      <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
        <svg class="w-4 h-4 text-red-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
            d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
        </svg>
      </div>

      <input
        v-model="searchQuery"
        @input="onChangeSearchInput"
        type="search"
        id="default-search"
        class="block w-full p-4 ps-10 pe-10 text-sm text-gray-900 border border-red-200 rounded-lg focus:border-red-400 outline-none"
        placeholder="Найти книгу..."
        required
      />

      <button
        v-if="searchQuery"
        type="button"
        @click="searchQuery = ''"
        class="absolute right-24 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-gray-600"
      >
        <img src="/cross.svg" class="size-4 opacity-70">
      </button>

      <button
        type="submit"
        class="text-white absolute end-2.5 bottom-2.5 bg-red-400 hover:bg-red-500 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-4 py-2"
      >
        Найти
      </button>
    </div>
  </form>
</template>
