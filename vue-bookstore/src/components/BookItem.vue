<script setup>
const emit = defineEmits(['onClickRemove'])

defineProps({
  code: Number,
  title: String,
  author: String,
  imageUrl: String,
  price: Number,
})
</script>

<template>
  <div class="flex items-center border border-slate-200 p-5 rounded-xl gap-5">
    <img class="w-20 h-22 cursor-pointer" :src="imageUrl" :alt="title" />

    <div class="flex flex-col flex-1">
      <div class="flex justify-between mb-2">
        <div class="cursor-pointer">
          <p>{{ title }}</p>
          <p class="text-slate-400">{{ author }}</p>
        </div>

        <img
          @click="emit('onClickRemove')"
          class="opacity-50 hover:opacity-100 transition cursor-pointer"
          src="/cancel.svg"
          alt="Close"
        />
      </div>
      <b>{{ price }} руб.</b>
    </div>
  </div>
</template>
