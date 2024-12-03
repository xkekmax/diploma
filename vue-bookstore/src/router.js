import { createRouter, createWebHistory } from "vue-router";
import HomePage from './components/HomePage.vue';
import BookPage from './components/BookPage.vue'
import DrawerPage from "./components/DrawerPage.vue";

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
    {
      path: '/drawer',
      name: 'DrawerPage',
      component: DrawerPage,
      props: true
    },
  ]
})
