<template>
  <div id="app">
    <!-- Сейчас мы будем здесь писать свой код-->
    <v-app>
      <div v-if="this.$header == '/admin'">
        <v-navigation-drawer class="bg-pink-lighten-3" theme="dark" permanent>
          <div class="w-100 text-center pt-4">
            <v-avatar color="grey" size="150">
              <v-img cover src="https://cdn.vuetifyjs.com/images/profiles/marcus.jpg"></v-img>
            </v-avatar>
            <v-list-item class="text-white" title="Администратор"
              :subtitle='"Добро пожаловать, " + this.name'></v-list-item>
          </div>
          <hr>
          <v-list color="transparent">
            <v-list-item @click.prevent="this.isThere = 'Главная'" prepend-icon="mdi-view-dashboard"
              title="Главная"></v-list-item>
            <v-list-item @click.prevent="this.isThere = 'Мастера'" prepend-icon="mdi-account-box" title="Мастера"></v-list-item>
            <v-list-item @click.prevent="this.isThere = 'Советы'" prepend-icon="mdi-lightbulb-on" title="Советы"></v-list-item>
            <v-list-item @click.prevent="this.isThere = 'Заявки'" prepend-icon="mdi-list-box" title="Заявки"></v-list-item>
            <v-list-item @click.prevent="this.isThere = 'Сотрудничество'" prepend-icon="mdi-account-multiple-plus" title="Сотрудничество"></v-list-item>
            <v-list-item @click.prevent="this.isThere = 'Предложения'" prepend-icon="mdi-card-account-details" title="Предложения"></v-list-item>
          </v-list>

          <template v-slot:append>
            <div class="pa-2">
              <v-btn v-on:click="logout" block>
                Выйти
              </v-btn>
            </div>
          </template>
        </v-navigation-drawer>
      </div>
      <Header v-if="show"></Header>
      <v-main class="orange lighten-5">
        <v-toolbar v-if="this.$route.fullPath === '/admin'" class="bg-light-green-lighten-1 pt-4 pl-12" elevation="4" dense>
          <h1>{{ this.isThere }}</h1></v-toolbar>
        <router-view></router-view>
        <HomeEdit v-if="this.isThere == 'Главная' && this.$route.fullPath === '/admin'" />
        <MastersEdit v-if="this.isThere == 'Мастера' && this.$route.fullPath === '/admin'" />
        <SovetsEdit v-if="this.isThere == 'Советы' && this.$route.fullPath === '/admin'" />
        <ApplicationsEdit v-if="this.isThere == 'Заявки' && this.$route.fullPath === '/admin'" />
        <CooperationEdit v-if="this.isThere == 'Сотрудничество' && this.$route.fullPath === '/admin'" />
        <OfferEdit v-if="this.isThere == 'Предложения' && this.$route.fullPath === '/admin'" />
      </v-main>
    </v-app>
  </div>
</template>
<script>
import Header from "./components/Base/Header.vue"
import HomeEdit from "./components/Admin/HomeEdit.vue";
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
    show: 'true'
  }),
  components: {
    Header,
    HomeEdit,
    MastersEdit,
    SovetsEdit,
    ApplicationsEdit,
    CooperationEdit,
    OfferEdit
  },
  methods: {
    logout() {
      axios.get('/api/logout', {
        headers: { "Authorization": "Bearer " + this.token }
      }).then(response => {
        location.reload()
        localStorage.clear()
        this.$router.push('/')
      }).catch(response => { console.log(response) })

    }
  },
}
</script>
<style>
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
}</style>