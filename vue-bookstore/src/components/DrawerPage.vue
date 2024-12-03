<script setup>
import { onMounted, ref, inject } from 'vue';
import axios from 'axios';
import Header from './Header.vue';
import BookList from './BookList.vue';

const addFavorite = inject('addFavorite')
const bookData = ref([]);


onMounted(async () => {
    try {
        const response = await axios.get('http://localhost:8080/witch/drawer');
        bookData.value = response.data; // Сохраняем полученные данные
    } catch (error) {
        console.error('Ошибка при загрузке книги:', error);
    }
});
</script>

<template>
   <div class="bg-white w-4/5 m-auto rounded-2xl shadow-xl pb-14">
    <Header/>
    <div class="mt-12 p-14">
      <BookList :items="bookData" @onClickFavorite="addFavorite"/>
    </div>
  </div>
</template>
