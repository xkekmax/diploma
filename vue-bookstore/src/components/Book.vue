<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { defineProps, inject } from 'vue';
import { useRouter } from 'vue-router';
const router = useRouter();

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
  quantity: Number,
  showQuantity: Boolean,
  userRole: {
    type: String,
    default: 'user'
  }
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
  if (searchQuery && props.author) {
    searchQuery.value = props.author;
    router.push('/');
  }
};
</script>

<template>
  <router-link :to="{ name: 'BookPage', params: { id: props.code } }">
    <div class="relative bg-white border border-red-100 rounded-r-lg px-4 py-6  cursor-pointer transition hover:-translate-y-2 hover:shadow-xl">
      <!-- Показываем количество, только если showQuantity -->
      <div v-if="showQuantity"
            class="text-xs text-gray-500 border border-red-400 rounded-full w-6 h-6 flex
                   items-center justify-center select-none">
        {{ quantity }}
      </div>

      <img
        v-if="onClickFavorite && userRole !== 'admin'"
        @click="handleFavoriteClick"
        :src="isFavorite ? '/like-4.svg' : '/like-3.svg'"
        alt="Like"
        class="w-7"
      />

      <img :src="imageUrl" :alt="title" class="mx-auto w-8/12" />

      <div class="flex justify-between mt-4 px-4">
        <div class="flex flex-col">
          <p class="line-clamp-2 overflow-hidden h-10 text-sm">{{ title }}</p>

          <!-- Кликабельное имя автора -->
          <span
            class="text-slate-400 cursor-pointer hover:text-red-400 text-sm no-underline pt-2"
            @click.stop="handleAuthorClick"
          >
            {{ author }}
          </span>

          <b class="mt-2 ">{{ price }} руб.</b>
        </div>

        <img
          v-if="onClickAdd && userRole !== 'admin'"
          @click="handleAddClick"
          :src="!isAdded ? '/plus.svg' : '/checked.svg'"
          alt="Plus"
          class="w-7"
        />
      </div>
    </div>
  </router-link>
</template>

