<template>
  <div>
    <div class="btn_first" href="#modal-application" uk-toggle dark v-on="on">
      <span class="noselect">Записаться</span>
    </div>
    <div id="modal-application" uk-modal>
      <div class="uk-modal-dialog uk-modal-body">
        <button class="uk-modal-close-default" type="button" uk-close></button>
        <h2 class="uk-modal-title">Заявка мастеру</h2>
        <span>Чтобы связаться с мастером заполнте поля и следите за статусом вашей заявки</span>
        <v-col cols="12">
          <v-text-field type="email" v-model="this.application_email" label="Электронная почта*" required></v-text-field>
        </v-col>
        <v-col cols="12">
          <v-text-field label="Телефон*" v-model="this.application_number" type="number" required></v-text-field>
        </v-col>
        <v-col cols="12">
          <v-text-field label="Комментарий*" v-model="this.application_comment" type="textarea" required></v-text-field>
        </v-col>
        <p class="uk-text-right">
          <!-- <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button> -->
          <button class="uk-button bg-pink-lighten-3 uk-modal-close text-white" type="button" @click.prevent="add_Application()">Отправить</button>
        </p>
      </div>
    </div>
    <!-- <v-dialog v-model="dialog" persistent max-width="600px">
        <template v-slot:activator="{ on }">
          <div class="btn_first" dark v-on="on" >
            <span class="noselect">Записаться</span>
          </div>
        </template>
        <v-card>
          <v-card-title>
            <span class="text-h5">Записаться к мастеру</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>
                <v-col cols="12">
                  <v-text-field type="email" label="Электронная почта*" required ></v-text-field>
                </v-col>
                <v-col cols="12">
                  <v-text-field label="Телефон*" type="number" required></v-text-field>
                </v-col>
                <v-col cols="12">
                  <v-text-field label="Комментарий*" type="textarea" required></v-text-field>
                </v-col>
              </v-row>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue-darken-1" text @click="dialog = false">
              Закрыть
            </v-btn>
            <v-btn color="blue-darken-1" text @click="dialog = false">
              Отправить заявку
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog> -->
  </div>
</template>
<script>
export default {
  name: "v-DialogZapis",
  data: () => ({
    dialog: false,
    application_email:'',
    application_number:'',
    application_comment:'',
    id_master: '',
    token: localStorage.getItem('token'),
    id: localStorage.getItem('id')
  }),
  methods: {
    add_Application(){
      this.id_master = this.$route.params.id
      if (this.application_comment && this.application_email && this.application_number) {
                axios.post('/api/user/application_create', JSON.stringify({
                        'email': this.application_email,
                        'number': this.application_number,
                        'text': this.application_comment,
                        'id_master': this.id_master,
                        'id_user': this.id
                }), {
                    headers: {
                        "Content-type": "application/json",
                        "Accept": "application/json",
                        'Authorization': 'Bearer ' + this.token
                    }
                }).then(response => {
                  console.log(response);
                }).catch(response => {
                    console.log(response.response.data.message)
                })
            }
            else this.message_error = 'Заполните все поля!'
    }
  }
}
</script>

<style>
.btn_first {
  width: 150px;
  height: 40px;
  border: 1px solid #333;
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
  background: #F8BBD0;
  z-index: -1;
  transition: 1s;
  content: '';
}

.btn_first::before {
  height: 40px;
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
  color: black;
}

.btn_first a:hover::before,
.btn_first a:hover::after {
  color: white;
}
</style>