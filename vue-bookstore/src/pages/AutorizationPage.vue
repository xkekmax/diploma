<script setup>
import { ref } from 'vue';
import Autorization from '@/components/Autorization.vue';
import Registration from '@/components/Registration.vue';

const isRegistering = ref(false);

const switchToRegister = () => {
  isRegistering.value = true;
};

const switchToLogin = () => {
  isRegistering.value = false;
};
</script>

<template>
  <div>
    <Autorization v-if="!isRegistering" @goToRegister="switchToRegister" />
    <Registration v-else @goToLogin="switchToLogin" />
  </div>
</template>
