<script setup>
import { ref, onMounted, watch } from 'vue';
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
  const savedBookData = sessionStorage.getItem('bookFormData');
  if (savedBookData && !route.query.id) {
    book.value = JSON.parse(savedBookData);
    imagePreview.value = book.value.cover_art ? `/books/${book.value.cover_art}` : null;
  }

  bookId.value = route.query.id;
  if (bookId.value) {
    isEdit.value = true;
    const { data } = await axios.get(`http://localhost:8080/witch/book/${bookId.value}`);
    book.value = data;
    imagePreview.value = book.value.cover_art ? `/books/${book.value.cover_art}` : null;
  }
});

const fileCover = ref(null);

const handleImageUpload = (event) => {
  const file = event.target.files[0];
  if (file) {
    fileCover.value = file;
    book.value.cover_art = file.name;
    const reader = new FileReader();
    reader.onload = (e) => {
      imagePreview.value = e.target.result;
    };
    reader.readAsDataURL(file);
  }
};

// Проверка: строка состоит только из цифр
const isNumeric = (value) => /^[0-9]*$/.test(value);

const saveBook = async () => {
  const requiredFields = [
    'book_name', 'surname_author', 'price', 'publishing_name',
    'cover_name', 'page_count', 'year_of_publication', 'ISBN',
    'section_name', 'book_size', 'book_weight', 'description'
  ];

  const emptyFields = requiredFields.filter(field => !book.value[field]?.toString().trim());
  if (emptyFields.length > 0) {
    alertMessage.value = 'Пожалуйста, заполните все поля перед сохранением.';
    showAlert.value = true;
    return;
  }

  if (!isNumeric(book.value.price) || !isNumeric(book.value.page_count)) {
    alertMessage.value = 'Поля "Цена" и "Количество страниц" должны содержать только цифры.';
    showAlert.value = true;
    return;
  }

  // Приведение к нужным типам
  book.value.price = Number(book.value.price);
  book.value.page_count = Number(book.value.page_count);
  book.value.publishing_name = book.value.publishing_name ? Number(book.value.publishing_name) : null;
  book.value.cover_name = book.value.cover_name ? Number(book.value.cover_name) : null;
  book.value.section_name = book.value.section_name ? Number(book.value.section_name) : null;
  book.value.year_of_publication = `${book.value.year_of_publication}-01-01`; // YYYY-MM-DD
  if (!String(book.value.surname_translator).trim()) book.value.surname_translator = null;
  if (!String(book.value.surname_illustrator).trim()) book.value.surname_illustrator = null;

  try {
    if (isEdit.value) {
      console.log('📦 Данные перед отправкой:', JSON.stringify(book.value, null, 2));
      await axios.put(`http://localhost:8080/witch/book/${bookId.value}`, book.value);
      alert('Книга обновлена!');
    } else {
      console.log('📦 Данные перед отправкой:', JSON.stringify(book.value, null, 2));
      await axios.post('http://localhost:8080/witch/book', book.value);
      alert('Книга добавлена!');
    }

    sessionStorage.removeItem('bookFormData');
    router.push('/');
  } catch (error) {
    if (error.response) {
      console.error('Ошибка на сервере:', error.response.data);
      alert('Ошибка при сохранении книги: ' + error.response.data.message || 'Неизвестная ошибка');
    } else if (error.request) {
      console.error('Нет ответа от сервера:', error.request);
      alert('Нет ответа от сервера');
    } else {
      console.error('Ошибка при настройке запроса:', error.message);
      alert('Ошибка при отправке запроса');
    }
  }
};

watch(book, (newVal) => {
  sessionStorage.setItem('bookFormData', JSON.stringify(newVal));
}, { deep: true });

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
        <select v-model="book.publishing_name" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2">
          <option disabled value="">Издательство</option>
          <option value=1>АСТ</option>
          <option value=2>Эксмо</option>
          <option value=3>Лайвбук</option>
        </select>
        <input v-model="book.series_name" placeholder="Серия" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.surname_translator" placeholder="Переводчик" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.surname_illustrator" placeholder="Художник" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <select v-model="book.cover_name" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2">
          <option disabled value="">Тип обложки</option>
          <option value=1>Твёрдый переплёт</option>
          <option value=2>Мягкий переплёт</option>
        </select>
        <input v-model="book.page_count" placeholder="Количество страниц" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.year_of_publication" placeholder="Год издания" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <input v-model="book.ISBN" placeholder="ISBN" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2" />
        <select v-model="book.section_name" class="border p-2 rounded focus:ring-red-200 outline-none focus:ring-2">
          <option disabled value="">Раздел</option>
          <option value=1>Проза</option>
          <option value=2>Фантастика</option>
          <option value=3>Фэнтези</option>
        </select>
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
