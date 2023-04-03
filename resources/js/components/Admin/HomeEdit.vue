<template>
    <div class="w-100">
        <h2 class="pl-12 pt-4">Первый слайдер</h2>
        <v-row class="pa-12 pt-6">
            <v-col class="d-flex child-flex" cols="4" style="height:400px">
                <div class="uk-text-center">
                    <div class="hover uk-height-1-1 uk-inline-clip uk-transition-toggle uk-light" tabindex="0">
                        <img :src="this.one_slide" class="hover_img" alt="">
                        <div class="uk-position-center px-4" style="width:100%">
                            <span class="uk-transition-fade uk-width-1-1"><v-file-input class="w-100" type="file"
                                    label="Нажмите чтобы выбрать изображение" variant="filled"
                                    v-on:change="handleFileUpload()" prepend-icon="mdi-camera"
                                    ref="slider"></v-file-input><v-btn elevation="2" outlined plain tile
                                    @click.prevent="update(1)">Сохранить</v-btn></span>
                        </div>
                    </div>
                </div>
            </v-col>
            <v-col class="d-flex child-flex" cols="4" style="height:400px">
                <div class="uk-text-center">
                    <div class="hover uk-height-1-1 uk-inline-clip uk-transition-toggle uk-light" tabindex="0">
                        <img :src="this.two_slide" class="hover_img" alt="">
                        <div class="uk-position-center px-4" style="width:100%">
                            <span class="uk-transition-fade uk-width-1-1"><v-file-input class="w-100" type="file"
                                    label="Нажмите чтобы выбрать изображение" variant="filled"
                                    v-on:change="handleFileUpload()" prepend-icon="mdi-camera"
                                    ref="slider"></v-file-input><v-btn elevation="2" outlined plain tile
                                    @click.prevent="update(2)">Сохранить</v-btn></span>
                        </div>
                    </div>
                </div>
            </v-col>
            <v-col class="d-flex child-flex" cols="4" style="height:400px">
                <div class="uk-text-center">
                    <div class="hover uk-height-1-1 uk-inline-clip uk-transition-toggle uk-light" tabindex="0">
                        <img :src="this.three_slide" class="hover_img" alt="">
                        <div class="uk-position-center px-4" style="width:100%">
                            <span class="uk-transition-fade uk-width-1-1"><v-file-input class="w-100" type="file"
                                    label="Нажмите чтобы выбрать изображение" variant="filled"
                                    v-on:change="handleFileUpload()" prepend-icon="mdi-camera"
                                    ref="slider"></v-file-input><v-btn elevation="2" outlined plain tile
                                    @click.prevent="update(3)">Сохранить</v-btn></span>
                        </div>
                    </div>
                </div>
            </v-col>
        </v-row>
        <hr>
        <h2 class="pl-12 pt-4">Контакты</h2>
        <div>
            <v-form>
                <v-container>
                    <v-row>
                        <v-col cols="12" md="4">
                            <v-text-field v-model="title" required label="Позвоните нам"
                                value="Позвоните нам"></v-text-field>
                        </v-col>
                        <v-col cols="12" md="4">
                            <v-text-field v-model="description"  required label="Есть вопросы?"
                                value="Есть вопросы? мы поможем"></v-text-field>
                        </v-col>
                        <v-col cols="12" md="4">
                            <v-text-field v-model="contact"  required label="+7(906)-457-03-40"
                                value="+7(906)-457-03-40"></v-text-field>
                        </v-col>
                    </v-row>
                </v-container>
                <v-btn class="ml-13 mt-0 mb-6" @click.prevent="updateContact(1)">Сохранить изменения</v-btn>
            </v-form>
            <v-form>
                <v-container class="mb-1">
                    <v-row class="mb-1">
                        <v-col cols="12" md="4">
                            <v-text-field v-model="title"  required label="Напишите нам"
                                value="Напишите нам"></v-text-field>
                        </v-col>
                        <v-col cols="12" md="4">
                            <v-text-field v-model="description"  required label="Мы открыты..."
                                value="Мы открыты для любых вопросов"></v-text-field>
                        </v-col>
                        <v-col cols="12" md="4">
                            <v-text-field v-model="contact"  required label="admin@mail.ru"
                                value="admin@mail.ru"></v-text-field>
                        </v-col>
                    </v-row>
                </v-container>
                <v-btn class="ml-13 mt-0 mb-6" @click.prevent="updateContact(2)">Сохранить изменения</v-btn>
            </v-form>
            <v-form>
                <v-container>
                    <v-row>
                        <v-col cols="12" md="4">
                            <v-text-field v-model="title"  required label="Обратная связь"
                                value="Обратная связь"></v-text-field>
                        </v-col>
                        <v-col cols="12" md="4">
                            <v-text-field v-model="description"  required label="Помогите нам..."
                                value="Помогите нам стать лучше"></v-text-field>
                        </v-col>
                        <v-col cols="12" md="4">
                            <v-text-field v-model="contact" required label="Оставить отзыв"
                                value="Оставить отзыв"></v-text-field>
                        </v-col>
                    </v-row>
                </v-container>
                <v-btn class="ml-13 mt-0 mb-6" @click.prevent="updateContact(3)">Сохранить изменения</v-btn>
            </v-form>
        </div>
    </div>
</template>

<script>
import axios from 'axios';


export default {
    data() {
        return {
            id: '',
            file: null,
            slider: "",
            token: localStorage.getItem('token'),
            arr_slides: [],
            one_slide: '',
            two_slide: '',
            three_slide: '',
            title: '',
            description: '',
            contact:'',
        }
    },
    mounted() {
        this.getIndex()
    },
    methods: {
        getIndex() {
            axios.get('api/admin/slider', {
                headers: {
                    "Authorization": "Bearer " + this.token
                }
            }).then(response => {
                this.one_slide = response.data.content[0].image;
                this.two_slide = response.data.content[1].image;
                this.three_slide = response.data.content[2].image;
                console.log(this.one_slide);
                console.log(response.data.content)
            }).catch(response => { console.log(response) })
        },
        update(id) {
            let formData = new FormData();
            formData.append("slider", this.file);
            axios.post(`/api/admin/slider/${id}/update`, formData, {
                headers: {
                    "Authorization": "Bearer " + this.token,
                }
            }).then(response => {
                this.getIndex()
                console.log(response)
            }).catch(response => {
                console.log(response.response.data.message)
            })
        },
        updateContact(id){
            axios.post(`/api/admin/contact/${id}/update`, JSON.stringify({
                        'title': this.title,
                        'description': this.description,
                        'contact': this.contact,
                }),{
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
        },
        handleFileUpload() {
            this.file = this.$refs.slider.files[0];
        },
    }
}

</script>

<style>
.hover:hover .hover_img {
    filter: brightness(30%);
    transition: .2s ease-in-out;
}
</style>