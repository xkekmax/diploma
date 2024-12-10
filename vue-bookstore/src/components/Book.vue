<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { defineProps } from 'vue';

const props = defineProps({
  code: Number,
  title: String,
  author: String,
  imageUrl: String,
  price: Number,

  isFavorite: Boolean,
  isAdded: Boolean,
  onClickAdd: Function,
  onClickFavorite: Function,
});

// Обработчик клика по кнопке "Добавить в избранное"
const handleFavoriteClick = (event) => {
  event.preventDefault(); // Предотвращает переход
  if (props.onClickFavorite) props.onClickFavorite();
};

// Обработчик клика по кнопке "Добавить"
const handleAddClick = (event) => {
  event.preventDefault(); // Предотвращает переход
  if (props.onClickAdd) props.onClickAdd();
};
</script>

<template>
  <router-link :to="{ name: 'BookPage', params: { id: props.code } }">
    <div class="relative bg-white border border-red-100 rounded-r-lg p-8 cursor-pointer transition hover:-translate-y-2 hover:shadow-xl ">
      <img v-if="onClickFavorite" @click="handleFavoriteClick" :src="isFavorite ? '/like-4.svg' : '/like-3.svg'" alt="Like" />
      <img :src="imageUrl" :alt="title" class="mx-auto w-3/4 h-56 object-contain" />
  
      <div class="flex justify-between mt-4">

        <div class="flex flex-col">
          <p class="line-clamp-2 overflow-hidden h-12">{{ title }}</p>
          <span class="text-slate-400">{{ author }}</span>
          <b class="mt-4">{{ price }} руб.</b>
        </div>
  
        <img v-if="onClickAdd" @click="handleAddClick" :src="!isAdded ? '/plus.svg' : '/checked.svg'" alt="Plus" />
      </div>
    </div>
  </router-link>
</template>
