<template>
    <div class="mb-16 d-flex flex-column align-center">
        <div class="w-90 mt-4">
            <v-row class="w-100 d-flex flex-row orange lighten-5 ma-0">
                <v-col class="w-100 d-flex flex-column align-center">
                    <hr>
                    <div class="width uk-width-1-1 d-flex justify-center align-center flex-column mt-5">
                        <div class="uk-width-1-1 d-flex flex-column justify-start align-start mt-4">
                            <h2 class="text-h3 my-0 py-0">{{ this.masters.name }} {{ this.masters.surname }}</h2>
                            <p class="my-1 py-0">{{ this.masters.age }}, {{ this.masters.city }}</p>
                        </div>
                        <div class="uk-width-1-1 mt-12">
                            <div class="d-flex justify-space-between w-100 pb-12 pb-sm-8 pb-md-2 pb-lg-0 pb-xl-0">
                                <div class="d-flex flex-column justify-center">
                                    <h5 class="font-weight-bold mb-0 text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">{{
                                        this.masters.staj }}
                                        года</h5>
                                    <p class="mt-0">Стаж</p>
                                </div>
                                <div class="d-flex flex-column justify-center">
                                    <h5 class="font-weight-bold mb-0 text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">
                                        {{ this.masters.clients_count }}+</h5>
                                    <p class="mt-0">Клиентов</p>
                                </div>
                                <div class="d-flex flex-column justify-center">
                                    <h5 class="font-weight-bold mb-0 text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">от
                                        {{ this.masters.min_cena }}р.</h5>
                                    <p class="mt-0">Стоимость</p>
                                </div>
                            </div>
                            <div class="my-12">
                                <!-- <v-chip size="large" class="mr-2" label color="success" text-color="white">
                                    Вечерний
                                </v-chip>
                                <v-chip size="large" class="mx-2" label color="pink" text-color="white">
                                    Свадебный
                                </v-chip>
                                <v-chip size="large" class="mx-2" label color="success" text-color="white">
                                    Дневной
                                </v-chip>
                                <v-chip size="large" class="mx-2" label color="pink" text-color="white">
                                    Деловой
                                </v-chip> -->
                            </div>
                        </div>

                    </div>
                    <div class="w-100 mt-10 d-flex align-center justify-space-between">
                        <hr class="w-100 ma-0">
                        <DialogZapis v-if="this.masters.id_user != this.my_id_user && this.my_id_user" ></DialogZapis>
                    </div>
                </v-col>
                <v-col class="w-50 d-flex justify-center position-relative">
                    <v-img class="obj" style="height: 400px; object-fit: contain; object-position: center;" :src='this.masters.avatar'></v-img>
                </v-col>
            </v-row>
        </div>
    </div>
    <ProfilView />
</template>
<script>
import DialogZapis from '../DialogZapis.vue';
import Auth from '../Base/Auth copy.vue';
import Application from '../user/Application.vue';
import ProfilView from '../../web/ProfilView.vue';
import axios from 'axios';

export default {
    name: 'v-ProfilHeader',
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
        console.log(this.id);
    },
    methods: {
        showMaster() {
            axios.get(`/api/masters/${this.id}`, {
                headers: {
                    'Accept': "application/json",
                    "Content-type": "application/json"
                }
            }).then(response => {
                this.masters = response.data.content[0]
                this.master.name = response.data.content[0].name
                this.master.surname = response.data.content[0].surname
                this.master.age = response.data.content[0].age
                this.master.city = response.data.content[0].city
                this.master.staj = response.data.content[0].staj
                this.master.clients_count = response.data.content[0].clients_count
                this.master.min_cena = response.data.content[0].min_cena
                this.master.description = response.data.content[0].description
                console.log(this.master.name);
            }).catch(response => { console.log(response.data) })
        },
    }
}
</script>
<style>
.hover:hover .hover_img {
    filter: brightness(30%);
    transition: .2s ease-in-out;
}
.width {
    width: 85%;
}

.w-90 {
    width: 90%;
}

hr {
    background-color: black;
    width: 100%;
}

.obj-fit {
    width: 8vw;
    height: 8vw;
    object-fit: cover;
    object-position: center;
}

.obj {
    height: 80%;
    width: 100%;
    object-fit: cover;
    object-position: top;
}</style>