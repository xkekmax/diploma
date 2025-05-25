<script setup>
import Book from './Book.vue'

defineProps({
  items: Array,
  isFavorites: Boolean,
  showQuantity: Boolean,
  userRole: {
    type: String,
    default: 'user'
  }
});

const emit = defineEmits(['addFavorite', 'addToCart'])
</script>

<template>
  <div class="grid grid-cols-5 gap-5" v-auto-animate>
    <Book
      v-for="item in items"
      :key="item.code_book"
      :code="item.code_book"
      :title="item.book_name"
      :author="item.name_author"
      :price="item.price"
      :image-url="item.cover_art"
      :quantity="item.quantity"
      :is-added="item.isAdded"
      :is-favorite="item.isFavorite"
      :onClickAdd="isFavorites ? null : () => emit('addToCart', item)"
      :onClickFavorite="isFavorites ? null : () => emit('addFavorite', item)"
      :show-quantity="showQuantity"
      :user-role="userRole"
    />
  </div>
</template>
