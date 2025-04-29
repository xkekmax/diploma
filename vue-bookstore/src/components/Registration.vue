<script setup>
import { ref, watch, defineProps } from 'vue';
import axios from 'axios';

const props = defineProps({
  userData: Object,
  editMode: Boolean
});

const lastName = ref('');
const firstName = ref('');
const patronymic = ref('');
const birhday = ref('');
const email = ref('');
const phone = ref('');
const login = ref('');
const password = ref('');

watch(
  () => props.userData,
  (newVal) => {
    if (newVal) {
      lastName.value = newVal.surname_customer;
      firstName.value = newVal.firstname_customer;
      patronymic.value = newVal.patronymic_customer || '';
      birhday.value = newVal.date_of_birthday ? newVal.date_of_birthday.slice(0, 10) : '';
      email.value = newVal.email;
      phone.value = newVal.phone || '';
      login.value = newVal.login;
    }
  },
  { immediate: true }
);

const registerOrUpdateUser = async () => {
  try {
    const userData = {
      surname_customer: lastName.value,
      firstname_customer: firstName.value,
      patronymic_customer: patronymic.value ? patronymic.value : null,
      date_of_birthday: birhday.value,
      login: login.value,
      password: password.value,
      email: email.value,
      phone: phone.value,
      id_role: 2
    };

    if (props.editMode) {
      const userId = localStorage.getItem('user_id');
      await axios.put(`http://localhost:8080/witch/user/${userId}`, userData);
      alert('Данные успешно обновлены!');
    } else {
      await axios.post('http://localhost:8080/witch/register', userData);
      alert('Регистрация успешна!');
    }
  } catch (error) {
    console.error('Ошибка:', error);
    alert('Произошла ошибка, попробуйте снова.');
  }
};
</script>

<template>
  <div class="flex justify-center items-center min-h-screen">
    <div class="bg-white p-4 rounded-lg shadow-md w-full max-w-md">
      <h2 class="text-2xl font-bold text-center text-orange-900 mb-12">
        {{ editMode ? 'Редактирование профиля' : 'Регистрация' }}
      </h2>

      <form @submit.prevent="registerOrUpdateUser">
        <div class="mb-4">
          <label class="block text-gray-700">Фамилия</label>
          <input v-model="lastName" type="text" class="w-full px-3 py-2 border rounded-md outline-none focus:ring-2 focus:ring-red-200" required />
        </div>

        <div class="mb-4">
          <label class="block text-gray-700">Имя</label>
          <input v-model="firstName" type="text" class="w-full px-3 py-2 border rounded-md outline-none focus:ring-2 focus:ring-red-200" required />
        </div>

        <div class="mb-4">
          <label class="block text-gray-700">Отчество</label>
          <input v-model="patronymic" type="text" class="w-full px-3 py-2 border rounded-md outline-none focus:ring-2 focus:ring-red-200"/>
        </div>

        <div class="mb-4">
          <label class="block text-gray-700">Дата рождения</label>
          <input v-model="birhday" type="date" class="w-full px-3 py-2 border rounded-md outline-none focus:ring-2 focus:ring-red-200" required />
        </div>

        <div class="mb-4">
          <label class="block text-gray-700">Логин</label>
          <input v-model="login" type="text" class="w-full px-3 py-2 border rounded-md outline-none focus:ring-2 focus:ring-red-200" required :disabled="editMode" />
        </div>

        <div class="mb-4" v-if="!editMode">
          <label class="block text-gray-700">Пароль</label>
          <input v-model="password" type="password" class="w-full px-3 py-2 border rounded-md outline-none focus:ring-2 focus:ring-red-200" required />
        </div>

        <div class="mb-4">
          <label class="block text-gray-700">Почта</label>
          <input v-model="email" type="email" class="w-full px-3 py-2 border rounded-md outline-none focus:ring-2 focus:ring-red-200" required />
        </div>

        <div class="mb-4">
          <label class="block text-gray-700">Телефон</label>
          <input v-model="phone" type="tel" class="w-full px-3 py-2 border rounded-md outline-none focus:ring-2 focus:ring-red-200" />
        </div>

        <button type="submit" class="w-full bg-red-400 text-white py-2 px-4 rounded-md hover:bg-red-500 transition mt-8">
          {{ editMode ? 'Сохранить изменения' : 'Зарегистрироваться' }}
        </button>
      </form>

      <p v-if="!editMode" class="text-center text-gray-600 mt-6">
        Уже есть аккаунт?
        <a @click="$emit('goToLogin')" class="text-orange-600 hover:underline cursor-pointer">Войти</a>
      </p>
    </div>
  </div>
</template>
