<script setup>
import { onMounted, ref, inject, computed } from 'vue';
import { useRouter } from 'vue-router';
import axios from 'axios';
import BookPageItem from '../components/BookPageItem.vue';

const props = defineProps({
  id: String // Получаем bookCode как пропс
});

const bookData = ref(null);

// Инжектируем состояние и методы корзины
const { cart, addToCart, removeFromCart } = inject('cart');

// Вычисляемое свойство для проверки, добавлена ли книга в корзину
const isAdded = computed(() =>
  cart.value.some((item) => item.code_book === bookData.value?.code_book)
);

const router = useRouter();
const searchQuery = inject('searchQuery');

const goToAuthorBooks = () => {
  if (searchQuery && bookData.value?.surname_author) {
    searchQuery.value = bookData.value.surname_author;
    router.push('/');
  }
};

onMounted(async () => {
    try {
        const response = await axios.get('http://localhost:8080/witch/book/' + props.id);
        bookData.value = response.data; // Сохраняем полученные данные

    } catch (error) {
        console.error('Ошибка при загрузке книги:', error);
    }
});

const toggleAddToCart = () => {
  if (isAdded.value) {
    removeFromCart(bookData.value);
  } else {
    addToCart(bookData.value);
  }
};
</script>

<template>
  <div v-auto-animate>
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
      :isAdded="isAdded"
      :onClickAdd="toggleAddToCart"
      :onClickFavorite="bookData.onClickFavorite"
      :onAuthorClick="goToAuthorBooks" />
    </div>
</template>

