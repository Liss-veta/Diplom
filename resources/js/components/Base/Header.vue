<template>
  <div>
    <v-app-bar app dark color="light-green-lighten-1" height="80">
      <div class="uk-navbar-right">
        <a class="uk-navbar-toggle" href="#modal-full" uk-toggle>
          <v-btn icon="mdi-magnify"></v-btn>
        </a>
      </div>
      <div id="modal-full" uk-modal>
        <div class="uk-flex uk-flex-center uk-flex-middle" uk-height-viewport>
          <button class="uk-modal-close-full" type="button" uk-close></button>
          <form class="uk-search uk-search-large">
            <input class="uk-search-input uk-text-center text-color" type="search" placeholder="Search"
              aria-label="Search" autofocus>
          </form>
        </div>
      </div>
      <v-spacer></v-spacer>
      <v-app-bar-nav-icon large class="ma-2" @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-spacer></v-spacer>
      <Auth v-if="!this.token"></Auth>
      <v-menu v-else>
        <template v-slot:activator="{ props }">
          <v-btn icon="mdi-dots-vertical" v-bind="props"></v-btn>
        </template>
        <v-list>
          <v-list-item><button>Мои заявки</button></v-list-item>
          <v-list-item v-show="this.role == 'master'"><button>Страница мастера</button></v-list-item>
          <v-list-item v-show="this.role == 'user'"><Application/></v-list-item>
          <v-list-item><button v-on:click="logout">Выйти</button></v-list-item>
        </v-list>
      </v-menu>
      <!-- modal menu top -->

      <v-navigation-drawer v-model="drawer" location="bottom" temporary class="w-75 h-100 d-flex justify-center"
        style="position:absolute; left:12.5%; right:12.5%; background-color: #9CCC65;">
        <div class="h-100 v-header d-flex align-center justify-space-around bg-transparent">
          <v-list><router-link class="text-black" to="/">Главная</router-link></v-list>
          <v-list><router-link class="text-black" to="/about">О нас</router-link></v-list>
          <button class="close" @click.stop="drawer = false" icon><v-icon large>mdi-close</v-icon></button>
          <v-list><router-link class="text-black" to="/masters">Мастера</router-link></v-list>
          <v-list><router-link class="text-black" to="/sovets">Советы</router-link></v-list>
        </div>

      </v-navigation-drawer>
    </v-app-bar>
  </div>
</template>

<script>
import axios from 'axios'
import Auth from './Auth copy.vue'
import Application from '../user/Application.vue'
export default {
  name: 'v-Header',
  components: {
    Auth,
    Application
  },
  data: () => ({
    drawer: false,
    group: null,
    expand: false,
    drawerVisible: false,
    token: localStorage.getItem('token'),
    role: localStorage.getItem('role')
  }),
  watch: {
    group() {
      this.drawer = false
    },
  },
  methods: {
    logout(){
      axios.get('api/logout', {
        headers: {"Authorization":"Bearer "+this.token}
      }).then(response => {
        location.reload()
        localStorage.clear()
      }).catch(response => {console.log(response)})
      
    }
  }
}
</script>

<style>
h4 {
  font-weight: 400;
  color: white;
}

a {
  color: tomato;
}

.close {
  background: #9CCC65;
  border: 0;
  height: 44px;
  width: 44px;
  padding-left: 14px;
  padding-right: 14px;
  margin: 0;
  cursor: pointer;
}

.top-drawer {
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  width: 0;
  /* initially */
  overflow: hidden;
  height: 80px;
  margin: auto;
  padding-left: 0;
  /* initially */
  background: #9CCC65;
  z-index: 200;
  transition: all 0.2s;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

@media screen and (max-width: 800px) {
  .top-drawer {
    flex-direction: column;
    justify-content: space-around;
    height: 300px;
  }

  .close {
    order: -1;
    padding: 0;
  }
}

.drawer-mask {
  position: absolute;
  left: 0;
  top: 0;
  width: 0;
  /* initially */
  height: 100vh;
  background: #000;
  opacity: 0.3;
  z-index: 199;
  transition: opacity 0.2s;
}

@media (min-width: 330px) and (max-width: 600px) {
  .v-header {
    width: 100%;
  }
}
</style>