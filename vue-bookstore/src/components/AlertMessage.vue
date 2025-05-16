<template>
  <div class="fixed inset-0 bg-black opacity-50 z-40"></div>
  <div
    class="fixed top-1/3 left-1/2 transform -translate-x-1/2 -translate-y-1/2 z-50
          bg-orange-50 border-l-4 border-red-400 text-red-800 px-4 py-6 rounded shadow-md max-w-md w-full"
    role="alert"
  >
    <div class="flex justify-between items-start pl-4">
      <div>
        <p class="font-bold mb-6 text-red-500 text-lg ">Предупреждение</p>
        <p>{{ message }}</p>
      </div>
      <button @click="emitClose" class="text-red-400 hover:text-red-600 text-xl font-bold mr-4">&times;</button>
    </div>
  </div>
</template>

<script setup>
defineProps({
  message: String
});
const emit = defineEmits(['close']);

const emitClose = () => {
  emit('close');
};
</script>
