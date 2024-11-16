<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
defineProps({
  title: String,
  author: String,
  imageUrl: String,
  price: Number,

  isFavorite: Boolean,
  isAdded: Boolean,
  onClickAdd: Function,
  onClickFaivorite: Function
})
</script>

<template>

  <RouterLink to="/book" class="relative bg-white border border-red-100 rounded-r-lg p-8 cursor-pointer transition hover:-translate-y-2 hover:shadow-xl">
        <img @click="onClickFaivorite" :src="isFavorite ? '/like-4.svg' : '/like-3.svg'" alt="Plus"/>
        <img :src="imageUrl" alt="Book" class="mx-auto"/>

        <div class="flex justify-between mt-4">
          <div class="flex flex-col">
            <p>{{ title }}</p>
            <span class="text-slate-400">{{ author }}</span>
            <b class="mt-4">{{ price }} руб.</b>
          </div>

          <img @click="onClickAdd" :src="!isAdded ? '/plus.svg' : '/checked.svg'" alt="Plus" />
        </div>
      </RouterLink>
</template>
