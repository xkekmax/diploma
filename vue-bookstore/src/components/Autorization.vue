<!-- eslint-disable vue/multi-word-component-names -->
<script setup>
import { ref } from 'vue';
import axios from 'axios';

const login = ref('');
const password = ref('');

const autorizationUser = async () => {
  try {
    const userData = {
      login: login.value,
      password: password.value,
    };

    const response = await axios.post('http://localhost:8080/witch/autorization', userData);
    alert('Авторизация успешна!');
    console.log(response.data);
  } catch (error) {
    console.error('Ошибка авторизации:', error);
    alert('Ошибка авторизации, попробуйте снова.');
  }
};
</script>

<template>
  <div class="flex justify-center items-center mt-20">
    <div class="bg-white p-4 rounded-lg shadow-md w-full max-w-md">
      <h2 class="text-2xl font-bold text-center text-orange-900 mb-12">Авторизация</h2>

      <form @submit.prevent="autorizationUser">
        <div class="mb-4">
          <label class="block text-gray-700">Логин</label>
          <input v-model="login" type="text" class="w-full px-3 py-2 border rounded-md outline-none focus:ring-2 focus:ring-red-200" required />
        </div>

        <div class="mb-4">
          <label class="block text-gray-700">Пароль</label>
          <input v-model="password" type="password" class="w-full px-3 py-2 border rounded-md outline-none focus:ring-2 focus:ring-red-200" required />
        </div>

        <button type="submit" class="w-full bg-red-400 text-white py-2 px-4 rounded-md hover:bg-red-500 transition mt-8">Войти</button>
      </form>

      <p class="text-center text-gray-600 mt-6">
        Нет аккаунта?
        <a @click="$emit('goToRegister')" class="text-orange-600 hover:underline cursor-pointer">Зарегистрироваться</a>
      </p>
    </div>
  </div>
</template>
