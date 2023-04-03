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
  data: () => ({
    drawer: false,
    group: null,
    expand: false,
    drawerVisible: false,
    token: localStorage.getItem('token'),
    role: localStorage.getItem('role'),
    masters: [],
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
  watch: {
    group() {
      this.drawer = false
    },
  },
  // mounted() {
  //   this.showMaster()
  // },
  // methods: {
  //   logout() {
  //     axios.get('api/logout', {
  //       headers: { "Authorization": "Bearer " + this.token }
  //     }).then(response => {
  //       location.reload()
  //       localStorage.clear()
  //     }).catch(response => { console.log(response) })
  //   },
  //   showMaster() {
  //     axios.get(`/api/masters/${this.id}`, {
  //       headers: {
  //         'Accept': "application/json",
  //         "Content-type": "application/json"
  //       }
  //     }).then(response => {
  //       this.masters = response.data.content[0]
  //       this.master.name = response.data.content[0].name
  //       this.master.surname = response.data.content[0].surname
  //       this.master.age = response.data.content[0].age
  //       this.master.city = response.data.content[0].city
  //       this.master.staj = response.data.content[0].staj
  //       this.master.clients_count = response.data.content[0].clients_count
  //       this.master.min_cena = response.data.content[0].min_cena
  //       this.master.description = response.data.content[0].description
  //       console.log(this.master.name);
  //     }).catch(response => { console.log(response.data) })
  //   },
  //   update(id) {
  //     let formData = new FormData();
  //     formData.append("name", this.master.name);
  //     formData.append("surname", this.master.surname);
  //     formData.append("age", this.master.age);
  //     formData.append("city", this.master.city);
  //     formData.append("staj", this.master.staj);
  //     formData.append("clients_count", this.master.clients_count);
  //     formData.append("min_cena", this.master.min_cena);
  //     formData.append("description", this.master.description);
  //     axios.post(`/api/master/${id}/update`, formData, {
  //       headers: {
  //         "Authorization": "Bearer " + this.token,
  //       }
  //     }).then(response => {
  //       this.showMaster()
  //       console.log(response)
  //     }).catch(response => {
  //       console.log(response)
  //     })
  //   },
  //   updateAvatar(id) {
  //     let formData = new FormData();
  //     formData.append("avatar", this.file_ava);
  //     console.log(formData);
  //     axios.post(`/api/master/${id}/update_avatar`, formData, {
  //       headers: {
  //         "Authorization": "Bearer " + this.token,
  //         'Accept': "application/json",
  //         "Content-type": "multipart/form-data"
  //       }
  //     }).then(response => {
  //       this.showMaster()
  //       console.log(response)
  //     }).catch(response => {
  //       console.log(response)
  //     })
  //   },
  //   handleFileUploadAvatar() {
  //     this.file_ava = this.$refs.avatar.files[0];
  //   },
  //   handleFileUpload() {
  //     this.file = this.$refs.file.files;
  //   },
  //   add_post() {
  //     let formData = new FormData();
  //     formData.append('text', this.text);
  //     for (let index = 0; index < this.file.length; index++) {
  //       let image = this.file[index];
  //       formData.append('image[]', image);
  //     }
  //     axios.post('/api/master/post',
  //       formData,
  //       {
  //         headers: {
  //           'Content-Type': 'multipart/form-data',
  //           'Accept': 'application/json',
  //           "Authorization": "Bearer " + this.token
  //         }
  //       },
  //     ).then(_r => {
  //       this.text = ''
  //       this.file = ''
  //     })
  //       .catch(function () {
  //         console.log('FAILURE!!');
  //       });
  //   },
  // }
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