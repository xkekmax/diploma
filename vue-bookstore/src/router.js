import { createRouter, createWebHistory } from "vue-router";
import BookPage from './components/BookPage.vue'
import Favorites from "./pages/Favorites.vue";
import Home from "./pages/Home.vue";

export default createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/books',
      name: 'Home',
      component: Home,
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
      path: '/favorites',
      name: 'Favorites',
      component: Favorites,
      props: true
    },
  ]
})
