<template>
    <div>
      <v-dialog v-model="dialog" persistent max-width="600px">
        <template v-slot:activator="{ on }">
          <div class="btn_first" color="primary" dark v-on="on" >
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
      </v-dialog>
    </div>
  </template>
<script>
export default {
    name: "v-DialogZapis",
    data: () => ({
      dialog: false,
    }),
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

.btn_first::before, .btn_first::after {
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
.btn_first a:hover::before, .btn_first a:hover::after {
    color: white;
}
</style>