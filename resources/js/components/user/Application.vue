<template>
    <v-row justify="center">
        <v-dialog v-model="dialog" class="bg-pink-lighten-3 d-flex" persistent width="1024">
            <template v-slot:activator="{ props }">
                <v-btn class="text-black text-body-1" bg-color="pink" variant="text" v-bind="props">
                    Хочу стать мастером
                </v-btn>
            </template>
            <v-card class="widt-100">
                <v-card-title>
                    <span class="text-h5">{{ this.name }}, заполните поля, чтобы подать заявку</span>
                </v-card-title>
                <v-card-text>
                    <v-container>
                        <v-row>
                            <v-col cols="12" sm="6" md="4">
                                <!-- <v-text-field label="Ваше Имя" prepend-icon="mdi-at"></v-text-field> -->
                                <v-text-field label="Ваше имя" v-model="this.name" hint="Введите ваше имя" persistent-hint
                                    append-inner-icon="mdi-account-edit" required></v-text-field>
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
                                    hint="Введите стаж вашей работы (в годах)" persistent-hint
                                    append-inner-icon="mdi-calendar-clock" required></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6" md="4">
                                <v-text-field label="Город" v-model="this.master.city"
                                    hint="Введите город, в котором вы работаете" persistent-hint
                                    append-inner-icon="mdi-city" required></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6" md="4">
                                <v-text-field label="Опыт работы" v-model="this.master.clients_count"
                                    hint="Введите примерное количество клиентов, с которыми вы работали (отображение 200+)"
                                    persistent-hint append-inner-icon="mdi-briefcase" required></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6" md="4">
                                <v-text-field label="Минимальная цена" v-model="this.master.min_cena"
                                    hint="Введите минимальную цену ваших услуг" append-inner-icon="mdi-cash" persistent-hint
                                    required></v-text-field>
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
                    <v-btn color="brown" variant="text" @click="dialog = false">
                        Отмена
                    </v-btn>
                    <v-btn color="green-darken-1" variant="text" @click.prevent="this.animation">
                        Далее
                    </v-btn>
                </v-card-actions>
            </v-card>
            <v-card class="widt-0 h-100 py-4">
                <v-card-title>
                    <span class="text-h5">{{ this.name }}, для отправки данных прикрепите вашу фотографию </span>
                </v-card-title>
                <v-card-text class="d-flex flex-column align-center justify-center">
                    <div class="w-50 d-flex flex-column justify-center align-center">
                        <img src="assets/no_avatar.jpg" alt="avatar" class="py-4 w-50">
                        <v-file-input name="avatar" ref="avatar" type="file" v-on:change="handleFileUpload()"
                            label="File input" variant="filled" prepend-icon="mdi-camera" class="w-100"></v-file-input>
                        <v-col cols="12" sm="11">
                            <v-select chips
                            multiple 
                            v-model="this.categories"
                            label="Select"
                            :items="this.tags"></v-select>
                        </v-col>
                    </div>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="brown" variant="text" @click="dialog = false">
                        Отмена
                    </v-btn>
                    <v-btn color="green-darken-1" variant="text" @click.prevent="this.applications">
                        Отправить
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
        tags: [],
        categories: [],
        file: null,
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
        token: localStorage.getItem('token'),
        message_error: ''
    }),
    mounted() {
        this.getTags()
    },
    methods: {
        getTags() {
            axios.get('api/tags', {
                headers: {
                    'Authorization': 'Bearer ' + localStorage.getItem('token')
                }
            }).then(response => {
                for (let index = 0; index < response.data.length; index++) {
                    this.tags.push(response.data[index].tag_name);
                }
            }).catch(error => { console.log(error) })
        },
        applications() {
            this.master.name = this.name
            let formData = new FormData();
            formData.append("method", "_POST");
            formData.append("avatar", this.file);
            formData.append("categories", this.categories);
            formData.append("name", this.master.name);
            formData.append("surname", this.master.surname);
            formData.append("age", this.master.age);
            formData.append("city", this.master.city);
            formData.append("staj", this.master.staj);
            formData.append("clients_count", this.master.clients_count);
            formData.append("min_cena", this.master.min_cena);
            formData.append("description", this.master.description);
            axios.post('/api/master/create', formData, {
                headers: {
                    "Content-type": "multipart/form-data",
                    "Authorization": "Bearer " + this.token
                }
            }).then(response => {
                this.dialog = false
                console.log(response)
            }).catch(response => {
                console.log(response.response.data.message)
            })
        },
        animation() {
            document.querySelector('.widt-100').style.width = '0%'
            document.querySelector('.widt-0').style.width = '100%'
            document.querySelector('.widt-100').style.transition = '.4s ease-in'
            document.querySelector('.widt-0').style.transition = '.4s ease-in'
        },
        handleFileUpload() {
            this.file = this.$refs.avatar.files[0];
        },
    }
}
</script>

<style>
.v-overlay-container .v-dialog .v-overlay__content {
    flex-direction: row;
}

.widt-100 {
    width: 100%;
}

.widt-0 {
    width: 0%;
}
</style>