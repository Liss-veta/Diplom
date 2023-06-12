<template>
    <div>
        <!-- <Auth v-if="!this.token"></Auth> -->
        <div v-if="!checkAuthUser" class="auth text-center">
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
                                            <v-icon v-bind="props" start size="large">
                                                mdi-account-plus
                                            </v-icon>
                                        </v-tab>
                                    </template>
                                    <span>Регистрация</span>
                                </v-tooltip>
                                <v-tooltip v-model="show" location="bottom">
                                    <template v-slot:activator="{ props }">
                                        <v-tab style="height: 33%" class="justify-center" value="option-3" min-width="auto">
                                            <v-icon v-bind="props" start>
                                                mdi-account-question
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
                                                                <v-text-field label="Password" prepend-icon="mdi-lock"
                                                                    :append-inner-icon="show2 ? 'mdi-eye-off' : 'mdi-eye'"
                                                                    :type="show2 ? 'password' : 'text'"
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
                                                <div
                                                    class="uk-width-2-5 d-none d-sm-block d-lg-block d-md-block d-xl-block">
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
                                                                    :append-inner-icon="show2 ? 'mdi-eye-off' : 'mdi-eye'"
                                                                    :type="show2 ? 'password' : 'text'"
                                                                    @click:append-inner="show2 = !show2"
                                                                    prepend-icon="mdi-lock"
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
                                                                    prepend-icon="mdi-lock"
                                                                    :append-inner-icon="show2 ? 'mdi-eye-off' : 'mdi-eye'"
                                                                    :type="show2 ? 'password' : 'text'"
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
        <v-menu v-else>
            <template v-slot:activator="{ props }">
                <v-btn icon="mdi-dots-vertical" v-bind="props"></v-btn>
            </template>
            <v-list>
                <v-list-item v-if="this.qwerty_role != 'admin'"><a class="w-100 text-start text-black">
                        <myApplication></myApplication>
                    </a></v-list-item>
                <v-list-item v-show="this.qwerty_role == 'master'"><a class="w-100 text-start text-black"
                        @click.prevent="this.$router.push('/profile/' + this.masters.id)">Страница
                        мастера</a></v-list-item>
                <v-list-item v-show="this.qwerty_role == 'master'"><a class="w-100 text-start uk-margin-small-right text-black"
                        type="button" uk-toggle="target: #modal-example">Добавить
                        запись</a></v-list-item>
                <v-list-item v-show="this.qwerty_role == 'user'"><a class="w-100 text-start uk-margin-small-right text-black"
                        type="button" uk-toggle="target: #modal-izbrann"
                        @click.prevent="showIzbrann()">Избранные</a></v-list-item>
                <v-list-item v-show="this.qwerty_role == 'master'"><a class="w-100 text-start text-black" href="#modal-sections"
                        uk-toggle>Добавить совет</a></v-list-item>
                <v-list-item v-show="this.qwerty_role == 'master'"><a class="w-100 text-start uk-margin-small-right text-black"
                        type="button" uk-toggle="target: #modal-edit">Редактировать
                        профиль</a></v-list-item>
                <v-list-item class="text-start" v-show="this.qwerty_role == 'admin'"><a class="w-100 text-start text-black"
                        @click.prevent="this.$router.push('/admin')">Панель
                        управления</a></v-list-item>
                <v-list-item class="w-100 text-start" v-show="this.qwerty_role == 'user'">
                    <Application />
                </v-list-item>
                <v-list-item class="text-start"><a class="w-100 text-start text-black"
                        v-on:click="logout">Выйти</a></v-list-item>
            </v-list>
        </v-menu>
        <!-- Новый пост -->
        <div id="modal-example" uk-modal>
            <div class="uk-modal-dialog uk-modal-body">
                <h2 class="uk-modal-title">Новый пост</h2>
                <span>Добавляйте больше постов, чтобы вам больше доверяла аудитория</span>
                <form action="" class="mt-5">
                    <v-textarea label="Текст поста" v-model="text"></v-textarea>
                    <v-file-input multiple ref="post" id="file" name="file"
                        label="Добавьте фотографию" variant="filled"></v-file-input>
                    <small>*Если вы хотите добавить несколько фотографий, при выборе используйте клавишу <b>ctrl</b></small>
                </form>
                <p class="uk-text-right">
                    <button class="uk-button uk-button-default uk-modal-close" type="button">Закрыть</button>
                    <button class="uk-button uk-button-default uk-modal-close" type="button"
                        @click.prevent="add_post">Добавить пост</button>
                </p>
            </div>
        </div>
        <!-- Новый совет -->
        <div id="modal-sections" uk-modal>
            <div class="uk-modal-dialog uk-modal-body">
                <button class="uk-modal-close-default" type="button" uk-close></button>
                <h2 class="uk-modal-title">Предложить совет</h2>
                <span>Ваши советы будут помогать вашим потенциальным клиентам правильно ухаживать за собой</span>
                <span>Заслужите их доверие, начиная с малого</span>
                <form action="" class="mt-5">
                    <v-textarea class="my-4" label="Опишите ваш лайфхак" v-model="text_sovet"></v-textarea>
                    <v-file-input multiple ref="sovet" id="file" name="file"
                        label="Максимальное количество фотографий - 3" variant="filled"></v-file-input>
                    <small>*Если вы хотите добавить несколько фотографий, при выборе используйте клавишу <b>ctrl</b></small><br>
                    <small>**Сначала ваш совет проходит контроль администратора и только потом выходит в свет</small>
                </form>
                <p class="uk-text-right">
                    <button class="uk-button uk-button-default uk-modal-close" type="button">Закрыть</button>
                    <button class="uk-button uk-button-default uk-modal-close" type="button"
                        @click.prevent="add_sovet">Отправить</button>
                </p>
            </div>
        </div>
        <!-- Избранные -->
        <div v-if="checkAuthUser" id="modal-izbrann" uk-modal>
            <div class="uk-modal-dialog uk-modal-body">
                <button class="uk-modal-close-default" type="button" uk-close></button>
                <h2 class="uk-modal-title">Избранные</h2>
                <p class="text-body-1" v-show="this.izbrann.length == 0">Избранных мастеров пока нет</p>
                <v-expansion-panels variant="popout" class="pa-4">
                    <v-expansion-panel v-for="(one, i) in izbrann"
                        :bg-color="i % 2 == 0 ? 'light-green-lighten-1' : 'pink-lighten-3'" :key="i" hide-actions>
                        <v-expansion-panel-title>
                            <v-row class="spacer" no-gutters>
                                <v-col cols="4" sm="4" md="3">
                                    <v-avatar rounded="0" size="80">
                                        <v-img alt="Avatar" :src="one.id_master.avatar"></v-img>
                                    </v-avatar>
                                </v-col>
                                <v-col class="hidden-xs-only text-left ms-2 d-flex align-center" sm="5" md="5">
                                    <strong class="text-h5"
                                        v-html="one.id_master.name + ' ' + one.id_master.surname"></strong>
                                </v-col>
                            </v-row>
                        </v-expansion-panel-title>
                        <v-expansion-panel-text>
                            <v-card-text class="d-flex justify-space-between text-h6">
                                <div><strong>{{ one.id_master.city }}</strong></div>
                                <div>от <strong>{{ one.id_master.min_cena }}P</strong></div>
                                <div><strong>{{ one.id_master.clients_count }}+</strong> клиентов</div>
                            </v-card-text>
                        </v-expansion-panel-text>
                    </v-expansion-panel>
                </v-expansion-panels>
            </div>
        </div>
        <!-- Редактировать профиль -->
        <div v-if="this.role == 'master'" id="modal-edit" uk-modal>
            <div class="uk-modal-dialog uk-modal-body">
                <h2 class="uk-modal-title">Редактировать профиль</h2>
                <form class="mt-5">
                    <v-col class="d-flex child-flex" cols="4" style="height:250px; width: 250px;">
                        <div class="uk-text-center" style="height:250px; width: 250px;">
                            <div class="hover uk-height-1-1 uk-inline-clip uk-transition-toggle uk-light" tabindex="0"
                                style="height:250px; width: 250px;">
                                <img :src="this.masters.avatar" style="width: 250px; height: 250px; object-fit:cover"
                                    class="hover_img" alt="">
                                <div class="uk-position-center px-4" style="width:100%">
                                    <span class="uk-transition-fade uk-width-1-1"><v-file-input class="w-100" type="file"
                                            label="Нажмите чтобы выбрать изображение" variant="filled"
                                            v-on:change="handleFileUploadAvatar()" prepend-icon="mdi-camera"
                                            ref="avatar"></v-file-input><v-btn elevation="2" outlined plain tile
                                            @click.prevent="updateAvatar(this.my_id_user)">Сохранить</v-btn></span>
                                </div>
                            </div>
                        </div>
                    </v-col>
                    <v-text-field class="mt-5" label="Ваше имя" v-model="this.master.name" hint="Введите ваше имя"
                        persistent-hint append-inner-icon="mdi-account-edit" required></v-text-field>
                    <v-text-field class="mt-5" label="Ваша фамилия" v-model="this.master.surname"
                        hint="Введите вашу фамилию" persistent-hint append-inner-icon="mdi-account-edit"
                        required></v-text-field>
                    <v-text-field class="mt-5" label="Ваш возраст" v-model="this.master.age" hint="Введите ваш возраст"
                        persistent-hint append-inner-icon="mdi-account-clock" required></v-text-field>
                    <v-text-field class="mt-5" label="Стаж" v-model="this.master.staj"
                        hint="Введите стаж вашей работы (в годах)" persistent-hint append-inner-icon="mdi-calendar-clock"
                        required></v-text-field>
                    <v-text-field class="mt-5" label="Город" v-model="this.master.city"
                        hint="Введите город, в котором вы работаете" persistent-hint append-inner-icon="mdi-city"
                        required></v-text-field>
                    <v-text-field class="mt-5" label="Опыт работы" v-model="this.master.clients_count"
                        hint="Введите примерное количество клиентов, с которыми вы работали (отображение 200+)"
                        persistent-hint append-inner-icon="mdi-briefcase" required></v-text-field>
                    <v-text-field class="mt-5" label="Минимальная цена" v-model="this.master.min_cena"
                        hint="Введите минимальную цену ваших услуг" append-inner-icon="mdi-cash" persistent-hint
                        required></v-text-field>
                    <v-textarea class="mt-5" v-model="this.master.description" auto-grow variant="filled"
                        color="deep-purple" label="Описание вас как профессионала" rows="1" append-inner-icon="mdi-comment"
                        hint="Введите описание вас как профессионала, минимальное количество символов 350"></v-textarea>
                    <v-col cols="12" sm="11">
                        <v-select chips multiple v-model="this.categories" label="Select" :items="this.tags"></v-select>
                    </v-col>
                </form>
                <p class="uk-text-right">
                    <button class="uk-button uk-button-default uk-modal-close" type="button">Закрыть</button>
                    <button class="uk-button uk-button-default" type="button"
                        @click.prevent="update(this.my_id_user)">Сохранить</button>
                </p>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import DialogZapis from '../DialogZapis.vue';
import Application from '../user/Application.vue';
import ProfilView from '../../web/ProfilView.vue';
import myApplication from '../user/MyApplication.vue';
import useVuelidate from "@vuelidate/core";
// import { required, email, minLength, helpers, sameAs } from "@vuelidate/validators";
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
    computed: {
        checkAuthUser() {
            if(!this.authUser) {
                return false
            }
            return true
        }
    },
    data() {
        return {
            auth_window: true,
            id: this.$route.params.id,
            masters: [],
            tags: [],
            categories: [],
            token: localStorage.getItem('token'),
            name_tok: localStorage.getItem('name'),
            role: localStorage.getItem('role'),
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
            izbrann: [],
            messages: [
                {
                    avatar: 'https://avatars0.githubusercontent.com/u/9064066?v=4&s=460',
                    name: 'John Leider',
                    title: 'Welcome to Vuetify!',
                    excerpt: 'Thank you for joining our community...',
                },
            ],
            show1: false,
            show2: true,
            dialog: false,
            tab: 'option-1',
            show: false,
            message_error: '',
            name: '',
            email: '',
            password: '',
            password_confirmation: '',
            qwerty_role: localStorage.getItem('role'),
            authUser: localStorage.getItem('authUser')
        }
    },
    components: {
        DialogZapis,
        Application,
        ProfilView,
        myApplication,
    },
    mounted() {
        if (this.token) {
            this.showIzbrann(),
                this.getTags()
        }
        this.showMaster()
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
                    this.authUser = true
                    this.qwerty_role = response.data.user.role
                    this.my_id_user = response.data.user.id
                    this.showMaster()
                    localStorage.setItem('authUser', true)
                    this.token = localStorage.getItem('token')
                    document.querySelector('auth').style.display = none;
                    NC.spawnNote("success", 'Успешная регистрация!', 'Надеемся, что вам понравится у нас', ["Закрыть"])
                }).catch(response => {
                    if (response.response.data.message == 'The email has already been taken.') {
                        NC.spawnNote("error", 'Такой адрес электронной почты уже используется!', '', ["Закрыть"])
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
                    this.dialog = false
                    this.authUser = true
                    this.qwerty_role = response.data.user.role
                    this.my_id_user = response.data.user.id
                    this.showMaster()
                    localStorage.setItem('authUser', true)
                    this.token = localStorage.getItem('token')
                    if (localStorage.getItem('role') === 'admin') {
                        window.location.href = '/admin'
                        return true
                    }
                    else {
                        this.$router.push("/")
                        NC.spawnNote("success", `С возвращением, ${reponse.data.user.name} !`, '', ["Закрыть"])
                        return true
                    }
                }).catch(error => {
                    if(error.response.status == 403) 
                    NC.spawnNote("error", 'Ошибка входа!', 'Проверьте правильность введённых данных', ["Закрыть"])
                })
            }
            else this.message_error = 'Заполните все поля!'
        },
        showIzbrann() {
            axios.get('/api/likes/master', {
                headers: {
                    'Authorization': 'Bearer ' + localStorage.getItem('token'),
                    'Accept': "application/json",
                    "Content-type": "application/json"
                }
            }).then(response => {
                this.izbrann = response.data.content
                console.log(this.izbrann);
            }).catch(error => { console.log(error) })
        },
        getTags() {
            axios.get('/api/tags', {
                headers: {
                    'Authorization': 'Bearer ' + localStorage.getItem('token')
                }
            }).then(response => {
                for (let index = 0; index < response.data.length; index++) {
                    this.tags.push(response.data[index].tag_name);
                }
            }).catch(error => { console.log(error) })
        },
        showMaster() {
            axios.get(`/api/masters/${this.my_id_user}/header`, {
                headers: {
                    'Accept': "application/json",
                    "Content-type": "application/json"
                }
            }).then(response => {
                this.masters = response.data.content
                if (this.role == 'master') {
                    this.master.name = response.data.content.name
                    this.master.surname = response.data.content.surname
                    this.master.age = response.data.content.age
                    this.master.city = response.data.content.city
                    this.master.staj = response.data.content.staj
                    this.master.clients_count = response.data.content.clients_count
                    this.master.min_cena = response.data.content.min_cena
                    this.master.description = response.data.content.description
                }
                console.log(response);
            }).catch(response => { console.log(response) })
        },
        update(id) {
            let formData = new FormData();
            formData.append("name", this.master.name);
            formData.append("surname", this.master.surname);
            formData.append("age", this.master.age);
            formData.append("categories", this.categories);
            formData.append("city", this.master.city);
            formData.append("staj", this.master.staj);
            formData.append("clients_count", this.master.clients_count);
            formData.append("min_cena", this.master.min_cena);
            formData.append("description", this.master.description);
            axios.post(`/api/master/${id}/update`, formData, {
                headers: {
                    "Authorization": "Bearer " + this.token,
                }
            }).then(response => {
                this.showMaster()
                console.log(response)
            }).catch(response => {
                console.log(response)
            })
        },
        updateAvatar(id) {
            let formData = new FormData();
            formData.append("avatar", this.file_ava);
            console.log(formData);
            axios.post(`/api/master/${id}/update_avatar`, formData, {
                headers: {
                    "Authorization": "Bearer " + this.token,
                    'Accept': "application/json",
                    "Content-type": "multipart/form-data"
                }
            }).then(response => {
                this.showMaster()
                // this.$route
                console.log(response)
            }).catch(response => {
                console.log(response)
            })
        },
        logout() {
            axios.get('/api/logout', {
                headers: { "Authorization": "Bearer " + this.token }
            }).then(response => {
                localStorage.clear()
                this.authUser = false
                localStorage.removeItem('authUser')
                this.auth_window = true
                document.querySelector('auth').style.display = block;
            }).catch(response => { console.log(response) })
        },
        handleFileUploadAvatar() {
            this.file_ava = this.$refs.avatar.files[0];
        },
        add_post() {
            let formData = new FormData();
            formData.append('text', this.text);
            for (let index = 0; index < this.$refs.post.files.length; index++) {
                let image = this.$refs.post.files[index];
                formData.append('image[]', image);
            }
            axios.post('/api/master/post',
                formData,
                {
                    headers: {
                        'Content-Type': 'multipart/form-data',
                        'Accept': 'application/json',
                        "Authorization": "Bearer " + this.token
                    }
                },
            ).then(_r => {
                this.text = ''
                this.file = ''
            })
                .catch(function () {
                    console.log('FAILURE!!');
                });
        },
        add_sovet() {
            let formData = new FormData();
            formData.append('text_sovet', this.text_sovet);
            for (let index = 0; index < this.$refs.sovet.files.length; index++) {
                let image = this.$refs.sovet.files[index];
                formData.append('image[]', image);
            }
            axios.post('/api/master/sovet',
                formData,
                {
                    headers: {
                        'Content-Type': 'multipart/form-data',
                        'Accept': 'application/json',
                        "Authorization": "Bearer " + this.token
                    }
                },
            ).then(_r => {
                this.text_sovet = ''
                this.file = ''
            })
                .catch(function () {
                    console.log('FAILURE!!');
                });
        },
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
</style>