import { createRouter, createWebHistory } from "vue-router";
import BookPage from './pages/BookPage.vue'
import Favorites from "./pages/Favorites.vue";
import Autorization from "./pages/AutorizationPage.vue"
import Home from "./pages/Home.vue";
import Admin from "./pages/BookPageAdmin.vue";

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
      path: '/admin',
      name: 'AdminBookEditor',
      component: Admin,
      props: true
    },
    {
      path: '/favorites',
      name: 'Favorites',
      component: Favorites,
      props: true
    },
    {
      path: '/autorization',
      name: 'Autorization',
      component: Autorization,
      props: true
    },
    {
      path: '/profile',
      name: 'Profile',
      component: Autorization,
      props: true
    }
  ]
})
