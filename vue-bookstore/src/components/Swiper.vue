<!-- eslint-disable vue/multi-word-component-names -->
<script>
  // import Swiper core and required modules
  import { Navigation, Pagination, Scrollbar, A11y } from 'swiper/modules';

  // Import Swiper Vue.js components
  import { Swiper, SwiperSlide } from 'swiper/vue';

  // Import Swiper styles
  import 'swiper/css';
  import 'swiper/css/navigation';
  import 'swiper/css/pagination';
  import 'swiper/css/scrollbar';

  // Import Swiper styles
  export default {
    components: {
      Swiper,
      SwiperSlide,
    },
    setup() {
      const onSwiper = (swiper) => {
        console.log(swiper);
      };

      return {
        onSwiper,
        modules: [Navigation, Pagination, Scrollbar, A11y],
      };
    },
  };
</script>

<template>
  <swiper
    :modules="modules"
    :slides-per-view="1"
    :space-between="50"
    navigation
    :loop=true
    :pagination="{ clickable: true }"
    @swiper="onSwiper"
    class="mb-12"
  >
    <swiper-slide class="justify-items-center"><img class="w-4/5" src="/world-book-banner2.jpg"/></swiper-slide>
    <swiper-slide class="justify-items-center"><img class="w-4/5" src="/world-book-banner.jpg"/></swiper-slide>
    <swiper-slide class="justify-items-center"><img class="w-4/5" src="/world-book-banner3.jpg"/></swiper-slide>
    <swiper-slide class="justify-items-center"><img class="w-4/5" src="/world-book-banner4.jpg"/></swiper-slide>
    <swiper-slide class="justify-items-center"><img class="w-4/5" src="/world-book-banner5.jpg"/></swiper-slide>
  </swiper>
</template>