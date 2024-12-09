<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { useRouter } from 'vue-router';

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
})

// Получаем экземпляр роутера
const router = useRouter();

// Функция для перехода на страницу книги
const goToBookPage = () => {
  router.push({ name: 'BookPage', params: { id: props.code } });
}

</script>

<template>

  <div class="relative bg-white border border-red-100 rounded-r-lg p-8 cursor-pointer transition hover:-translate-y-2 hover:shadow-xl">
        <img @click="onClickFavorite" :src="isFavorite ? '/like-4.svg' : '/like-3.svg'" alt="Plus"/>
        <img @click="goToBookPage" :src="imageUrl" :alt="title" class="mx-auto w-3/4"/>

        <div class="flex justify-between mt-4">
          <div class="flex flex-col">
            <p @click="goToBookPage">{{ title }}</p>
            <span class="text-slate-400">{{ author }}</span>
            <b class="mt-4">{{ price }} руб.</b>
          </div>

          <img @click="onClickAdd" :src="!isAdded ? '/plus.svg' : '/checked.svg'" alt="Plus" />
        </div>
      </div>
</template>
