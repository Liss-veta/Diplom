<template>
  <div id="app">
    <!-- Сейчас мы будем здесь писать свой код-->
    <v-app>
      <div v-if="checkRole && this.$route.fullPath === '/admin'">
        <v-navigation-drawer class="bg-pink-lighten-3" theme="dark" permanent>
          <div class="w-100 text-center pt-4">
            <v-avatar color="grey" size="150">
              <v-img cover src="assets/Без имени.png"></v-img>
            </v-avatar>
            <v-list-item class="text-white" title="Администратор"
              :subtitle='"Добро пожаловать, " + this.name'></v-list-item>
          </div>
          <hr>
          <v-list color="transparent">
            <v-list-item @click.prevent="this.isThere = 'Главная'" prepend-icon="mdi-view-dashboard"
              title="Главная"></v-list-item>
              <v-list-item @click.prevent="this.isThere = 'О нас'" prepend-icon="mdi-cogs"
              title="О нас"></v-list-item>
            <v-list-item @click.prevent="this.isThere = 'Мастера'" prepend-icon="mdi-account-box"
              title="Мастера"></v-list-item>
            <v-list-item @click.prevent="this.isThere = 'Советы'" prepend-icon="mdi-lightbulb-on"
              title="Советы"></v-list-item>
            <v-list-item @click.prevent="this.isThere = 'Заявки'" prepend-icon="mdi-list-box"
              title="Заявки"></v-list-item>
            <v-list-item @click.prevent="this.isThere = 'Сотрудничество'" prepend-icon="mdi-account-multiple-plus"
              title="Сотрудничество"></v-list-item>
            <v-list-item @click.prevent="this.isThere = 'Предложения'" prepend-icon="mdi-card-account-details"
              title="Предложения"></v-list-item>
          </v-list>

          <template v-slot:append>
            <div class="pa-2">
              <div class="w-100 d-flex"><router-link class="text-white" to="/">Перейти на сайт <img class="uk-width-2-5" src="../../public/assets/Arrow6.png"></router-link></div>
              <v-btn class="mt-2" v-on:click="logout().this.$router.push('/')" block>
                Выйти
              </v-btn>
            </div>
          </template>
        </v-navigation-drawer>
      </div>
      <Header v-else></Header>

      <div class="overlay" v-if="this.loadingStatus">
        <v-progress-circular indeterminate color="pink-accent-2"></v-progress-circular>
      </div>

      <v-main v-else style="background: #FFF5EB;">
        <v-toolbar v-if="this.$route.fullPath === '/admin'" class="bg-light-green-lighten-1 pt-4 pl-12" elevation="4"
          dense>
          <h1>{{ this.isThere }}</h1>
        </v-toolbar>
        <router-view style="background: #FFF5EB;"></router-view>
        <HomeEdit style="background: #FFF5EB;" v-if="this.isThere == 'Главная' && this.$route.fullPath === '/admin'" />
        <AboutEdit style="background: #FFF5EB;" v-if="this.isThere == 'О нас' && this.$route.fullPath === '/admin'" />
        <MastersEdit style="background: #FFF5EB;" v-if="this.isThere == 'Мастера' && this.$route.fullPath === '/admin'" />
        <SovetsEdit style="background: #FFF5EB;" v-if="this.isThere == 'Советы' && this.$route.fullPath === '/admin'" />
        <ApplicationsEdit style="background: #FFF5EB;" v-if="this.isThere == 'Заявки' && this.$route.fullPath === '/admin'" />
        <CooperationEdit style="background: #FFF5EB;" v-if="this.isThere == 'Сотрудничество' && this.$route.fullPath === '/admin'" />
        <OfferEdit style="background: #FFF5EB;" v-if="this.isThere == 'Предложения' && this.$route.fullPath === '/admin'" />
      </v-main>
    </v-app>
    <!--  notifications  -->
    <svg display="none">
      <symbol id="clock" viewBox="0 0 32 32">
        <circle r="15" cx="16" cy="16" fill="none" stroke="currentColor" stroke-width="2" />
        <polyline points="16,7 16,16 23,16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
          stroke-linejoin="round" />
      </symbol>
      <symbol id="error" viewBox="0 0 32 32">
        <circle r="15" cx="16" cy="16" fill="none" stroke="hsl(13,90%,55%)" stroke-width="2" />
        <line x1="10" y1="10" x2="22" y2="22" stroke="hsl(13,90%,55%)" stroke-width="2" stroke-linecap="round" />
        <line x1="22" y1="10" x2="10" y2="22" stroke="hsl(13,90%,55%)" stroke-width="2" stroke-linecap="round" />
      </symbol>
      <symbol id="message" viewBox="0 0 32 32">
        <polygon points="1,6 31,6 31,26 1,26" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
          stroke-linejoin="round" />
        <polyline points="1,6 16,18 31,6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
          stroke-linejoin="round" />
      </symbol>
      <symbol id="success" viewBox="0 0 32 32">
        <circle r="15" cx="16" cy="16" fill="none" stroke="hsl(93,90%,40%)" stroke-width="2" />
        <polyline points="9,18 13,22 23,12" fill="none" stroke="hsl(93,90%,40%)" stroke-width="2" stroke-linecap="round"
          stroke-linejoin="round" />
      </symbol>
      <symbol id="up" viewBox="0 0 32 32">
        <circle r="15" cx="16" cy="16" fill="none" stroke="currentColor" stroke-width="2" />
        <polyline points="11,15 16,10 21,15" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
          stroke-linejoin="round" />
        <line x1="16" y1="10" x2="16" y2="22" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
      </symbol>
      <symbol id="warning" viewBox="0 0 32 32">
        <polygon points="16,1 31,31 1,31" fill="none" stroke="hsl(33,90%,55%)" stroke-width="2" stroke-linecap="round"
          stroke-linejoin="round" />
        <line x1="16" y1="12" x2="16" y2="20" stroke="hsl(33,90%,55%)" stroke-width="2" stroke-linecap="round" />
        <line x1="16" y1="25" x2="16" y2="25" stroke="hsl(33,90%,55%)" stroke-width="3" stroke-linecap="round" />
      </symbol>
    </svg>
  </div>
</template>
<script>
import Header from "./components/Base/Header.vue"
import HomeEdit from "./components/Admin/HomeEdit.vue";
import AboutEdit from "./components/Admin/AboutEdit.vue";
import MastersEdit from "./components/Admin/MastersEdit.vue";
import SovetsEdit from "./components/Admin/SovetsEdit.vue";
import ApplicationsEdit from "./components/Admin/ApplicationsEdit.vue";
import CooperationEdit from "./components/Admin/CooperationEdit.vue";
import OfferEdit from "./components/Admin/OfferEdit.vue";
import axios from "axios";

export default {
  name: 'App',
  data: () => ({
    expand: false,
    isThere: 'Главная',
    name: localStorage.getItem('name'),
    token: localStorage.getItem('token'),
    role: localStorage.getItem('role'),
    show: 'true',
    loadingStatus: true
  }),
  computed: {
    checkRole() {
      if(localStorage.getItem('role') == 'admin') { return true }
    }
  },
  components: {
    Header,
    HomeEdit,
    AboutEdit,
    MastersEdit,
    SovetsEdit,
    ApplicationsEdit,
    CooperationEdit,
    OfferEdit
  },
  mounted() {
    this.loadingStop()
  },
  methods: {
    logout() {
      axios.get('/api/logout', {
        headers: { "Authorization": "Bearer " + this.token }
      }).then(response => {
        localStorage.clear()
        window.location.href = '/'
      }).catch(response => { console.log(response) })
    },
    loadingStop() {
      setTimeout(() => {
        this.loadingStatus = false
      }, 2500);
    }
  },
}
</script>
<style>

h1, h2, h3, h4, h5 {
  color:#3E2723;
}

.text-color {
  color: white;
}

.text-color::placeholder {
  color: rgb(90, 154, 77);
}

.menu-position {
  position: fixed;
  z-index: 100;
  left: 17%;
}

.spisok>a {
  width: 100%;
  height: 100%;
  color: white;
}

.spisok:active {
  background-color: #ceffb9;
}

.v-list-item-group .v-list-item--active {
  color: rgb(0, 0, 0);
}

* {
  scrollbar-width: thin;
  scrollbar-color: #FFD180 #FFE4C9;
}

/* для Chrome/Edge/Safari */
*::-webkit-scrollbar {
  height: 15px;
  width: 15px;
}

*::-webkit-scrollbar-track {
  background: #FFE4C9;
}

*::-webkit-scrollbar-thumb {
  background-color: #FFD180;
  border-radius: 5px;
  border: 3px solid #FFE4C9;
}

.overlay {
  position: absolute;
  background-color: white;
  z-index: 1000;
  top: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  left: 0;
  width: 100vw;
  height: 100vh;
}</style>