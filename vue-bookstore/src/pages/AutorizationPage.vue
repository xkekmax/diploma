<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import Autorization from '@/components/Autorization.vue';
import Registration from '@/components/Registration.vue';
import InfoBlock from '@/components/InfoBlock.vue';
import BookList from '@/components/BookList.vue'; // Импортируем компонент для отображения книг

const isRegistering = ref(false);
const orders = ref([]);
const isAuthorized = !!localStorage.getItem('user_id');

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

onMounted(() => {
  if (isAuthorized) fetchOrders();
});

const switchToRegister = () => isRegistering.value = true;
const switchToLogin = () => isRegistering.value = false;
</script>

<template>
  <div>
    <Autorization v-if="!isAuthorized && !isRegistering" @goToRegister="switchToRegister" />
    <Registration v-if="!isAuthorized && isRegistering" @goToLogin="switchToLogin" />

    <div v-if="isAuthorized" class="space-y-4">
      <h2 class="text-3xl font-bold text-orange-900 mb-8">Мои заказы</h2>

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
            <h3 class="my-4 text-xl font-semibold text-red-400">Заказ №{{ order.id_order }} на: {{ new Date(order.order_date).toLocaleDateString() }}</h3>
            <BookList :items="order.books" />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
