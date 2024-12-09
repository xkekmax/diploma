import './assets/main.css'
import router from './router'
import { autoAnimatePlugin } from '@formkit/auto-animate/vue'


import { createApp } from 'vue'
import App from './App.vue'

const app = createApp(App)

app.use(autoAnimatePlugin)
app.use(router)
app.mount('#app')
