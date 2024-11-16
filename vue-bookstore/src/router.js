import { createRouter, createWebHistory } from "vue-router";
import HomePage from './components/HomePage.vue';
import BookPage from './components/BookPage.vue'

export default createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/books',
      name: 'HomePage',
      component: HomePage,
      alias: '/',
      props: true
    },
    {
      path: '/book/:id',
      name: 'BookPage',
      component: BookPage,
      props: true
    },
  ]
})
