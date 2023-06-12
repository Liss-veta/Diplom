<template>
    <div class="text-center">
        <v-dialog activator="parent" v-model="dialog" class="bg-pink-lighten-3">
            <template v-slot:activator="{ props }">
                <v-btn icon="mdi-exit-to-app" v-bind="props">
                </v-btn>
            </template>
            <v-card class="di di_w ml-0 uk-width-1-1 d-flex justify-space-between" color="transparent" uk-grid>
                <button class="uk-modal-close-default" @click="dialog = false" aria-label="Close" uk-close></button>
                <div class="di uk-width-1-1 uk-height-1-1 mt-0 pl-0">
                    <v-card class="d-flex uk-width-1-1" style="height: 100%">
                        <v-tabs v-model="tab" class="bg-pink-accent-2 flex-column text-center" style="height: 100%;"
                            direction="vertical">
                            <v-tooltip class="text-center" v-model="show" location="bottom">
                                <template v-slot:activator="{ props }">
                                    <v-tab style="height: 33%" class="text-center justify-center" value="option-1">
                                        <v-icon v-bind="props" start>
                                            mdi-account
                                        </v-icon>
                                    </v-tab>
                                </template>
                                <span>Авторизация</span>
                            </v-tooltip>
                            <v-tooltip v-model="show" location="bottom">
                                <template v-slot:activator="{ props }">
                                    <v-tab style="height: 33%" class="justify-center" value="option-2">
                                        <v-icon v-bind="props" start>
                                            mdi-lock
                                        </v-icon>
                                    </v-tab>
                                </template>
                                <span>Регистрация</span>
                            </v-tooltip>
                            <v-tooltip v-model="show" location="bottom">
                                <template v-slot:activator="{ props }">
                                    <v-tab style="height: 33%" class="justify-center" value="option-3" min-width="auto">
                                        <v-icon v-bind="props" start>
                                            mdi-access-point
                                        </v-icon>
                                    </v-tab>
                                </template>
                                <span>Регистрация мастера</span>
                            </v-tooltip>
                        </v-tabs>
                        <v-window class="w-100 h-100" v-model="tab">
                            <v-window-item value="option-1" style="height: 100%">
                                <v-card class="h-100" flat>
                                    <div class="h-100 pink-lighten-3 ">
                                        <div class="uk-height-1-1 uk-width-1-1 d-flex justify-center">
                                            <div
                                                class="uk-width-2-5 h-100 d-none d-sm-block d-lg-block d-md-block d-xl-block">
                                                <img :src="'../assets/image auth.png'" class="h-100 img-auth" />
                                            </div>
                                            <div
                                                class="d-flex flex-column align-end justify-center uk-width-4-5@m uk-width-1-1 uk-width-4-5@s uk-width-4-5@l uk-width-4-5@xl py-12 border-x">

                                                <div class="uk-width-1-1">
                                                    <h3
                                                        class="text-h4 text-sm-h3 text-md-h3 text-lg-h3 text-xl-3 uk-width-1-1 px-8 py-2">
                                                        Авторизация</h3>
                                                    <form class="uk-width-1-1 px-sm-8 px-md-8 px-lg-8 px-xl-8 px-1">
                                                        <div :class="{ error: v$.email.$errors.length } + ' my-2'">
                                                            <v-text-field label="E-mail" prepend-icon="mdi-at"
                                                                v-model="v$.email.$model"></v-text-field>
                                                            <div class="" v-for="(error, index) of v$.email.$errors"
                                                                :key="index">
                                                                <div class="text-red">{{ error.$message }}</div>
                                                            </div>
                                                        </div>
                                                        <div :class="{ error: v$.password.$errors.length } + ' my-2'">
                                                            <v-text-field label="Password" prepend-icon="mdi-lock" :append-inner-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
                                                                :type="show2 ? 'text' : 'password'"
                                                                @click:append-inner="show2 = !show2"
                                                                v-model="v$.password.$model"></v-text-field>
                                                            <div class="" v-for="(error, index) of v$.password.$errors"
                                                                :key="index">
                                                                <div class="text-red">{{ error.$message }}</div>
                                                            </div>
                                                        </div>

                                                    </form>
                                                </div>
                                                <div class="uk-width-1-1 mt-6 px-8 d-flex justify-end">
                                                    <div class="btn_first" color="primary">
                                                        <button @click.prevent="this.auth" type="submit"
                                                            class="noselect">Войти</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </v-card>
                            </v-window-item>
                            <v-window-item value="option-2" style="height: 100%">
                                <v-card class="h-100" flat>
                                    <div class="h-100">
                                        <div class="uk-width-1-1 h-100 d-flex justify-center">
                                            <div class="uk-width-2-5 d-none d-sm-block d-lg-block d-md-block d-xl-block">
                                                <img :src="'../assets/image auth.png'" class="h-100 img-auth" />
                                            </div>
                                            <div
                                                class="d-flex flex-column align-end justify-center uk-width-4-5@m uk-width-1-1 uk-width-4-5@s uk-width-4-5@l uk-width-4-5@xl py-12 border-x">
                                                <div class="uk-width-1-1">
                                                    <h3
                                                        class="text-h4 text-sm-h3 text-md-h3 text-lg-h3 text-xl-3 uk-width-1-1 px-8 py-2">
                                                        Регистрация</h3>
                                                    <form
                                                        class="uk-width-1-1 d-flex flex-column justify-space-around px-sm-8 px-md-8 px-lg-8 px-xl-8 px-1">
                                                        <div :class="{ error: v$.email.$errors.length } + ' my-2'">
                                                            <v-text-field class="ma-0" height="50px" label="E-mail"
                                                                prepend-icon="mdi-at"
                                                                v-model="v$.email.$model"></v-text-field>
                                                            <div class="pa-0 ma-0"
                                                                v-for="(error, index) of v$.email.$errors" :key="index">
                                                                <div class="text-caption text-red">{{ error.$message }}
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div :class="{ error: v$.name.$errors.length } + ' my-2'">
                                                            <v-text-field max-errors="1" label="Имя" height="50px"
                                                                prepend-icon="mdi-account"
                                                                v-model="v$.name.$model"></v-text-field>
                                                            <div class="" v-for="(error, index) of v$.name.$errors"
                                                                :key="index">
                                                                <div class="text-caption text-red">{{ error.$message }}
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div :class="{ error: v$.password.$errors.length } + ' my-2'">
                                                            <v-text-field label="Пароль" height="50px"
                                                                :append-inner-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
                                                                :type="show2 ? 'text' : 'password'"
                                                                @click:append-inner="show2 = !show2" prepend-icon="mdi-lock"
                                                                v-model="v$.password.$model"></v-text-field>
                                                            <div class="" v-for="(error, index) of v$.password.$errors"
                                                                :key="index">
                                                                <div class="text-caption text-red">{{ error.$message }}
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div
                                                            :class="{ error: v$.password_confirmation.$errors.length } + ' my-2'">
                                                            <v-text-field label="Повторите пароль" height="50px"
                                                                prepend-icon="mdi-lock"  :append-inner-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
                                                                :type="show2 ? 'text' : 'password'"
                                                                @click:append-inner="show2 = !show2"
                                                                v-model="v$.password_confirmation.$model"></v-text-field>
                                                            <div class=""
                                                                v-for="(error, index) of v$.password_confirmation.$errors"
                                                                :key="index">
                                                                <div class="text-caption text-red">{{ error.$message }}
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="uk-width-1-1 mt-6 px-8 d-flex justify-end">
                                                    <div class="btn_first" color="primary">
                                                        <button @click="v$.$validate" @click.prevent="this.register"
                                                            type="submit" class="noselect">Отправить</button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </v-card>
                            </v-window-item>
                            <v-window-item class="h-100" value="option-3">
                                <v-card class="uk-height-1-1 h-100" flat>
                                    <div class="uk-height-1-1 pink-lighten-3 ">
                                        <div class=" uk-height-1-1 uk-width-1-1 d-flex justify-center">
                                            <div
                                                class="uk-width-2-5 d-none d-sm-block d-lg-block d-md-block d-xl-block h-100">
                                                <img :src="'../assets/image auth.png'" class="h-100 img-auth" />
                                            </div>
                                            <div
                                                class="d-flex align-center justify-center uk-width-4-5 h-100 py-12 border-x text-center">
                                                <h3 class="text-h6 text-sm-h4 text-md-h4 text-lg-h4 text-xl-h4 w-75"
                                                    color="black">Для того чтобы подать заявку на сотрудничество,
                                                    зарегистрируйтесь на сайте</h3>
                                            </div>
                                        </div>
                                    </div>
                                </v-card>
                            </v-window-item>
                        </v-window>
                    </v-card>
                </div>
            </v-card>
        </v-dialog>
    </div>
</template>
<script>
import axios from 'axios';
import useVuelidate from "@vuelidate/core";
import { required, email, minLength, helpers, sameAs } from "@vuelidate/validators";
import NotificationCenter from '@/scripts/notifications.js';
const NC = new NotificationCenter;
export function validName(name) {
    let validNamePattern = new RegExp("^[а-яА-Я]+(?:[-'\\s][а-яА-Я]+)*$");
    if (validNamePattern.test(name)) {
        return true;
    }
    return false;
}
export default {
    setup() {
        return { v$: useVuelidate() };
    },
    data() {
        return {
            show1: false,
            show2: true,
            dialog: false,
            tab: 'option-1',
            show: false,
            message_error: '',
            name: '',
            email: '',
            password: '',
            password_confirmation: ''
        }
    },
    mounted() {
        document.title = "Liss_V - подбери своего визажиста";
    },
    validations() {
        return {
            name: {
                required: helpers.withMessage(
                    "Обязательное поле для заполнения",
                    required
                ),
                name_validation: {
                    $validator: validName,
                    $message:
                        "Недопустимое имя. Поле должно содержать только русские буквы.",
                },
            },
            email: {
                required: helpers.withMessage(
                    "Обязательное поле для заполнения",
                    required
                ),
                email: helpers.withMessage(
                    "Значение не является адресом электронной почты",
                    email
                ),
            },
            password: {
                required: helpers.withMessage(
                    "Обязательное поле для заполнения",
                    required
                ),
                min: helpers.withMessage(
                    "Минимальное количество символов 8",
                    minLength(8)
                ),
            },
            password_confirmation: {
                required: helpers.withMessage(
                    "Обязательное поле для заполнения",
                    required
                ),
                sameAsPassword: helpers.withMessage(
                    "Пароли не совпадают",
                    sameAs(this.password)
                )
            },
        };
    },

    methods: {
        // Метод регистрации
        register() {
            if (this.email && this.name && this.password && this.password_confirmation) {
                axios.post('/api/register', JSON.stringify({
                    'name': this.name,
                    'email': this.email,
                    'password': this.password,
                    'password_confirmation': this.password_confirmation,
                }), {
                    headers: {
                        "Content-type": "application/json",
                        "Accept": "application/json"
                    }
                }).then(response => {
                    localStorage.setItem('token', response.data.token)
                    localStorage.setItem('role', response.data.user.role)
                    localStorage.setItem('name', response.data.user.name)
                    localStorage.setItem('email', response.data.user.email)
                    this.$router.push('/')
                    this.dialog = false;
                    NC.spawnNote("success", 'Успешная регистрация!', 'Надеемся, что вам понравится у нас', ["Закрыть"])
                }).catch(response => {
                    if(response.response.data.message == 'The email has already been taken.'){
                        NC.spawnNote("error", 'Такой адрес электронной почты уже используется!', '', ["Закрыть"])
                        // this.message_error = 'Такой адрес электронной почты уже используется!'
                    }
                    console.log(response.response.data.message)
                })
            }
            else this.message_error = 'Заполните все поля!'
        },
        auth() {
            if (this.email && this.password) {
                axios.post('/api/login', JSON.stringify({
                    'email': this.email,
                    'password': this.password,
                }), {
                    headers: {
                        "Content-type": "application/json",
                        "Accept": "application/json"
                    }
                }).then(response => {
                    localStorage.setItem('token', response.data.token)
                    localStorage.setItem('role', response.data.user.role)
                    localStorage.setItem('name', response.data.user.name)
                    localStorage.setItem('id', response.data.user.id)
                    this.dialog = false;
                    if (localStorage.getItem('role') === 'admin') {
                        return this.$router.push("/admin")
                    }
                    else {
                        return this.$router.push("/")
                    }
                    
                    NC.spawnNote("success", 'С возвращением, ${this.name} !', '', ["Закрыть"])
                }).catch(response => {
                    NC.spawnNote("error", 'Ошибка входа!', 'Проверьте правильность введённых данных', ["Закрыть"])
                })
            }
            else this.message_error = 'Заполните все поля!'
        }
    }
}
</script>

<style>
.v-text-field .v-input__details {
    display: none;
}

.v-window__container {
    height: 100%;
}

.v-slide-group--vertical .v-tab {
    padding: 0;
    justify-content: center;
}

.theme--light.v-tabs>.v-tabs-bar {
    background-color: #9CCC65;
}

.v-slide-group--vertical .v-tab {
    height: 33%;
}

.di_w {
    height: 70vh;
}

/* Анимации появления и исчезновения могут иметь
различные продолжительности и динамику.       
 .slide-fade-enter-active {
  transition: all .3s ease;
}
.slide-fade-leave-active {
  transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);
} 
 .slide-fade-enter, .slide-fade-leave-to 
.slide-fade-leave-active до версии 2.1.8 { 
   transform: translateX(30vw);
  z-index: -2;
  opacity: 0;
}  */

.di {
    overflow: hidden;
}

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

.border {
    border: 1px solid black;
    border-color: black;
}

.border-x {
    border-left: 1px solid black;
}

.border-bottom {
    border-bottom: 1px solid black;
}

.img-auth {
    height: 100%;
    object-fit: cover;
    object-position: right;
}

@media screen and (max-width: 650px) {
    .border-x {
        border: none;
    }

    .w-5 {
        width: 15%;
    }
}

/* .vid {
    position: relative;
    box-shadow: inset 0px 0px 100px 5px black;
}
video {
    filter: brightness(0.2);
    filter: saturate(70%);
    height: 100%;
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    object-fit: cover;
    object-position: center;
    z-index: -1;
} */
</style>