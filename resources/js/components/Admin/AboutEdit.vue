<template>
    <div class="w-100">
        <h2 class="pl-12 pt-4">Вступительный блок о нас</h2>
        <v-row class="pa-12 pt-6 justify-space-around">
            <v-col class="d-flex child-flex" cols="4" style="height:400px">
                <div class="uk-text-center">
                    <div class="hover uk-height-1-1 uk-inline-clip uk-transition-toggle uk-light" tabindex="0">
                        <img :src="this.image_one" class="hover_img" alt="">
                        <div class="uk-position-center px-4" style="width:100%">
                            <span class="uk-transition-fade uk-width-1-1"><v-file-input class="w-100" type="file"
                                    label="Нажмите чтобы выбрать изображение" variant="filled"
                                    v-on:change="handleFileUpload()" prepend-icon="mdi-camera"
                                    ref="slider"></v-file-input><v-btn elevation="2" outlined plain tile
                                    @click.prevent="updateImg(1)">Сохранить</v-btn></span>
                        </div>
                    </div>
                </div>
            </v-col>
            <v-col>
                <div class="d-flex w-75">
                    <form>
                        <label>О нас</label>
                        <textarea class="pa-3" v-model="this.text_one" cols="70" rows="11"></textarea>
                        <v-btn class="mt-3" @click.prevent="updateText()">Изменить</v-btn>                        
                    </form>
                </div>
            </v-col>
        </v-row>
        <hr>
        <h2 class="pl-12 pt-4">Лента изображений</h2>
        <div>
            <v-row class="pa-12 pt-6">
            <v-col v-for="image in this.lenta_slider" class="d-flex child-flex" cols="4" style="height: 300px">
                <div class="uk-text-center">
                    <div class="hover uk-height-1-1 uk-inline-clip uk-transition-toggle uk-light" tabindex="0">
                        <img :src="image.image" class="hover_img" alt="">
                        <div class="uk-position-center px-4" style="width:100%">
                            <span class="uk-transition-fade uk-width-1-1"><v-file-input class="w-100" type="file"
                                    label="Нажмите чтобы выбрать изображение" variant="filled"
                                    prepend-icon="mdi-camera"
                                    ref="slider"></v-file-input><v-btn elevation="2" outlined plain tile
                                    @click.prevent="update(image.id)">Сохранить</v-btn></span>
                        </div>
                    </div>
                </div>
            </v-col>
        </v-row>
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
            lenta_slider: [],
            image_one: "",
            text_one: "",
            token: localStorage.getItem('token'),
            arr_slides: [],
            first_image: '',
            title: '',
            description: '',
            contact:'',
        }
    },
    mounted() {
        this.getIndex()
        this.getGallery()
    },
    methods: {
        getGallery(){
            axios.get('api/about/gallery').then(response => {
                this.lenta_slider = response.data.content
                console.log(response.data.content)
            }).catch(response => { console.log(response) })
        },
        getIndex() {
            axios.get('api/about', {
                headers: {
                    "Authorization": "Bearer " + this.token
                }
            }).then(response => {
                this.image_one = response.data.content[0].image
                this.text_one = response.data.content[0].description
                console.log(response.data.content)
            }).catch(response => { console.log(response) })
        },
        update(id) {
            let formData = new FormData();
            for (let index = 0; index < this.lenta_slider.length; index++) {
                if (id == this.lenta_slider[index].id) {
                    formData.append("slider", this.$refs.slider[id - 1].files[0]);
                }
            }
            axios.post(`/api/admin/about/gallery/${id}/update`, formData, {
                headers: {
                    "Authorization": "Bearer " + this.token,
                }
            }).then(response => {
                this.getGallery()
                console.log(response)
            }).catch(response => {
                console.log(response.response.data.message)
            })
        },
        updateImg() {
            let formData = new FormData();
            formData.append("first_image", this.file);
            axios.post(`/api/admin/about/image/update`, formData, {
                headers: {
                    "Authorization": "Bearer " + this.token,
                }
            }).then(response => {
                this.getIndex()
            }).catch(response => {
                console.log(response.response.data.message)
            })
        },
        updateText(){
            axios.post(`/api/admin/about/text/update`, JSON.stringify({
                        'description': this.text_one,
                }),{
                headers: {
                    "Authorization": "Bearer " + this.token,
                    'Accept': 'application/json',
                    'Content-type': 'application/json',
                }
            }).then(response => {
                this.getIndex()
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