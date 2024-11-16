import { createRouter, createWebHistory } from "vue-router";
import HomePage from './components/HomePage.vue';
import BookPage from './components/BookPage.vue'

const bookId = 11;
export default createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/books', component: HomePage, alias: '/'},
    { path: '/book/' + bookId, component: BookPage },
  ]
})
