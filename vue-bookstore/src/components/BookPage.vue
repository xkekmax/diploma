<script setup>
import { onMounted, ref } from 'vue';
import axios from 'axios';
import Header from './Header.vue';
import BookPageItem from './BookPageItem.vue';

const book = ref(null);
const bookId = 11; // Замените на нужный ID книги

onMounted(async () => {
    try {
        const response = await axios.get('http://localhost:5000/api/books/'+ {bookId});
        book.value = response.data; // Сохраняем полученные данные
    } catch (error) {
        console.error('Ошибка при загрузке книги:', error);
    }
});
</script>

<template>
  <div class="bg-white w-4/5 m-auto rounded-2xl shadow-xl pb-14">
    <Header/>

    <BookPageItem/>
  </div>
</template>
