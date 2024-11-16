<script setup>
import { onMounted, ref, watch, reactive } from 'vue';
import axios from 'axios';

import Header from './Header.vue'
import BookList from './BookList.vue'
// import Drawer from './Drawer.vue'

const items = ref([]);


const filters = reactive({
  sortBy: 'title',
  searchQuerry: '',
})

const onChangeSelect = (event) => {
  filters.sortBy = event.target.value;
}

const onChangeSearchInput = (event) => {
  filters.searchQuerry = event.target.value;
}

const fetchItems = async () => {
  try {
    const params = {
      section: filters.sortBy,
    };

    if (filters.searchQuerry) {
      params.title = filters.searchQuerry;
    }

    const { data } = await axios.get(
      'http://localhost:8080/witch/books',
      {
        params
      }
    )
    items.value = data;
  } catch (err) {
    console.log(err);
  }
}

onMounted(fetchItems);
watch(filters, fetchItems);

</script>
<template>

  <div class="bg-white w-4/5 m-auto rounded-2xl shadow-xl mt-14">

  <!-- <Drawer/> -->

  <Header :onChangeSearchInput="onChangeSearchInput"/>

  <div class="p-14">
    <div class="flex justify-between items-center mb-8">
      <h2 class="text-3xl font-bold text-orange-900">Все книги</h2>
      <select @change="onChangeSelect" class="py-2 px-3 border rounded-md outline-none">
        <option value=1>Проза</option>
        <option value=2>Фантастика</option>
        <option value=3>Фэнтези</option>
      </select>
    </div>

    <div class="mt-12">
      <BookList :items="items"/>
    </div>

  </div>
</div>
</template>
