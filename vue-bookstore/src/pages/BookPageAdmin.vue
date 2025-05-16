<script setup>
import { ref, onMounted } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';
import AlertMessage from '../components/AlertMessage.vue';

const router = useRouter();
const route = useRoute();

const isEdit = ref(false);
const bookId = ref(null);
const showAlert = ref(false);
const alertMessage = ref('');

const book = ref({
  book_name: '',
  surname_author: '',
  price: '',
  cover_art: '',
  publishing_name: '',
  series_name: '',
  surname_translator: '',
  surname_illustrator: '',
  cover_name: '',
  page_count: '',
  year_of_publication: '',
  ISBN: '',
  section_name: '',
  book_size: '',
  book_weight: '',
  description: ''
});

const imagePreview = ref(null);

onMounted(async () => {
  bookId.value = route.query.id;
  if (bookId.value) {
    isEdit.value = true;
    const { data } = await axios.get(`http://localhost:8080/witch/book/${bookId.value}`);
    book.value = data;
    imagePreview.value = book.value.cover_art;
  }
});

const handleImageUpload = (event) => {
  const file = event.target.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = (e) => {
      book.value.cover_art = e.target.result;
      imagePreview.value = e.target.result;
    };
    reader.readAsDataURL(file);
  }
};

// Проверка: строка состоит только из цифр
const isNumeric = (value) => /^[0-9]*$/.test(value);

const saveBook = async () => {
  // Проверка: все поля заполнены
  const requiredFields = [
    'book_name',
    'surname_author',
    'price',
    'cover_art',
    'publishing_name',
    'series_name',
    'surname_translator',
    'surname_illustrator',
    'cover_name',
    'page_count',
    'year_of_publication',
    'ISBN',
    'section_name',
    'book_size',
    'book_weight',
    'description'
  ];

  const emptyFields = requiredFields.filter(field => !book.value[field]?.toString().trim());

  if (emptyFields.length > 0) {
    alertMessage.value = 'Пожалуйста, заполните все поля перед сохранением.';
    showAlert.value = true;
    return;
  }

  // Проверка числовых полей
  if (!isNumeric(book.value.price) || !isNumeric(book.value.page_count) || !isNumeric(book.value.book_weight)) {
    alertMessage.value = 'Поля "Цена", "Количество страниц" и "Вес книги" должны содержать только цифры.';
    showAlert.value = true;
    return;
  }

  try {
    if (isEdit.value) {
      await axios.put(`http://localhost:8080/witch/book/${bookId.value}`, book.value);
      alert('Книга обновлена!');
    } else {
      await axios.post('http://localhost:8080/witch/book', book.value);
      alert('Книга добавлена!');
    }
    router.push('/');
  } catch (err) {
    alert('Ошибка при сохранении книги');
    console.error(err);
  }
};
</script>

<template>
  <div class="py-2 px-8 max-w-6xl mx-auto">
    <h2 class="text-3xl font-bold text-orange-900 mb-8">{{ isEdit ? 'Редактировать книгу' : 'Добавить книгу' }}</h2>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-10">
      <!-- Левая колонка: загрузка и предпросмотр -->
      <div class="md:col-span-1 flex flex-col items-start">
        <label class="block text-xl font-medium text-red-400 mb-2">Обложка</label>

        <div class="flex items-center space-x-4 mb-6">
          <label class="cursor-pointer text-sm bg-red-300 hover:bg-red-400 text-white py-1 px-3 rounded shadow">
            Выбрать файл
            <input
              type="file"
              accept="image/*"
              @change="handleImageUpload"
              class="hidden"
            />
          </label>
          <span class="text-sm text-gray-600">
            {{ imagePreview ? 'Файл выбран' : 'Файл не выбран' }}
          </span>
        </div>

        <img
          v-if="imagePreview"
          :src="imagePreview"
          alt="Обложка"
          class="w-full max-w-xs h-auto object-contain rounded shadow border"
        />
      </div>

      <!-- Правая часть: форма -->
      <form @submit.prevent="saveBook" class="md:col-span-2 grid grid-cols-1 md:grid-cols-2 gap-4 ml-10 mt-4">
        <input v-model="book.book_name" placeholder="Название" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" required />
        <input v-model="book.surname_author" placeholder="Автор" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.price" placeholder="Цена" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.publishing_name" placeholder="Издательство" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.series_name" placeholder="Серия" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.surname_translator" placeholder="Переводчик" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.surname_illustrator" placeholder="Художник" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.cover_name" placeholder="Тип обложки" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.page_count" placeholder="Количество страниц" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.year_of_publication" placeholder="Год издания" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.ISBN" placeholder="ISBN" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.section_name" placeholder="Раздел" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.book_size" placeholder="Размер книги" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.book_weight" placeholder="Вес книги" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <textarea v-model="book.description" placeholder="Описание" class="border p-2 rounded col-span-1 md:col-span-2 min-h-[100px] focus:ring-red-200 outline-none focus:ring-2" />

        <AlertMessage v-if="showAlert" :message="alertMessage" @close="showAlert = false" />

        <button type="submit" class="col-span-1 md:col-span-2 bg-red-400 text-white py-3 rounded-md hover:bg-red-500 transition mx-60">
          {{ isEdit ? 'Сохранить изменения' : 'Добавить книгу' }}
        </button>
      </form>
    </div>
  </div>
</template>
