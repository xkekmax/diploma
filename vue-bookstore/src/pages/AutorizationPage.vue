<script setup>
import { ref, onMounted, watch } from 'vue';
import axios from 'axios';
import { useRoute } from 'vue-router';

import Autorization from '@/components/Autorization.vue';
import Registration from '@/components/Registration.vue';
import InfoBlock from '@/components/InfoBlock.vue';
import BookList from '@/components/BookList.vue';

const isRegistering = ref(false);
const isAuthorized = !!localStorage.getItem('user_id');
const route = useRoute();
const editMode = ref(false);
const userData = ref(null);
const orders = ref([]);

const fetchUserData = async () => {
  const userId = localStorage.getItem('user_id');
  const userRole = localStorage.getItem('user_role');

  if (!userId) return;

  try {
    let data;
    if (userRole === 'admin') {
      const response = await axios.get(`http://localhost:8080/witch/admin/${userId}`);
      data = response.data;
    } else {
      const response = await axios.get(`http://localhost:8080/witch/user/${userId}`);
      data = response.data;
    }

    if (data.date_of_birthday) {
      const date = new Date(data.date_of_birthday);
      data.date_of_birthday = date.toISOString().slice(0, 10);
    }

    userData.value = data;
  } catch (error) {
    console.error('Ошибка при загрузке данных пользователя:', error);
  }
};

const fetchOrders = async () => {
  const userId = localStorage.getItem('user_id');
  if (!userId) return;

  try {
    const { data } = await axios.get(`http://localhost:8080/witch/orders/${userId}`);
    orders.value = data;
  } catch (err) {
    console.error('Ошибка при загрузке заказов:', err);
  }
};

const init = async () => {
  editMode.value = route.query.edit === 'true';
  if (editMode.value) {
    await fetchUserData();
  } else if (isAuthorized) {
    await fetchOrders();
  }
};

const switchToRegister = () => {
  isRegistering.value = true;
};

const switchToLogin = () => {
  isRegistering.value = false;
};

onMounted(init);

watch(() => route.fullPath, () => {
  init();
});
</script>

<template>
  <div>
    <Autorization v-if="!isAuthorized && !isRegistering && !editMode" @goToRegister="switchToRegister"/>
    <Registration
      v-if="(isRegistering && !isAuthorized) || editMode"
      @goToLogin="switchToLogin"
      :user-data="userData"
      :edit-mode="editMode"
    />

    <div v-if="isAuthorized && !editMode" class="space-y-4">
      <h2 class="text-3xl font-bold text-red-900 mb-8">Мои заказы</h2>

      <div v-if="orders.length === 0">
        <InfoBlock
          title="У вас нет заказов"
          description="Оформите заказ, и он появится здесь"
          image-url="/drawer.png"
        />
      </div>

      <div v-else>
        <div v-for="order in orders" :key="order.id_order" class="border-b pb-4 mb-4">
          <div v-if="order.books.length > 0">
            <h3 class="my-2 text-xl font-semibold text-red-600">
              Заказ №{{ order.id_order }} на: {{ new Date(order.order_date).toLocaleDateString() }}
            </h3>

            <p class="mb-6 font-medium text-red-400">
              Сумма заказа: {{ order.total_price }} ₽
            </p>

            <BookList :items="order.books" is-favorites :show-quantity="true"/>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
