<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { ref, onMounted, inject } from 'vue'
import axios from 'axios';
import { useCartSync } from '../useCart';

import BookList from '../components/BookList.vue'
import InfoBlock from '../components/InfoBlock.vue';

const favorites = ref([]);
const { cart, addToCart, removeFromCart } = inject('cart');
const addFavorite = inject('addFavorite');

const { loadCartFromLocalStorage } = useCartSync(cart);

const onClickPlus = (item) => {
  if (!item.isAdded) {
    addToCart(item);
  } else {
    removeFromCart(item.code_book);
  }

  localStorage.setItem('cart', JSON.stringify(cart.value));
};

onMounted(async () => {
  loadCartFromLocalStorage();

  try {
    const userId = localStorage.getItem('user_id');
    if (!userId) return;

    const { data } = await axios.get(`http://localhost:8080/witch/favorites?userId=${userId}`);
    favorites.value = data.map((book) => ({
      ...book,
      favoriteId: book.id_fav,
      isFavorite: true,
      isAdded: cart.value.some(cartItem => cartItem.code_book === book.code_book),
    }));
  } catch (err) {
    console.log(err);
  }
});
</script>

<template>
  <h2 class="text-3xl font-bold text-orange-900 mb-8">Закладки</h2>

  <div class="mt-12">
    <div v-if="favorites.length === 0">
      <InfoBlock
      title="Закладок нет"
      description="Сохраните что-нибудь интересное из каталога"
      image-url="/bookmark.png"/>
    </div>

    <div v-else>
      <BookList
        :items="favorites"
        @add-favorite="addFavorite"
        @add-to-cart="onClickPlus"
      />
    </div>
  </div>
</template>
