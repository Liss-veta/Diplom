<template>
    <div id="app">
      <!-- Сейчас мы будем здесь писать свой код-->
      <v-app>
        <ProfilHeader v-if="this.$route.fullPath === '/profile/' + this.$route.params.id"></ProfilHeader>
        <div v-if="this.$route.fullPath === '/admin'">
          <v-navigation-drawer class="bg-pink-lighten-3" theme="dark" permanent>
                <div class="w-100 text-center pt-4">
                        <v-avatar color="grey" size="150">
                            <v-img cover src="https://cdn.vuetifyjs.com/images/profiles/marcus.jpg"></v-img>
                        </v-avatar>
                        <v-list-item class="text-white" title="Администратор" :subtitle='"Добро пожаловать, " + this.name'></v-list-item>
                </div>
                <hr>
                <v-list color="transparent">
                    <v-list-item @click.prevent="this.isThere = 1" prepend-icon="mdi-view-dashboard" title="Главная"></v-list-item>
                    <v-list-item @click.prevent="this.isThere = 2" prepend-icon="mdi-account-box" title="Мастера"></v-list-item>
                    <v-list-item @click.prevent="this.isThere = 3" prepend-icon="mdi-gavel" title="Советы"></v-list-item>
                    <v-list-item @click.prevent="this.isThere = 4" prepend-icon="mdi-gavel" title="Заявки"></v-list-item>
                    <v-list-item @click.prevent="this.isThere = 5" prepend-icon="mdi-gavel" title="Сотрудничество"></v-list-item>
                    <v-list-item @click.prevent="this.isThere = 6" prepend-icon="mdi-gavel" title="Предложения"></v-list-item>
                </v-list>

                <template v-slot:append>
                    <div class="pa-2">
                        <v-btn block>
                            Выйти
                        </v-btn>
                    </div>
                </template>
            </v-navigation-drawer>
        </div>
        <Header v-else></Header>
        <v-main class="orange lighten-5">
          <v-toolbar v-if="this.$route.fullPath === '/admin'" class="bg-light-green-lighten-1" elevation="4" dense title="Application"></v-toolbar>
          <router-view></router-view>
          <HomeEdit v-if="this.isThere == 1"/>
          <MastersEdit v-if="this.isThere == 2"/>
          <SovetsEdit v-if="this.isThere == 3"/>
          <ApplicationsEdit v-if="this.isThere == 4"/>
          <CooperationEdit v-if="this.isThere == 5"/>
          <OfferEdit v-if="this.isThere == 6"/>
        </v-main>
      </v-app>
    </div>
  </template>
  <script>
  import ProfilHeader from "./components/Master/ProfilHeader.vue"
  import Header from "./components/Base/Header.vue"
  import HomeEdit from "./components/Admin/HomeEdit.vue";
  import MastersEdit from "./components/Admin/MastersEdit.vue";
  import SovetsEdit from "./components/Admin/SovetsEdit.vue";
  import ApplicationsEdit from "./components/Admin/ApplicationsEdit.vue";
  import CooperationEdit from "./components/Admin/CooperationEdit.vue";
  import OfferEdit from "./components/Admin/OfferEdit.vue";
  export default {
    name: 'App',
    data: () => ({
        expand: false,
        isThere: 1,
        name: localStorage.getItem('name')
      }),
      components: {
        ProfilHeader,
        Header,
        HomeEdit,
        MastersEdit,
        SovetsEdit,
        ApplicationsEdit,
        CooperationEdit,
        OfferEdit
      },
  }
  </script>
  <style>
  .text-color{
    color: white;
  }
  .text-color::placeholder{
    color: rgb(90, 154, 77);
  }
  .menu-position {
    position: fixed;
    z-index: 100;
    left: 17%; 
  }
  
  .spisok > a {
    width: 100%;
    height: 100%;
    color: white;
  }
  
  .spisok:active{
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
  </style>