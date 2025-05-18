<template>
  <div class="fixed inset-0 bg-black opacity-50 z-40"></div>
  <div
    class="fixed top-1/3 left-1/2 transform -translate-x-1/2 -translate-y-1/3 z-50
          bg-orange-50 border-l-4 border-red-400 text-red-800 px-6 py-6 rounded shadow-md max-w-md w-full"
    role="alert"
  >
    <div class="text-center text-lg">
      <p>{{ message }}</p>
    </div>
    <div class="flex justify-center mt-4">
      <button
        @click="emitClose"
        class="bg-red-400 hover:bg-red-500 text-white font-semibold py-1 px-4 rounded"
      >
        Хорошо
      </button>
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
