import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../web/HomeView.vue'
import NotFound from '../web/NotFound.vue'
import AboutView from '../web/AboutView.vue'
import MasterView from '../web/MasterView.vue'
import SovetView from '../web/SovetView.vue'
import ProfilHeader from '../components/Master/ProfilHeader.vue'
import FormMasterView from "../web/FormMasterView.vue"
import AdminView from "../web/AdminView.vue"
// import NotFound from "../components/Base/Menu_auth.vue"

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
    path: '/admin',
    component:  AdminView,
  },
  {
    path: '/profile/:id',
    component:  ProfilHeader,
  },
  {
    path: '/:pathMatch(.*)*', component: NotFound
  }
]
const router = new createRouter({
  history: createWebHistory(),
  routes
})
export default router
