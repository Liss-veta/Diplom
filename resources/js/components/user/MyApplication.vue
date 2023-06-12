<template>
    <div>
        <v-badge :content="this.applications.length" class="pa-0" color="pink-accent-2" inline>
        <a class="w-100 text-start text-black pr-6" href="#modal-overflow" uk-toggle>Мои
            заявки </a></v-badge>
        <div id="modal-overflow" uk-modal>
            <div class="uk-modal-dialog">
                <button class="uk-modal-close-default" type="button" uk-close></button>
                <div class="uk-modal-header">
                    <h2 class="uk-modal-title">Мои заявки </h2>
                </div>
                <div class="uk-modal-body" uk-overflow-auto>
                    <p v-if="this.applications.length == 0 && this.role == 'master'">Заявок нет<br>Чтобы клиенты больше вам доверяли, добавляйте
                        больше записей</p>
                    <p v-if="this.applications.length == 0 && this.role == 'user'">Заявок нет</p>
                    <p style="border: 1px solid black" class="pa-5" v-for="application in applications"
                        :class="initClass(application.status)">
                    <p>Мастер: {{ application.id_master.name }} {{ application.id_master.surname }}</p>
                    <p>Клиент: {{ application.id_user.name }}</p>
                    <p>Комментарий клиента: {{ application.text }}</p>
                    <p>Номер клиента: {{ application.number }}</p>
                    <p>Почта клиента: {{ application.id_user.email }}</p>
                    <p>Статус заявки: {{ application.status }}</p>
                    <div v-if="application.status == 'Принято, скоро с вами свяжутся' && this.role == 'user'">
                        <v-btn variant="tonal" rounded="0" class="bg-red" href="#modal-comm" uk-toggle>Экстренно
                            завершено</v-btn>
                    </div>
                    <div v-if="application.status == 'Отправлен' && this.role == 'master'">
                        <v-btn variant="tonal" rounded="0" class="bg-green uk-modal-close"
                            @click.prevent="statusApplications(this.status_good, application.id)">Принять и
                            связаться</v-btn>
                        <v-btn variant="tonal" rounded="0" class="bg-red uk-modal-close"
                            @click.prevent="statusApplications(this.status_bad, application.id)">Отклонить</v-btn>
                    </div>
                    <div v-if="application.status == 'Принято, скоро с вами свяжутся' && this.role == 'master'">
                        <v-btn variant="tonal" rounded="0" class="bg-green uk-modal-close"
                            @click.prevent="statusApplications(this.status_good_end, application.id)">Успешно
                            завершено</v-btn>
                            <v-btn variant="tonal" rounded="0" class="bg-red" href="#modal-comm" uk-toggle>Экстренно
                            завершено</v-btn> 
                    </div>
                    <div id="modal-comm" uk-modal>
                            <div class="uk-modal-dialog uk-modal-body">
                                <h2 class="uk-modal-title">Напишите причину экстренного завершения заявки</h2>
                                <div class="uk-margin">
                                    <textarea class="uk-textarea" rows="5" v-model="this.application_master_comment"
                                        placeholder="Textarea" aria-label="Textarea"></textarea>
                                </div>
                                <p class="uk-text-right">
                                    <button class="uk-button uk-button-primary uk-modal-close" type="button"
                                        @click.prevent="statusApplications(this.status_bad_end, application.id)">Отправить</button>
                                </p>
                            </div>
                        </div>
                    </p>
                </div>

            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            applications: [],
            token: localStorage.getItem('token'),
            role: localStorage.getItem('role'),
            status_good: 'Принято, скоро с вами свяжутся',
            status_bad: 'Отклонено мастером',
            status_good_end: 'Успешно завершено',
            status_bad_end: 'Экстренно отклонено',
            id: '',
            application_master_comment: '',
            chooseClass: '',
        }
    },
    mounted() {
        this.getApplications()
    },
    methods: {
        getApplications() {
            console.log(this.role);
            if (this.role == 'master') {
                axios.get('/api/master/application', {
                    headers: {
                        "Authorization": "Bearer " + this.token,
                        'Accept': "application/json",
                        "Content-type": "application/json"
                    }
                }).then(response => {
                    this.applications = response.data.data
                    console.log(111111);
                })
            }
            else if (this.role == 'user') {
                axios.get('/api/applications', {
                    headers: {
                        "Authorization": "Bearer " + this.token,
                        'Accept': "application/json",
                        "Content-type": "application/json"
                    }
                }).then(response => {
                    this.applications = response.data.content
                    console.log(this.applications);
                })
            }

        },
        statusApplications(status, id) {
            if (this.application_master_comment) {
                axios.post(`/api/master/application/${id}/status`, {
                    status: status,
                    comm_master: this.application_master_comment
                }, {
                    headers: {
                        "Authorization": "Bearer " + this.token,
                        'Accept': "application/json",
                        "Content-type": "application/json"
                    }
                }).then(response => {
                    this.getApplications()
                    console.log(response.message);
                })
            }
            else {
                axios.post(`/api/master/application/${id}/status`, {
                    status: status,
                }, {
                    headers: {
                        "Authorization": "Bearer " + this.token,
                        'Accept': "application/json",
                        "Content-type": "application/json"
                    }
                }).then(response => {
                    this.getApplications()
                    console.log(response.message);
                })
            }

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