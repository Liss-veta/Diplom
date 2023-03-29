<template>
    <v-row justify="center">
        <v-dialog v-model="dialog" class="bg-pink-lighten-3" persistent width="1024">
            <template v-slot:activator="{ props }">
                <v-btn v-bind="props">
                    Хочу стать мастером
                </v-btn>
            </template>
            <v-card>
                <v-card-title>
                    <span class="text-h5">{{ this.name }}, заполните поля, чтобы подать заявку</span>
                </v-card-title>
                <v-card-text>
                    <v-container>
                        <v-row>
                            <v-col cols="12" sm="6" md="4">
                                <!-- <v-text-field label="Ваше Имя" prepend-icon="mdi-at"></v-text-field> -->
                                <v-text-field label="Ваше имя" v-model="this.name" hint="Введите ваше имя"
                                    persistent-hint append-inner-icon="mdi-account-edit" required></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6" md="4">
                                <v-text-field label="Ваша фамилия" v-model="this.master.surname" hint="Введите вашу фамилию"
                                    persistent-hint append-inner-icon="mdi-account-edit" required></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6" md="4">
                                <v-text-field label="Ваш возраст" v-model="this.master.age" hint="Введите ваш возраст"
                                    persistent-hint append-inner-icon="mdi-account-clock" required></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6" md="4">
                                <v-text-field label="Стаж" v-model="this.master.staj"
                                    hint="Введите стаж вашей работы (в годах)" persistent-hint append-inner-icon="mdi-calendar-clock" required></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6" md="4">
                                <v-text-field label="Город" v-model="this.master.city"
                                    hint="Введите город, в котором вы работаете" persistent-hint append-inner-icon="mdi-city" required></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6" md="4">
                                <v-text-field label="Опыт работы" v-model="this.master.clients_count"
                                    hint="Введите примерное количество клиентов, с которыми вы работали (отображение 200+)"
                                    persistent-hint append-inner-icon="mdi-briefcase" required></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6" md="4">
                                <v-text-field label="Минимальная цена" v-model="this.master.min_cena"
                                    hint="Введите минимальную цену ваших услуг" append-inner-icon="mdi-cash" persistent-hint required></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6" md="8">
                                <v-textarea v-model="this.master.description" auto-grow variant="filled" color="deep-purple"
                                    label="Описание вас как профессионала" rows="1" append-inner-icon="mdi-comment"
                                    hint="Введите описание вас как профессионала, минимальное количество символов 350"></v-textarea>
                            </v-col>
                        </v-row>
                    </v-container>
                    <small>*Данные собираются для создания и заполнения вашей страницы-портфолио</small>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue-darken-1" variant="text" @click="dialog = false">
                        Отмена
                    </v-btn>
                    <v-btn color="green-darken-1" variant="text" @click.prevent="this.applications">
                        Далее
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-row>
</template>

<script>
export default {
    data: () => ({
        dialog: false,
        name: localStorage.getItem('name'),
        master: {
            name: '',
            surname: '',
            age: '',
            city: '',
            staj: '',
            clients_count: '',
            min_cena: '',
            description: ''
        },
        token: localStorage.getItem('token'),
        message_error: ''
    }),
    methods: {
        applications(){
            this.master.name = this.name
                axios.post('/api/master/create', {
                        'name': this.master.name,
                        'surname': this.master.surname,
                        'age': this.master.age,
                        'city': this.master.city,
                        'staj': this.master.staj,
                        'clients_count': this.master.clients_count,
                        'min_cena': this.master.min_cena,
                        'description': this.master.description,
                }, {
                    headers: {
                        "Content-type": "application/json",
                        "Accept": "application/json",
                        "Authorization":"Bearer "+this.token
                    }
                }).then(response => {
                    this.dialog = false
                    console.log(response)
                }).catch(response => {
                    console.log(response.response.data.message)
                })
        },
    }
}
</script>