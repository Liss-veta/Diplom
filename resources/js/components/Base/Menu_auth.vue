<template>
    <div>
        <Auth v-if="!this.token"></Auth>
        <v-menu v-else>
            <template v-slot:activator="{ props }">
                <v-btn icon="mdi-dots-vertical" v-bind="props"></v-btn>
            </template>
            <v-list>
                <v-list-item><button>Мои заявки</button></v-list-item>
                <!-- <v-list-item v-show="this.role == 'master'"><button>Страница
                        мастера</button></v-list-item> -->
                <v-list-item v-show="this.role == 'master'"><button class="uk-margin-small-right" type="button"
                        uk-toggle="target: #modal-example">Добавить
                        запись</button></v-list-item>
                <!-- <v-list-item v-show="this.role == 'master'"><button>Добавить
                        совет</button></v-list-item> -->
                <v-list-item v-show="this.role == 'master'"><button class="uk-margin-small-right" type="button"
                        uk-toggle="target: #modal-edit">Редактировать
                        профиль</button></v-list-item>
                <v-list-item v-show="this.role == 'admin'"><button @click.prevent="this.$router.push('/admin')">Панель
                        управления</button></v-list-item>
                <v-list-item v-show="this.role == 'user'">
                    <Application />
                </v-list-item>
                <v-list-item><button v-on:click="logout">Выйти</button></v-list-item>
            </v-list>
        </v-menu>
        <div id="modal-example" uk-modal>
            <div class="uk-modal-dialog uk-modal-body">
                <h2 class="uk-modal-title">Новый пост</h2>
                <span>Добавляйте больше постов, чтобы вам больше доверяла аудитория</span>
                <form action="" class="mt-5">
                    <v-textarea label="Текст поста" v-model="text"></v-textarea>
                    <v-file-input v-on:change="handleFileUpload()" multiple ref="file" id="file" name="file"
                        label="Добавьте фотографию" variant="filled" class="text-pink-lighten-4"></v-file-input>
                </form>
                <p class="uk-text-right">
                    <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                    <button class="uk-button uk-button-default" type="button" @click.prevent="add_post">Save</button>
                </p>
            </div>
        </div>
        <div id="modal-edit" uk-modal>
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
                </form>
                <p class="uk-text-right">
                    <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                    <button class="uk-button uk-button-default" type="button"
                        @click.prevent="update(this.my_id_user)">Save</button>
                </p>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import Auth from './Auth copy.vue'
import DialogZapis from '../DialogZapis.vue';
import Application from '../user/Application.vue';
import ProfilView from '../../web/ProfilView.vue';
export default {
    data() {
        return {
            id: this.$route.params.id,
            masters: [],
            token: localStorage.getItem('token'),
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
        }
    },
    components: {
        DialogZapis,
        Auth,
        Application,
        ProfilView,
    },
    mounted() {
        this.showMaster()
    },
    methods: {
        showMaster() {
            axios.get(`/api/masters/${this.my_id_user}/header`, {
                headers: {
                    'Accept': "application/json",
                    "Content-type": "application/json"
                }
            }).then(response => {
                this.masters = response.data.content
                this.master.name = response.data.content.name
                this.master.surname = response.data.content.surname
                this.master.age = response.data.content.age
                this.master.city = response.data.content.city
                this.master.staj = response.data.content.staj
                this.master.clients_count = response.data.content.clients_count
                this.master.min_cena = response.data.content.min_cena
                this.master.description = response.data.content.description
                console.log(response);
            }).catch(response => { console.log(response) })
        },
        update(id) {
            let formData = new FormData();
            formData.append("name", this.master.name);
            formData.append("surname", this.master.surname);
            formData.append("age", this.master.age);
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
                console.log(response)
            }).catch(response => {
                console.log(response)
            })
        },
        logout() {
            axios.get('api/logout', {
                headers: { "Authorization": "Bearer " + this.token }
            }).then(response => {
                location.reload()
                localStorage.clear()
            }).catch(response => { console.log(response) })

        },
        handleFileUploadAvatar() {
            this.file_ava = this.$refs.avatar.files[0];
        },
        handleFileUpload() {
            this.file = this.$refs.file.files;
        },
        add_post() {
            let formData = new FormData();
            formData.append('text', this.text);
            for (let index = 0; index < this.file.length; index++) {
                let image = this.file[index];
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
    }
}
</script>