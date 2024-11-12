<script setup>
import { onMounted, ref, watch, reactive } from 'vue';
import axios from 'axios';

import Header from './components/Header.vue'
import BookList from './components/BookList.vue'
import Drawer from './components/Drawer.vue'

const items = ref([]);

const filters = reactive({
  sortBy: '',
  searchQuerry: '',
})

const onChangeSelect = (event) => {
  filters.sortBy = event.target.value;
}

const fetchItems = async () => {
  try {
    const params = {
      sortBy: filters.sortBy,
      searchQuerry: filters.searchQuerry
    };


    const { data } = await axios.get('http://localhost:8080/witch/books/' + filters.sortBy)

    items.value = data;
  } catch (err) {
    console.log(err);
  }
}

onMounted(fetchItems);
watch(filters, fetchItems);

</script>

<template>
  <!-- <Drawer/> -->

  <div class="bg-white w-4/5 m-auto rounded-2xl shadow-xl mt-14">
    <Header />

    <div class="p-14">
      <div class="flex justify-between items-center mb-8">
        <h2 class="text-3xl font-bold text-orange-900">Все книги</h2>
        <select @change="onChangeSelect" class="py-2 px-3 border rounded-md outline-none">
          <option value="Проза">Проза</option>
          <option value="Фантастика">Фантастика</option>
          <option value="Фэнтези">Фэнтези</option>
        </select>
      </div>

      <div class="mt-12">
        <BookList :items="items"/>
      </div>

    </div>
  </div>
</template>

<style scoped></style>
