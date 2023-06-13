<template>
    <div :onload="this.showMaster(this.$route.params.id)" class="mb-16 d-flex flex-column align-center">
        <div class="w-90 mt-4">
            <v-row class="w-100 d-flex flex-row orange lighten-5 ma-0">
                <v-col class="w-100 d-flex flex-column align-center">
                    <hr>
                    <div class="width uk-width-1-1 d-flex justify-center align-center flex-column mt-5">
                        <div class="uk-width-1-1 d-flex flex-column justify-start align-start mt-4">
                            <h2 class="text-h3 my-0 py-0">
                                {{ this.masters.name }} {{ this.masters.surname }}
                                <svg-icon v-if="this.token && this.role == 'user'" @click="this.createLikeMaster(this.id); this.getLikeMasters(this.id)"
                                    class="uk-margin-small-left" type="mdi" :path="this.path"></svg-icon>
                            </h2>
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
                                <v-chip v-for="(tag, i) in this.tags" :key="tag" size="large" class="mr-2" label
                                    :color="i % 2 == 0 ? 'success' : 'pink'" text-color="white">
                                    {{ tag }}
                                </v-chip>
                            </div>
                        </div>

                    </div>
                    <div class="w-100 mt-10 d-flex align-center justify-space-between">
                        <hr class="w-100 ma-0">
                        <DialogZapis
                            v-if="this.masters.id_user != this.my_id_user && this.masters.admin_status == 'active' && this.my_id_user && this.role == 'user'">
                        </DialogZapis>
                    </div>
                </v-col>
                <v-col class="w-50 d-flex justify-center position-relative">
                    <v-img class="obj" style="height: 400px; object-fit: contain; object-position: center;"
                        :src='this.masters.avatar'></v-img>
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
import SvgIcon from '@jamescoyle/vue-icon';
import { mdiHeartOutline, mdiHeart } from '@mdi/js';
import NotificationCenter from '@/scripts/notifications.js';
const NC = new NotificationCenter;

export default {
    name: 'v-ProfilHeader',
    data() {
        return {
            id: this.$route.params.id,
            masters: [],
            tags: [],
            path: null,
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
        SvgIcon,
    },
    mounted() {
        this.showMaster(this.$route.params.id)
        if (this.token && this.role == 'user') {
            this.getLikeMasters(this.id)
        }
        this.getTagsOfMaster(this.id)
    },
    methods: {
        getTagsOfMaster(id) {
            axios.get(`/api/master/${id}/tags`, {
                headers: {
                    'Accept': 'application/json'
                }
            }).then(response => {
                this.tags = response.data.tags;
            }).catch(response => { console.log(response) })
        },
        getMasters() {
            axios.get('/api/masters').then(response => {
                this.masters = response.data.content
            }).catch(response => { console.log(response) })
        },
        getLikeMasters(id) {
            axios.get(`/api/likes/master/${id}/check`, {
                headers: {
                    'Accept': 'application/json',
                    'Content-type': 'application/json',
                    'Authorization': 'Bearer ' + localStorage.getItem('token')
                }
            })
                .then(response => {
                    if (response.data.status === 200) {
                        this.path = mdiHeart
                    }
                    else {
                        this.path = mdiHeartOutline
                    }
                })
                .catch(error => { console.log(error); })
        },
        createLikeMaster(id) {
            axios.get(`/api/likes/master/${id}`, {
                headers: {
                    'Accept': 'application/json',
                    'Content-type': 'application/json',
                    'Authorization': 'Bearer ' + localStorage.getItem('token')
                }
            })
                .then(response => {
                    if (response.data.status === 200) {
                        NC.spawnNote("success", response.data.message, 'Интересно', ["Закрыть"])

                    }
                    else {
                        NC.spawnNote("warning", response.data.message, 'Не совсем интересно', ["Закрыть"])
                    }
                })
                .catch(error => { console.log(error); })
        },
        showMaster(id) {
            axios.get(`/api/masters/${id}`, {
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
                this.master.description = response.data.content[0].description;
            }).catch(response => { console.log(response.data) })
        },
    }
}
</script>
<style scoped>
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
}

svg {
    color: red;
    cursor: pointer;
    transition: all .5s ease-out;
    width: 8%;
}

h2 {
    width: 100%;
}
</style>