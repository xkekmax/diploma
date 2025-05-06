<script setup>
import { inject } from 'vue'
import BookItem from './BookItem.vue'

const { cart, removeFromCart } = inject('cart')
</script>

<template>
  <div class="flex flex-col gap-4" v-auto-animate>
    <BookItem
      v-for="item in cart"
      :key="item.code_book"
      :code="item.code_book"
      :title="item.book_name"
      :author="item.surname_author"
      :price="item.price"
      :image-url="item.cover_art"
      @onClickRemove="(codeBook) => removeFromCart(codeBook)"
    />
  </div>
</template>
