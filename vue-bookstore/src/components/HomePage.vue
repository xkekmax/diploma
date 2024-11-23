<script setup>
import { onMounted, ref, watch, reactive, provide } from 'vue';
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

const fetchFavorites = async () => {
  try {
    const { data: favorites } = await axios.get('http://localhost:8080/witch/favorites')
    items.value = items.value.map(item => {
      const favorite = favorites.find(favorite => favorite.code_book === item.code_book);

      if (!favorite) { return item; }

      return {
        ...item,
        isFavorite: true,
        favoriteId: favorite.id_fav,
      }

    });

  } catch (err) {
    console.log(err);
  }
}

const addFavorite = async (item) => {
  try {
    if (!item.isFavorite) {
      const obj = {
        // idFav: item.code_book,
        codeBook: item.code_book
      };

      item.isFavorite = true;
      const { data } = await axios.post('http://localhost:8080/witch/favorite', obj)
      item.favoriteId = data.id_fav;
    }
    else {
      item.isFavorite = false;
      await axios.delete('http://localhost:8080/witch/favorite/' + item.favoriteId)
      item.favoriteId = null;
    }

  } catch (err) {
    console.log(err)
  }
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
    items.value = data.map((obj) => ({
      ...obj,
      isFavorite: false,
      favoriteId: null,
      isAdded: false
    }));
    // После загрузки книг, загружаем избранные
    await fetchFavorites();
  } catch (err) {
    console.log(err);
  }
}

onMounted(async () => {
  await fetchItems();
  await fetchFavorites();
});
watch(filters, fetchItems);

provide('onChangeSearchInput', onChangeSearchInput);

</script>
<template>

  <div class="bg-white w-4/5 m-auto rounded-2xl shadow-xl mt-14">

  <!-- <Drawer/> -->

  <Header />

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
      <BookList :items="items" @addFavorite="addFavorite"/>
    </div>

  </div>
</div>
</template>
