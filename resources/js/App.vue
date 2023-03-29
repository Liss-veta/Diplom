<template>
    <div id="app">
      <!-- Сейчас мы будем здесь писать свой код-->
      <v-app>
        <ProfilHeader v-if="this.$route.fullPath === '/profile'"></ProfilHeader>
        <Header v-else></Header>
        <v-main class="orange lighten-5">
          <router-view></router-view>
        </v-main>
      </v-app>
    </div>
  </template>
  <script>
  import ProfilHeader from "./components/Master/ProfilHeader.vue"
  import Header from "./components/Base/Header.vue"
  export default {
    name: 'App',
    data: () => ({
        expand: false,
      }),
      components: {
        ProfilHeader,
        Header
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