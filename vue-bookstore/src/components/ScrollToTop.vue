<!-- components/ScrollToTop.vue -->
<script setup>
import { ref, onMounted, onUnmounted } from 'vue';

const showButton = ref(false);

const handleScroll = () => {
  showButton.value = window.scrollY > 300;
};

const scrollToTop = () => {
  window.scrollTo({ top: 0, behavior: 'smooth' });
};

onMounted(() => {
  window.addEventListener('scroll', handleScroll);
});

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll);
});
</script>

<template>
  <button
    v-if="showButton"
    @click="scrollToTop"
    class="fixed bottom-6 left-12 bg-white hover:bg-gray-100 px-4 py-2 rounded-full shadow-lg transition-opacity duration-300"
  >
    <div class="flex items-center space-x-4">
      <img src="/arrow.svg" class="w-7 rotate-90 opacity-70" />
    </div>
  </button>
</template>
