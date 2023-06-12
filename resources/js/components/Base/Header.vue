<template>
  <div>
    <v-app-bar app dark color="light-green-lighten-1" height="80">
      <div class="uk-navbar-right">
        <a class="uk-navbar-toggle" href="#modal-full" uk-toggle>
          <v-btn color="black" icon="mdi-magnify"></v-btn>
        </a>
      </div>
      <div id="modal-full" style="background: rgba(0,0,0,.9);" uk-modal>
        <div class="uk-flex uk-flex-center uk-flex-column uk-flex-middle" uk-height-viewport>
          <button class="uk-modal-close text-white mb-10" type="submit" uk-close></button>
          <form @submit.prevent="send()" class="uk-search uk-search-large text-white">
            <input class="uk-search-input uk-text-center text-white" v-model="this.searchInput" type="search"
              placeholder="Search" aria-label="Search" autofocus>
          </form>
          <div class="comanda_laptop position-relative" v-for="master in searchHandler" :key="master">
            <div uk-scrollspy="cls: uk-animation-slide-left; repeat: true" class="prof"><img :src="master.avatar" alt="">
            </div>
            <div uk-scrollspy="cls: uk-animation-slide-right; repeat: true" class="textprof">
              <form>
                <fieldset class="topfiel">
                  <legend>
                    <div class="btn_first">
                      <router-link :to="'/profile/' + master.id"><span
                          class="noselect uk-modal-close">Подробнее</span></router-link>
                    </div>
                  </legend>
                  <div class="cartochka d-flex flex-column mb-4">
                    <h2 class="ml-6">{{ master.name }} {{ master.surname }}
                      <router-link :to="'/profile/' + master.id"><v-btn dark
                          class="but_com550 pink accent-1 uk-modal-close">
                          Подробнее
                        </v-btn></router-link>
                    </h2>
                    <div class="d-flex flex-column justify-content-between pb-12 pb-sm-8 pb-md-2 pb-lg-0 pb-xl-0 ml-6">
                      <div>
                        <h5 class="text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">{{ master.staj }} года</h5>
                        <h5 class="text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">от {{ master.min_cena }}р</h5>
                        <h5 class="text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">{{ master.city }}</h5>
                      </div>
                      <div>
                        <p>Стаж</p>
                        <p>Стоимость</p>
                        <p>Город</p>
                      </div>
                    </div>
                  </div>
                </fieldset>
                <fieldset class="bottomfiel">
                  <legend v-if="master.tag.length > 0">
                    <v-chip v-for="(tag, i) in master.tag" :key="tag" size="large" class="mr-2" label
                      :color="i % 2 == 0 ? 'light-green-lighten-3' : 'pink-lighten-4'" text-color="white">
                      {{ tag.id_tag.tag_name }}
                    </v-chip>
                  </legend>
                </fieldset>
              </form>
            </div>
          </div>
        </div>
      </div>
      <v-spacer></v-spacer>
      <v-app-bar-nav-icon large class="ma-2" @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-spacer></v-spacer>
      <Menu_auth></Menu_auth>

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
import Menu_auth from './Menu_auth.vue'
export default {
  name: 'v-Header',
  components: {
    Auth,
    Application,
    Menu_auth
  },
  computed: {
    searchHandler() {
      return this.masters.filter(master => {
        const name_surname = master.name + ' ' + master.surname;
        return name_surname.toLowerCase().includes(this.searchInput.toLowerCase())
      })
    },
  },
  data: () => ({
    searchInput: '',
    drawer: false,
    group: null,
    expand: false,
    drawerVisible: false,
    token: localStorage.getItem('token'),
    role: localStorage.getItem('role'),
    masters: [],
    tags: [],
    my_id_user: localStorage.getItem('id'),
    file: '',
    file_ava: '',
    text: '',
    master: {
      name: '',
      surname: '',
      age: '',
      city: '',
      staj: '',
      clients_count: '',
      min_cena: '',
      description: '',
      avatar: '',
    },
  }),
  mounted() {
    this.getMasters()
  },
  methods: {
    getMasters() {
      axios.get('/api/masters').then(response => {
        this.masters = response.data.content;
        console.log(this.masters)
      }).catch(response => { console.log(response) })
    }
  },
  watch: {
    group() {
      this.drawer = false
    },
  },
}
</script>

<style scoped>
.comanda_laptop {
  padding-left: 53px;
  margin-right: 73vw;
  position: relative;
  margin-bottom: 10vw;
  margin-top: 48px;
}

.prof {
  width: 20vw;
  height: 20vw;
  object-fit: cover;
  text-align: center;
  background-color: rgb(0, 0, 0);
  text-align: center;
  margin: 0;
  position: relative;
  z-index: 1;
}

.prof1 {
  width: 20vw;
  height: 20vw;
  object-fit: cover;
  text-align: center;
  background-color: rgb(0, 0, 0);
  text-align: center;
  margin: 0;
  position: relative;
  z-index: 1;
}

.prof img,
.prof1 img {
  height: 100%;
  width: 100%;
  object-fit: cover;
  object-position: top;
}

.prof::after {
  content: "";
  position: absolute;
  left: 30%;
  bottom: -15%;
  width: 20vw;
  height: 20vw;
  z-index: -1;
  background-color: #FF4081;
  transform: translateX(-50%);
}

.prof1::before {
  content: "";
  position: absolute;
  left: 70%;
  bottom: -15%;
  width: 20vw;
  height: 20vw;
  z-index: -1;
  background-color: #FF4081;
  transform: translateX(-50%);
}

.textprof,
.textprof1 {
  position: absolute;
  left: 5%;
  top: 14%;
  width: 90vw;
}

.topfiel {
  width: 100%;
  padding: 20px 40px 0 20px;
  margin: 0;
  border: 1px solid white;
  display: flex;
  justify-content: end;
  border-bottom: none;
  min-width: 100%;
}

.topfiel1 {
  width: 100%;
  min-width: auto;
  padding: 20px 40px 0 20px;
  margin: 0;
  border: 1px solid black;
  display: flex;
  justify-content: start;
  border-bottom: none;
}

.topfiel>legend {
  padding: 3px 6px;
  float: none;
  width: auto;
  font-size: 20px;
  /* Расположение конпки на fieldset */
  margin-left: 80vw;
}

.topfiel1>legend {
  padding: 3px 6px;
  float: none;
  width: auto;
  font-size: 20px;
  margin-left: -10vh;
}

.bottomfiel,
.bottomfiel1 {
  width: 100%;
  min-width: auto;
  padding: 0 10px 0 10px;
  margin: 0;
  height: 0;
  border: 1px solid white;
  border-bottom: none;
  transform: rotate(180deg);
}

.bottomfiel>legend {
  color: white;
  padding: 3px 6px;
  float: none;
  width: auto;
  margin-left: 0;
  font-size: 2em;
  transform: rotate(180deg);
  display: flex;
}

.bottomfiel>legend>div {
  margin-right: 10px;
}

.bottomfiel>legend>div>img {
  height: 95px;
  width: 95px;
  object-fit: cover;
}

.bottomfiel1>legend {
  color: white;
  padding-top: 3px;
  margin-left: 67vw;
  float: none;
  width: auto;
  margin-right: 0;
  font-size: 2em;
  transform: rotate(180deg);
  display: flex;
}

.bottomfiel1>legend>div {
  margin-left: 1.5vh;
}

.bottomfiel1>legend>div>img {
  height: 95px;
  width: 95px;
  object-fit: cover;
}

.cartochka {
  width: 75%;
  color: white;
}

.cartochka>div {
  width: 50%;
  color: white;
}

.cartochka>div>div {
  color: white;
  display: flex;
  width: 100%;
  justify-content: space-between;
}

.cartochka>div>div>h5,
.cartochka>div>div>p {
  color: white;
  margin: 0;
}

.cartochka>h2 {
  color: white;
  display: flex;
  justify-content: space-between;
}

.btn_first {
  width: 150px;
  height: 50px;
  border: 1px solid #ffffff;
  font-family: 'Cinzel', serif;
  font-size: 20px;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  z-index: 0;
  transition: 1s;
}

.btn_first::before,
.btn_first::after {
  position: absolute;
  background-color: #ff6196;
  z-index: -1;
  transition: 1s;
  content: '';
}

.btn_first::before {
  height: 50px;
  width: 130px;
}

.btn_first::after {
  width: 150px;
  height: 30px;
}

.noselect {
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.btn_first:hover::before {
  width: 0px;
  background: #F06292;
  color: white;
}

.btn_first:hover::after {
  height: 0px;
  background: #F06292;
  color: white;
}

.btn_first:hover {
  background: #F06292;
  color: white;
}

.btn_first a {
  text-decoration: none;
  color: white;
}

.btn_first a:hover::before,
.btn_first a:hover::after {
  color: white;
}

.but_com550 {
  display: none;
}

@media screen and (max-width: 1150px) {
  .topfiel>legend {
    margin-left: 76vw;
  }

  .comanda_laptop {
    margin-bottom: 20vw;
  }

  .two {
    margin-top: 10vw;
  }

  .bottomfiel1>legend {
    margin-left: 58vw;
  }
}

@media screen and (max-width: 960px) {
  .topfiel>legend {
    margin-left: 70vw;
  }

  .topfiel1>legend {
    margin-left: -6vw;
  }

  .cartochka {
    width: 50%;
  }

  .cartochka>div {
    width: 100%;
  }

  .prof::after,
  .prof1::after,
  .prof1::before {
    content: none;
  }

  .prof,
  .prof1 {
    width: 40vw;
    height: 40vw;
  }

  .prof1 {
    margin-right: 0;
    margin-left: auto;
  }

  .comanda_laptop {
    padding-left: 0;
  }

  .bottomfiel>legend {
    margin-left: 2vw;
  }

  .bottomfiel>legend>div {
    margin-right: 40px;
  }

  .bottomfiel1>legend {
    margin-left: 43vw;
    margin-right: 0;
    font-size: 2em;
  }

  .bottomfiel1>legend>div {
    margin-left: 40px;
  }
}

@media screen and (max-width: 850px) {
  .bottomfiel>legend {
    margin-left: 1vw;
  }

  .bottomfiel>legend>div {
    margin-right: 20px;
  }

  .bottomfiel1>legend {
    margin-left: 43vw;
  }

  .bottomfiel1>legend>div {
    margin-left: 20px;
  }
}

@media screen and (max-width: 700px) {
  .topfiel>legend {
    margin-left: 66vw;
  }

  .bottomfiel1>legend {
    margin-left: 38vw;
  }
}

@media screen and (max-width: 600px) {
  .topfiel>legend {
    margin-left: 62vw;
  }

  .comanda_laptop {
    margin-bottom: 40vw;
  }

  .bottomfiel1>legend {
    margin-left: 35vw;
  }
}

@media screen and (max-width: 550px) {

  .topfiel,
  .topfiel1 {
    margin-top: 10vw;
    justify-content: end;
  }

  .cartochka {
    width: 90%;
    padding-top: 37vw;
  }

  .prof,
  .prof1 {
    margin: 0 auto;
    width: 70vw;
    height: 50vw;
  }

  .topfiel>legend,
  .topfiel1>legend {
    display: none;
  }

  .comanda_laptop {
    margin-bottom: 65vw;
  }

  .bottomfiel>legend {
    margin-left: 6vw;
  }

  .bottomfiel>legend>div {
    margin-right: 40px;
  }

  .bottomfiel1>legend {
    margin-left: 7vw;
  }

  .bottomfiel1>legend>div {
    margin-left: 40px;
  }

  .but_com550 {
    display: block;
  }
}

@media screen and (max-width: 500px) {
  .comanda_laptop {
    margin-bottom: 85vw;
  }

  .cartochka>h2 {
    width: 100%;
    row-gap: 20px;
    flex-direction: column;
  }
}

@media screen and (max-width: 471px) {
  .bottomfiel>legend {
    margin-left: 1vw;
  }

  .bottomfiel1>legend {
    margin-left: 2vw;
  }

  .comanda_laptop {
    margin-bottom: 88vw;
  }
}

@media screen and (max-width: 400px) {
  .bottomfiel>legend {
    margin-left: 1vw;
  }

  .comanda_laptop {
    margin-bottom: 120vw;
  }

  .bottomfiel>legend>div {
    margin-right: 10px;
  }

  .bottomfiel1>legend>div {
    margin-left: 10px;
  }

  .topfiel,
  .topfiel1 {
    padding: 10px 5px 0 10px;
    justify-content: center;
  }
}

.searchInput {
  color: white;
  font-size: 2rem;
}

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
  background: #000000;
  opacity: 0.9;
  z-index: 199;
  transition: opacity 0.2s;
}

@media (min-width: 330px) and (max-width: 600px) {
  .v-header {
    width: 100%;
  }
}
</style>