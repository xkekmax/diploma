<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { defineProps, inject } from 'vue';

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

const handleFavoriteClick = (event) => {
  event.preventDefault();
  if (props.onClickFavorite) props.onClickFavorite();
};

const handleAddClick = (event) => {
  event.preventDefault();
  if (props.onClickAdd) props.onClickAdd();
};

// 🆕 Добавим реактивное изменение поля поиска
const searchQuery = inject('searchQuery');

const handleAuthorClick = (event) => {
  event.preventDefault();
  if (searchQuery) {
    searchQuery.value = props.author;
  }
};
</script>

<template>
  <router-link :to="{ name: 'BookPage', params: { id: props.code } }">
    <div class="relative bg-white border border-red-100 rounded-r-lg p-8 cursor-pointer transition hover:-translate-y-2 hover:shadow-xl">
      <img v-if="onClickFavorite" @click="handleFavoriteClick" :src="isFavorite ? '/like-4.svg' : '/like-3.svg'" alt="Like" />
      <img :src="imageUrl" :alt="title" class="mx-auto w-3/4 h-56 object-contain" />

      <div class="flex justify-between mt-4">
        <div class="flex flex-col">
          <p class="line-clamp-2 overflow-hidden h-12">{{ title }}</p>

          <!-- Кликабельное имя автора -->
          <span
            class="text-slate-400 cursor-pointer hover:text-red-400  no-underline"
            @click.stop="handleAuthorClick"
          >
            {{ author }}
          </span>

          <b class="mt-4">{{ price }} руб.</b>
        </div>

        <img
          v-if="onClickAdd"
          @click="handleAddClick"
          :src="!isAdded ? '/plus.svg' : '/checked.svg'"
          alt="Plus"
        />
      </div>
    </div>
  </router-link>
</template>

