<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { computed } from 'vue';
import BookListItem from './BookListItem.vue';
import InfoBlock from './InfoBlock.vue';

const emit = defineEmits(['closeDrawer', 'createOrder']);

defineProps({
  price: Number,
  salePrice: Number,
  totalPrice: Number,
  buttonDisabled: Boolean
})

</script>


<template>
  <div class="fixed top-0 left-0 h-full w-full bg-black z-10 opacity-70"></div>
  <div class="bg-white w-1/4 h-full fixed right-0 top-0 z-20 p-8">
    <div class="flex items-center gap-5 mb-8">
      <img @click="() => emit('closeDrawer')" class="opacity-50 hover:opacity-100 transition cursor-pointer hover:-translate-x-1" src="/arrow.svg" alt="arrow-left"/>
      <h2 class="text-2xl font-bold">Корзина</h2>
    </div>

    <div v-if="!totalPrice" class="flex h-full items-center">
      <InfoBlock
        title="Корзина пустая"
        description="Добавьте хотя бы одну книгу, чтобы сделать заказ"
        image-url="/package-icon.png"
      />
    </div>

    <div v-else>
      <BookListItem/>

      <div class="flex flex-col gap-4 mt-8">

        <div class="flex gap-2">
          <span>Товар:</span>
          <div class="flex-1 border-b border-dashed"></div>
          <p>{{ price }} руб.</p>
        </div>

        <div class="flex gap-2">
          <span>Скидка:</span>
          <div class="flex-1 border-b border-dashed"></div>
          <p class="text-red-500">-{{ salePrice }} руб.</p>
        </div>

        <div class="flex gap-2">
          <span>Итого:</span>
          <div class="flex-1 border-b border-dashed"></div>
          <b>{{ totalPrice }} руб.</b>
        </div>

        <button
          :disabled="buttonDisabled"
          @click="() => emit('createOrder')"
          class="mt-4 bg-orange-300 w-full rounded-xl py-3 text-white active:bg-orange-400 transition disabled:bg-gray-300 cursor-pointer"
        >
          Оформить заказ</button>

      </div>
    </div>
  </div>
</template>
