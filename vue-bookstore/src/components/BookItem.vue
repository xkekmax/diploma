<script setup>
import { defineProps } from 'vue';
import { useRouter } from 'vue-router';

const emit = defineEmits(['onClickRemove']);

const props = defineProps({
  code: Number,
  title: String,
  author: String,
  imageUrl: String,
  price: Number,
  quantity: Number
});

const router = useRouter();

const navigateToBookPage = () => {
  if (!props.code) {
    console.error('Error: Missing required param "code"');
    return;
  }
  router.push({ name: 'BookPage', params: { id: props.code } });
};

const handleRemoveClick = (event, codeBook) => {
  event.stopPropagation(); // Останавливаем всплытие события
  emit('onClickRemove', codeBook); // Передаем только код книги
};
</script>

<template>
  <div class="flex items-center border border-slate-200 p-5 rounded-xl gap-5"
      @click="navigateToBookPage">

    <img class="w-16 cursor-pointer" :src="props.imageUrl" :alt="props.title" />

    <div class="flex flex-col flex-1 text-sm">
      <div class="flex justify-between mb-2">
        <div class="cursor-pointer">
          <p>{{ props.title }}</p>
          <p class="text-slate-400 ">{{ props.author }}</p>
        </div>

        <img
          @click="handleRemoveClick($event, props.code)"
          class="opacity-50 hover:opacity-100 transition cursor-pointer w-7"
          src="/cancel.svg"
          alt="Close"
        />
      </div>
      <b>{{ price }} руб.</b>
        <div class="flex items-center gap-2 mt-2">
          <button @click.stop="$emit('decrease', code)" class="px-2 bg-gray-200 rounded">−</button>
          <span>{{ props.quantity }}</span>
          <button @click.stop="$emit('increase', code)" class="px-2 bg-gray-200 rounded">+</button>
        </div>
    </div>
  </div>
</template>

