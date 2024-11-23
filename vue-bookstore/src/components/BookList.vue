<script setup>
import Book from './Book.vue'

defineProps({
  items: Array,
})

const emit = defineEmits(['addFavorite']);

const onClickAdd = () => {
  alert('Добавить!')
}
</script>

<template>
  <div class="grid grid-cols-5 gap-5">
        <Book v-for="item in items"
              :key="item.code_book"
              :code="item.code_book"
              :title="item.book_name"
              :author="item.surname_author"
              :price="item.price"
              :image-url="item.cover_art"
              :is-added="false" :is-favorite="false"
              :onClickAdd="onClickAdd"
              :isFavorite="item.isFavorite"
              :onClickFavorite="() => emit('addFavorite', item)"/>
      </div>
</template>
