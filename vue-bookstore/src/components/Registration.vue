<script setup>
import { ref, watch, defineProps, inject } from 'vue';
import axios from 'axios';
import AlertMessage from './AlertMessage.vue';

const setUserName = inject('setUserName');

const confirmPassword = ref('');
const agreeToTerms = ref(false);

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

const isAdmin = ref(false);

// Alert message state
const showAlert = ref(false);
const alertMessage = ref('');

const closeAlert = () => {
  showAlert.value = false;
};

watch(
  () => props.userData,
  (newVal) => {
    if (newVal) {
      isAdmin.value = newVal.role_name === 'admin' || newVal.is_admin === true;

      lastName.value = newVal.surname_customer || newVal.surname_admin || '';
      firstName.value = newVal.firstname_customer || newVal.firstname_admin || '';
      patronymic.value = newVal.patronymic_customer || newVal.patronymic_admin || '';
      birhday.value = (newVal.date_of_birthday || '').slice(0, 10);
      email.value = newVal.email || '';
      phone.value = newVal.phone || '';
      login.value = newVal.login || '';
    }
  },
  { immediate: true }
);

const registerOrUpdateUser = async () => {
  try {
    if (!props.editMode) {
      if (password.value !== confirmPassword.value) {
        alertMessage.value = 'Пароль и повтор пароля не совпадают.';
        showAlert.value = true;
        return;
      }
      if (!agreeToTerms.value) {
        alertMessage.value = 'Вы должны дать согласие на обработку персональных данных.';
        showAlert.value = true;
        return;
      }
    }

    const userId = localStorage.getItem('user_id');

    if (props.editMode) {
      if (isAdmin.value) {
        const adminData = {
          surname_admin: lastName.value,
          firstname_admin: firstName.value,
          patronymic_admin: patronymic.value || null,
          date_of_birthday: birhday.value,
          email: email.value
        };

        await axios.put(`http://localhost:8080/witch/admin/${userId}`, adminData);
      } else {
        const userData = {
          surname_customer: lastName.value,
          firstname_customer: firstName.value,
          patronymic_customer: patronymic.value || null,
          date_of_birthday: birhday.value,
          email: email.value,
          phone: phone.value || null,
        };

        await axios.put(`http://localhost:8080/witch/user/${userId}`, userData);
      }

      alertMessage.value = 'Данные успешно обновлены!';
      if (setUserName) setUserName(firstName.value);
      showAlert.value = true;
    } else {
      // регистрация нового пользователя
      const userData = {
        surname_customer: lastName.value,
        firstname_customer: firstName.value,
        patronymic_customer: patronymic.value || null,
        date_of_birthday: birhday.value,
        login: login.value,
        password: password.value,
        email: email.value,
        phone: phone.value || null,
        id_role: 2 // покупатель
      };

      try {
        await axios.post('http://localhost:8080/witch/register', userData);
        alertMessage.value = 'Регистрация прошла успешно!';
      } catch (err) {
        if (err.response && err.response.status === 409) {
          alertMessage.value = err.response.data.message;
        } else {
          alertMessage.value = 'Ошибка при сохранении данных.';
          console.error(err);
        }
      }
      showAlert.value = true;
    }
  } catch (error) {
    alertMessage.value = 'Ошибка при сохранении данных.';
    showAlert.value = true;
    console.error(error);
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

        <div class="mb-4" v-if="!editMode">
          <label class="block text-gray-700">Повторите пароль</label>
          <input
            v-model="confirmPassword"
            type="password"
            class="w-full px-3 py-2 border rounded-md outline-none focus:ring-2 focus:ring-red-200"
            required
          />
        </div>

        <div class="mb-4">
          <label class="block text-gray-700">Почта</label>
          <input v-model="email" type="email" class="w-full px-3 py-2 border rounded-md outline-none focus:ring-2 focus:ring-red-200" required />
        </div>

        <div class="mb-4" v-if="!isAdmin">
          <label class="block text-gray-700">Телефон</label>
          <input v-model="phone" type="tel" class="w-full px-3 py-2 border rounded-md outline-none focus:ring-2 focus:ring-red-200" />
        </div>

        <div class="mb-4 flex items-start space-x-2" v-if="!editMode">
          <input
            id="agree"
            type="checkbox"
            v-model="agreeToTerms"
            class="mt-1"
          />
          <label for="agree" class="text-gray-700 text-sm cursor-pointer">
            Я даю согласие на обработку персональных данных
          </label>
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

    <AlertMessage
      v-if="showAlert"
      :message="alertMessage"
      @close="closeAlert"
    />
  </div>
</template>
