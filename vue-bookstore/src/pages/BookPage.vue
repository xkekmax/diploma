<script setup>
import { onMounted, ref, inject, computed, watch } from 'vue';
import { useRouter } from 'vue-router';
import axios from 'axios';
import BookPageItem from '../components/BookPageItem.vue';

const props = defineProps({
  id: String
});

const bookData = ref(null);

const { cart, addToCart, removeFromCart } = inject('cart');
const searchQuery = inject('searchQuery');
const router = useRouter();

const isAdded = computed(() =>
  cart.value.some((item) => item.code_book === bookData.value?.code_book)
);

const isFavorite = computed(() => bookData.value?.isFavorite);

const goToAuthorBooks = () => {
  if (searchQuery && bookData.value?.surname_author) {
    searchQuery.value = bookData.value.surname_author;
    router.push('/');
  }
};

const toggleAddToCart = () => {
  if (!bookData.value) return;

  if (isAdded.value) {
    removeFromCart(bookData.value.code_book);
  } else {
    addToCart(bookData.value);
  }
};

const toggleFavorite = async () => {
  if (!bookData.value) return;

  const idCustomer = localStorage.getItem('user_id');
  if (!idCustomer) {
    alert('Пользователь не авторизован');
    return;
  }

  try {
    if (!bookData.value.isFavorite) {
      const obj = {
        codeBook: bookData.value.code_book,
        idCustomer
      };

      const { data } = await axios.post('http://localhost:8080/witch/favorite', obj);
      bookData.value.isFavorite = true;
      bookData.value.favoriteId = data.id_fav;
    } else {
      await axios.delete('http://localhost:8080/witch/favorite/' + bookData.value.favoriteId);
      bookData.value.isFavorite = false;
      bookData.value.favoriteId = null;
    }
  } catch (err) {
    console.error('Ошибка при добавлении/удалении из избранного:', err);
  }
};

const loadBook = async (id) => {
  try {
    const response = await axios.get('http://localhost:8080/witch/book/' + id);
    bookData.value = response.data;

    const idCustomer = localStorage.getItem('user_id');
    if (idCustomer) {
      const { data: favorites } = await axios.get(`http://localhost:8080/witch/favorites?userId=${idCustomer}`);
      const favorite = favorites.find(f => f.code_book === bookData.value.code_book);
      if (favorite) {
        bookData.value.isFavorite = true;
        bookData.value.favoriteId = favorite.id_fav;
      } else {
        bookData.value.isFavorite = false;
      }
    }
  } catch (error) {
    console.error('Ошибка при загрузке книги:', error);
  }
};

// Загружаем при первом монтировании
onMounted(() => {
  loadBook(props.id);
});

// Также загружаем при изменении id (например, переход на другую книгу)
watch(() => props.id, (newId) => {
  loadBook(newId);
});
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
      :isFavorite="isFavorite"
      :isAdded="isAdded"
      :onClickAdd="toggleAddToCart"
      :onClickFavorite="toggleFavorite"
      :onAuthorClick="goToAuthorBooks" />
  </div>
</template>

