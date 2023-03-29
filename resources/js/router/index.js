import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../web/HomeView.vue'
import AboutView from '../web/AboutView.vue'
import MasterView from '../web/MasterView.vue'
import SovetView from '../web/SovetView.vue'
import ProfilView from '../web/ProfilView.vue'
import FormMasterView from "../web/FormMasterView.vue"

const routes = [
  {
    path: "/",
    component: HomeView,
    alias: '/'
  },
  {
    path: '/about',
    component:  AboutView,
  },
  {
    path: '/masters',
    component:  MasterView,
  },
  {
    path: '/sovets',
    component:  SovetView,
  },
  {
    path: '/form',
    component:  FormMasterView,
  },
  {
    path: '/profile',
    component:  ProfilView,
  },
  
]
const router = new createRouter({
  history: createWebHistory(),
  routes
})
export default router
