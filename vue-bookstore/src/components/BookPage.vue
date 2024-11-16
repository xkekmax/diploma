<script setup>
import { onMounted, ref } from 'vue';
import axios from 'axios';
import Header from './Header.vue';
import BookPageItem from './BookPageItem.vue';

const props = defineProps({
  id: String // Получаем bookCode как пропс
});

const bookData = ref(null);

onMounted(async () => {
    try {
        const response = await axios.get('http://localhost:8080/witch/book/' + props.id);
        bookData.value = response.data; // Сохраняем полученные данные
    } catch (error) {
        console.error('Ошибка при загрузке книги:', error);
    }
});
</script>

<template>
  <div class="bg-white w-4/5 m-auto rounded-2xl shadow-xl pb-14">
    <Header/>
    <BookPageItem v-if="bookData"
      :code="bookData.code_book"
      :title="bookData.book_name"
      :author="bookData.surname_author"
      :imageUrl="bookData.cover_art"
      :price="bookData.price"
      :publishing="bookData.publishing_name"
      :series="bookData.series_name"
      :translator="bookData.surname_translator"
      :illustrator="bookData.surname_illustrator"
      :cover="bookData.cover_name"
      :pageCount="bookData.page_count"
      :year="bookData.year_of_publication"
      :ISBN="bookData.ISBN"
      :section="bookData.section_name"
      :size="bookData.book_size"
      :weight="bookData.book_weight"
      :description="bookData.description"
      :isFavorite="bookData.isFavorite"
      :isAdded="bookData.isAdded"
      :onClickAdd="bookData.onClickAdd"
      :onClickFavorite="bookData.onClickFavorite" />
  </div>
</template>

