<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { ref, onMounted, inject } from 'vue'
import axios from 'axios';
import { useCartSync } from '../useCart';

import BookList from '../components/BookList.vue'
import InfoBlock from '../components/InfoBlock.vue';

const favorites = ref([]);
const { cart } = inject('cart'); // Теперь инжектим здесь!
const { loadCartFromLocalStorage } = useCartSync(cart); // Передаём в функцию cart

onMounted(async () => {
  loadCartFromLocalStorage();

  try {
    const userId = localStorage.getItem('user_id');
    if (!userId) return;

    const { data } = await axios.get(`http://localhost:8080/witch/favorites?userId=${userId}`);
    favorites.value = data;
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
      <BookList :items="favorites" is-favorites/>
    </div>
  </div>

</template>
