<script setup>

defineProps({
  code: Number,
  title: String,
  author: String,
  imageUrl: String,
  price: Number,

  publishing: String,
  series: String,
  translator: String,
  illustrator: String,
  cover: String,
  pageCount: Number,
  year: String,
  ISBN: String,
  section: String,
  size: String,
  weight: String,
  description: String,

  isFavorite: Boolean,
  isAdded: Boolean,
  onClickAdd: Function,
  onClickFavorite: Function,
  onAuthorClick: Function
})
</script>

<template>

    <div class="flex flex-col px-10">
      <div class="flex flex-col gap-4 mb-4">
        <h2 class="text-3xl font-bold ">{{ title }}</h2>
        <a class="text-gray-600 border-b border-gray-200 w-fit hover:text-red-400
            transition cursor-pointer" @click="onAuthorClick">
            {{ author }}
        </a>
      </div>

      <div class="flex gap-20">
        <div class="flex items-top gap-12 mt-2">
           <img :src="imageUrl" :alt="title"
           class="w-96">
           <div class="flex flex-col gap-2">
              <p class="font-medium">Аннотация</p>
              <p class="text-ellipsis overflow-hidden h-36">{{ description }}</p>
              <a class="bg-gray-100 hover:bg-gray-200 focus:outline-none rounded-lg px-4 py-2
              w-fit mt-4" href="#description">
                Перейти к описанию
              </a>

              <div class="flex gap-10 mt-8">
                <div class="flex flex-col gap-3 text-gray-400">
                  <p>Серия</p>
                  <p>Издательство</p>
                  <p>Переплет</p>
                  <p>Страниц</p>
                  <p>Год, тираж</p>
                </div>
                <div class="flex flex-col gap-3">
                  <p>{{ series }}</p>
                  <p>{{ publishing }}</p>
                  <p>{{ cover }}</p>
                  <p>{{ pageCount }}</p>
                  <p>{{ year }}</p>
                </div>
              </div>
              <a class="mt-4 hover:text-red-400 transition" href="#description">Перейти к характеристикам ></a>
           </div>
        </div>

        <div class="flex flex-col gap-4 shadow-lg rounded-lg w-fit h-fit py-10 px-12">
          <h2 class="text-2xl font-bold">{{ price }} руб.</h2>
          <div>
            <div class="flex items-end">
              <img class="w-7" src="..\..\check.svg">
              <h2 class="ml-2 text-gray-600 ">В наличии</h2>
            </div>
            <div class="flex items-end">
              <img class="w-7" src="..\..\read.svg">
              <h2 class="ml-2 text-gray-600 ">Бонусы за покупку</h2>
            </div>
          </div>
          <div class="flex justify-between mt-2">
            <button
              @click="onClickAdd"
              class="text-white bg-red-400 hover:bg-red-500 w-max h-max text-xl focus:outline-none font-medium rounded-lg px-12 py-2"
              >
              {{ isAdded ? 'Убрать' : 'Купить' }}
            </button>
            <img
              @click="onClickFavorite"
              class="cursor-pointer mx-4"
              :src="isFavorite ? '/like-4.svg' : '/like-3.svg'"alt="Plus">
          </div>

        </div>
      </div>

      <div class="text-2xl font-medium my-10">
        Отзывы
      </div>

      <div class="flex flex-col gap-4">
        <div class="text-2xl font-medium" id="description">
          Описание и характеристики
        </div>
        <p class="w-3/5">{{ description }}</p>

        <div class="flex gap-16 mt-8">
          <div class="flex flex-col gap-3 text-gray-400">
            <p>Код</p>
            <p>Издательство</p>
            <p>Серия</p>
            <p>Автор</p>
            <p>Переводчик</p>
            <p>Переплет</p>
            <p>Кол-во страниц</p>
            <p>Год издания</p>
            <p>ISBN</p>
            <p>Раздел</p>
            <p>Размеры</p>
            <p>Вес</p>
          </div>
          <div class="flex flex-col gap-3">
            <p>{{ ISBN }}</p>
            <p>{{ publishing }}</p>
            <p>{{ series }}</p>
            <a class="hover:text-red-400 transition cursor-pointer" @click="onAuthorClick">
              {{ author }}
            </a>
            <p>{{ translator }}</p>
            <p>{{ cover }}</p>
            <p>{{ pageCount }}</p>
            <p>{{ year }}</p>
            <p>{{ ISBN }}</p>
            <p>{{ section }}</p>
            <p>{{ size }}</p>
            <p>{{ weight }}</p>
          </div>
        </div>
      </div>

    </div>
</template>
