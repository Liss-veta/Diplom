<template>
    <h2 class="text-center" v-if="this.cooperation_masters.length == 0">Заявок на сотрудничество нет<br>В ожидании новых мастеров</h2>
    <div class="d-flex pa-12 align-stretch" style="max-height: 450px" v-for="cooperation in this.cooperation_masters" :key="cooperation">
        <div class="w-50 pa-5 pb-0 d-flex flex-column justify-space-between">
            <div class="d-flex justify-space-between">
                <h5 class="text-h5 ma-0">Имя Фамилия:</h5>
                <h5 class="text-h5 ma-0">{{ cooperation.name + ' ' + cooperation.surname }}</h5>
            </div>
            <div class="d-flex justify-space-between">
                <p class="ma-0">Возраст: </p>
                <p class="ma-0">{{ cooperation.age }}</p>
            </div>
            <div class="d-flex justify-space-between">
                <p class="ma-0">Город: </p>
                <p class="ma-0">{{ cooperation.city }}</p>
            </div>
            <div class="d-flex justify-space-between">
                <p class="ma-0">Стаж: </p>
                <p class="ma-0">{{ cooperation.staj }}</p>
            </div>
            <div class="d-flex justify-space-between">
                <p class="ma-0">Стоимость от: </p>
                <p class="ma-0">{{ cooperation.min_cena }}</p>
            </div>
            <div class="d-flex justify-space-between">
                <p class="ma-0">Клиентооборот: </p>
                <p class="ma-0">{{ cooperation.clients_count }}</p>
            </div>
            <div class="d-flex justify-space-between">
                <p class="ma-0">Описание: {{ cooperation.description }}</p>
            </div>
            <hr>
            <div class="w-100">
                <v-btn class="w-50" variant="outlined" rounded="0" color="green"
                    @click.prevent="answerAdmin(cooperation.id_user, this.good_answer)">Принять</v-btn>
                <v-btn class="w-50" variant="outlined" rounded="0" color="red"
                    @click.prevent="answerAdmin(cooperation.id_user, this.bad_answer)">Отклонить</v-btn>
            </div>
        </div>
        <div class="w-50 text-center"><img class="h-100" cover :src="cooperation.avatar" alt="avatar_master"></div>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    data() {
        return {
            cooperation_masters: [],
            token: localStorage.getItem('token'),
            good_answer: 'active',
            bad_answer: 'not',
        }
    },
    mounted() {
        this.getCooperation()
    },
    methods: {
        getCooperation() {
            axios.get('/api/admin/cooperation/master', {
                headers: {
                    'Authorization': 'Bearer ' + this.token,
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                }
            }).then(response => {
                this.cooperation_masters = response.data
                console.log(response.data);
            }).catch(response => { console.log(response); })
        },
        answerAdmin(id, answer) {
            axios.post(`/api/admin/cooperation/${id}`, {
                answer: answer
            }, {
                headers: {
                    'Authorization': 'Bearer ' + this.token,
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                }
            }).then(response => { this.getCooperation() })
                .catch(response => { console.log(response); })
        }
    }
}
</script>