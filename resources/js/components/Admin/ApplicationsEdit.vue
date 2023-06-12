<template>
    <nav class="uk-navbar-container d-flex justify-space-between uk-width-1-1 bg-none" uk-navbar>
        <div class="uk-navbar-left pt-5 pl-12 uk-width-1-3 mx-0 d-flex align-center">
            <!-- <div class="uk-width-1-1">
                <v-autocomplete label="Сортировка по статусу" bg-color="light-green-lighten-3"
                    :items="['Все', 'Отправлен', 'Принято', 'Отклонено', 'Успешно завершено', 'Экстренно отклонено']"></v-autocomplete>
            </div> -->
            <select class="uk-select" aria-label="Select">
                <option @click="sortParam = 'Все'">Все</option>
                <option @click="sortParam = 'Отправлен'">Отправлен</option>
                <option @click="sortParam = 'Принято'">Принято</option>
                <option @click="sortParam = 'Отклонено'">Отклонено</option>
                <option @click="sortParam = 'Успешно завершено'">Успешно завершено</option>
                <option @click="sortParam = 'Экстренно отклонено'">Экстренно отклонено</option>
            </select>
        </div>
        <div class="uk-navbar-right pr-5 mx-0 uk-width-1-2 d-flex justify-end">
            <div>
                <a class="uk-navbar-toggle text-pink" uk-search-icon href="#"></a>
                <div class="uk-width-1-2 uk-drop" uk-drop="mode: click; pos: left-center; offset: 0">
                    <form class="uk-search uk-search-navbar text-white">
                        <input class="uk-search-input text-pink" type="search" placeholder="Search" aria-label="Search"
                            autofocus>
                    </form>
                </div>
            </div>
        </div>
    </nav>

    <div v-for="application in sortHandler" :keys="application" class="ma-12  text-brown-darken-4" style=" width: 90%">
        <div class="w-100 d-flex">
            <div class="w-50 d-flex flex-column">
                <div class="d-flex justify-space-between w-100 font-weight-bold">
                    <p class="ma-0">Мастер:</p>
                    <router-link class="text-brown-darken-4" :to="'/profile/' + application.id_master.id">
                        <p class="ma-0">{{ application.id_master.name }} {{ application.id_master.surname }}</p>
                    </router-link>
                </div>
                <div class="d-flex justify-space-between font-weight-bold">
                    <p class="ma-0">Клиент:</p>
                    <p class="ma-0">{{ application.id_user.name }}</p>
                </div>
                <hr class="w-100 my-2">
                <div class="d-flex justify-space-between w-100">
                    <p class="ma-0">Номер клиента:</p>
                    <p class="ma-0">{{ application.number }}</p>
                </div>
                <div class="d-flex justify-space-between">
                    <p class="ma-0">Почта клиента:</p>
                    <p class="ma-0">{{ application.id_user.email }}</p>
                </div>
            </div>
            <div class="w-50 px-8 ml-4" style="border-left: 2px solid #3E2723">
                Комментарий от клиента:
                <p class="text-justify">{{ application.text }}</p>
            </div>
        </div>
        <div class="w-100 d-flex justify-space-between my-4 font-weight-bold px-6 py-1"
            :class="initClass(application.status)">
            <p class="ma-0">Статус заявки:</p>
            <p class="ma-0">{{ application.status }}</p>
        </div>

        <p v-if="application.comm_master != 'null'">Комментарий об экстренном завершении заявки (от мастера): {{
            application.comm_master }}</p>
        <p v-if="application.comm_user != 'null'">Комментарий об экстренном завершении заявки (от клиента): {{
            application.comm_user }}</p>

        <hr class="w-100 my-8" style="border-top: 2px solid #3E2723" color="brown-darken-4">
    </div>
</template>

<script>
import axios from 'axios';
export default {
    data() {
        return {
            applications: [],
            token: localStorage.getItem('token'),
            chooseClass: '',
            sortParam: '',
        }
    },
    mounted() {
        this.getApplications()
    },
    computed: {
        sortHandler() {
            // Сортировка по статусу
            if(this.sortParam === 'Все') return this.applications
            return this.applications.filter(application => {
                return application.status.includes(this.sortParam)
            })
        },
    },
    methods: {
        getApplications() {
            axios.get('/api/admin/application', {
                headers: {
                    'Authorization': 'Bearer ' + this.token,
                    'Accept': "application/json",
                    'Content-type': "application/json"
                }
            }).then(response => {
                this.applications = response.data.data
                console.log(response.data.data);
            })
        },
        initClass(status) {
            switch (status) {
                case 'Отправлен':
                    this.chooseClass = 'bg-blue-lighten-3';
                    break;
                case 'Принято, скоро с вами свяжутся':
                    this.chooseClass = 'bg-yellow-lighten-3';
                    break;
                case 'Отклонено мастером':
                    this.chooseClass = 'bg-red-lighten-2';
                    break;
                case 'Успешно завершено':
                    this.chooseClass = 'bg-light-green-lighten-1';
                    break;
                case 'Экстренно отклонено':
                    this.chooseClass = 'bg-red-lighten-2';
                    break;
                default: break;
            }
            return this.chooseClass;
        }
    }
}
</script>