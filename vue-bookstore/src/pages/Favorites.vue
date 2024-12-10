<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios';

import BookList from '../components/BookList.vue'

const favorites = ref([]);

onMounted(async () => {
  try {
    const {data} = await axios.get('http://localhost:8080/witch/favorites');

    favorites.value = data
  } catch (err) {
    console.log(err)
  }
})
</script>

<template>
  <h2 class="text-3xl font-bold text-orange-900 mb-8">Избранное</h2>
  <div class="mt-12">
    <BookList :items="favorites" is-favorites/>
  </div>
</template>
