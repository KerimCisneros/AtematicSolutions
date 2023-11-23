import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const routes = [
  {
    path: '/Atem',
    name:'Atem',
    //Aqui no se puede usar la funcion de componente, por eso usamos la funcion
    //window.location.href = "url" para poder hacer la conexion a algo externo
     beforeEnter(to, from, next) {
      window.location.href = "http://atem.net/Home/";
    }
  },
  {
    path: '/',
    name: 'home',
    component: HomeView,
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
