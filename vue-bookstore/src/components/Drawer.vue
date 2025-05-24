<script setup>
import axios from 'axios';
import { ref, inject, computed } from 'vue';
import BookListItem from './BookListItem.vue';
import InfoBlock from './InfoBlock.vue';

const props = defineProps({
  price: Number,
  salePrice: Number,
  totalPrice: Number
})

const isCreating = ref(false)
const orderId = ref(null)

const { cart, closeDrawer } = inject('cart');

// Проверка авторизации
const isAuthorized = !!localStorage.getItem('user_id');
const showAlert = ref(false);

const createOrder = async () => {
  if (!isAuthorized) {
    showAlert.value = true;  // Показать предупреждение
    return;
  }
  isCreating.value = true;
  try {
    const id_customer = localStorage.getItem('user_id')

    const { data } = await axios.post('http://localhost:8080/witch/drawer', {
      items: cart.value.map(({ code_book, quantity }) => ({ code_book, quantity })),
      totalPrice: props.totalPrice,
      id_customer: Number(id_customer),
    });

    cart.value = []
    orderId.value = data.orderId;
    console.log(orderId.value);
  } catch (err) {
    console.log(err)
  } finally {
    isCreating.value = false
  }
}

const cartIsEmpty = computed(() => cart.value.length === 0)
const buttonDisabled = computed(() => isCreating.value || cartIsEmpty.value)

</script>

<template>
  <div class="fixed top-0 left-0 h-full w-full bg-black z-20 opacity-70"></div>
  <div class="bg-white w-full sm:w-2/3 md:w-1/2 lg:w-1/3 xl:w-1/4 h-full fixed right-0 top-0 z-20 p-8 text-sm">
    <div class="flex items-center gap-5 mb-8">
      <img @click="closeDrawer" class="opacity-50 hover:opacity-100 transition cursor-pointer hover:-translate-x-1" src="/arrow.svg" alt="arrow-left"/>
      <h2 class="text-2xl font-bold">Корзина</h2>
    </div>

    <div v-if="!totalPrice || orderId" class="flex h-full items-center">
      <InfoBlock
        v-if="!totalPrice && !orderId"
        title="Корзина пустая"
        description="Добавьте хотя бы одну книгу, чтобы сделать заказ"
        image-url="/drawer.png"
      />

      <InfoBlock
        v-if="orderId"
        title="Заказ оформлен!"
        :description="`Ваш заказ №${orderId} скоро будет передан курьерской доставке!`"
        image-url="/order.png"
      />
    </div>

    <div v-else>
      <div class="overflow-y-auto max-h-[60vh] pr-2">
        <BookListItem/>
      </div>

      <div class="flex flex-col gap-4 mt-8">

        <div class="flex gap-2">
          <span>Товар:</span>
          <div class="flex-1 border-b border-dashed"></div>
          <p>{{ price }} руб.</p>
        </div>

        <div class="flex gap-2">
          <span>Скидка:</span>
          <div class="flex-1 border-b border-dashed"></div>
          <p class="text-red-500">-{{ salePrice }} руб.</p>
        </div>

        <div class="flex gap-2">
          <span>Итого:</span>
          <div class="flex-1 border-b border-dashed"></div>
          <b>{{ totalPrice }} руб.</b>
        </div>

        <!-- Предупреждение для неавторизованного пользователя -->
        <div v-if="showAlert" class="text-red-500">
          <p>Пожалуйста, авторизуйтесь или зарегистрируйтесь, чтобы оформить заказ.</p>
        </div>

        <button
          :disabled="buttonDisabled"
          @click="createOrder"
          class="mt-4 bg-orange-300 w-full rounded-xl py-3 text-white active:bg-orange-400 transition disabled:bg-gray-300 cursor-pointer"
        >
          Оформить заказ</button>

      </div>
    </div>
  </div>
</template>
