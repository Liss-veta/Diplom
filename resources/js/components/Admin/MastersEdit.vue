<template>
    <div v-for="masters in this.arr_masters" :key="masters">
        <div class="px-12 pt-6 w-100">

            <h2>{{ masters.name }} {{ masters.surname }}</h2>
            <div class="w-100 d-flex justify-space-between">
                <img style="height: 250px; width: 250px; object-fit: cover;" :src="masters.avatar" alt="">
                <div style="border-top: 1px solid black;" class="w-75 px-12 d-flex flex-column justify-space-between">
                    <h5 class="text-h5 mt-6 mb-1">Возраст: {{ masters.age }}</h5>
                    <h5 class="text-h5 mt-1">Город: {{ masters.city }}</h5>
                    <div class="my-6">
                        <v-chip size="large" class="mr-2" label color="success" text-color="white">
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
                        </v-chip>
                    </div>
                    <div class="w-100">
                        <v-btn class="w-50" variant="outlined" rounded="0" @click.prevent="this.$router.push('/profile/' + masters.id)">Перейти в профиль</v-btn>
                        <v-btn class="w-25 bg-red-darken-4" rounded="0" @click.prevent="ban(masters.id)">Забанить</v-btn>
                        <v-btn color="white" class="w-25 bg-light-green-lighten-1" rounded="0">Привелегия</v-btn>
                    </div>
                </div>
            </div>
        </div>
        <hr class="my-5">
    </div>
</template>

<script>

export default {
    data() {
        return {
            arr_masters: [],
            token: localStorage.getItem('token')
        }
    },
    mounted() {
        this.all()
    },
    methods: {
        all() {
            axios.get('api/masters').then(response => {
                this.arr_masters = response.data.content;
                console.log(response.data.content)
            }).catch(response => { console.log(response) })

        },
        ban(id){
            axios.post(`/api/admin/masters/${id}/update`, id, {
                headers: {
                    "Authorization": "Bearer " + this.token,
                    'Accept': 'application/json',
                    'Content-type': 'application/json',
                }
            }).then(response => {
                // this.getContact()
                console.log(response)
            }).catch(response => {
                console.log(response.response.data.message)
            })
        }

    }
}
</script>