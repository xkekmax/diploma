<template>
  <div class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
    <div
      v-if="isDelete"
      class="bg-orange-50 border-l-4 border-red-400 text-red-800 px-6 py-6 rounded shadow-md max-w-md w-full text-center"
    >
      <p class="text-lg font-semibold mb-4">{{ message }}</p>
      <div class="flex justify-center gap-4">
        <button
          @click="$emit('confirm')"
          class="bg-red-400 text-white px-4 py-2 rounded hover:bg-red-500"
        >
          Да
        </button>
        <button
          @click="$emit('cancel')"
          class="bg-orange-50 border border-red-400 border-1 px-4 py-2 rounded hover:bg-orange-100"
        >
          Нет
        </button>
      </div>
    </div>

    <div
      v-else
      class="bg-orange-50 border-l-4 border-red-400 text-red-800 px-6 py-6 rounded shadow-md max-w-md w-full text-center"
      role="alert"
    >
      <p class="text-lg">{{ message }}</p>
      <div class="flex justify-center mt-4">
        <button
          @click="$emit('close')"
          class="bg-red-400 hover:bg-red-500 text-white font-semibold py-1 px-4 rounded"
        >
          Ок
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
defineProps({
  message: String,
  isDelete: Boolean
});
defineEmits(['confirm', 'cancel', 'close']);
</script>
