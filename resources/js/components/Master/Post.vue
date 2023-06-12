<template>
    <div class="w-100 d-flex flex-column align-center">
        <div class="w-80">
            <v-tabs v-model="tab">
                <v-tab value="one">Портфолио работ</v-tab>
                <v-tab value="two">Советы мастера</v-tab>
            </v-tabs>
            <v-card-text class="w-100">
                <v-window v-model="tab">
                    <v-window-item value="one">
                        <div class="w-100 d-flex flex-column align-center">
                            <div class="w-100 d-flex justify-space-around my-12" v-for="post in  this.posts " :key="post">
                                <v-card class="w-35">
                                    <v-card-title class="h-10">
                                        <h3 class="pl-1">
                                            {{ post.id_master.name }} {{ post.id_master.surname }}
                                        </h3>
                                    </v-card-title>
                                    <hr class="mt-3">
                                    <v-card-text class="h-50 px-6">{{ post.description }}</v-card-text>
                                    <hr>
                                    <div class="px-5 d-flex justify-space-between align-center">
                                        <div v-if="post.id_master.id_user == this.id_my">
                                            <v-btn :href="'#modal-edit-post' + post.id" uk-toggle variant="plain"
                                                icon="mdi-pencil-outline"></v-btn>
                                            <div :id="'modal-edit-post' + post.id" uk-modal>
                                                <div class="uk-modal-dialog uk-modal-body">
                                                    <h2 class="uk-modal-title">Редактирование поста</h2>
                                                    <v-textarea label="Текст поста" v-model="this.description">
                                                        {{ post.description }}</v-textarea>
                                                    <div class="w-100 d-flex">
                                                        <v-col class="d-flex child-flex w-50"
                                                            v-for="  image  in  post.arr_images  " cols="4"
                                                            style="height:200px">
                                                            <div class="uk-text-center">
                                                                <div class="hover uk-height-1-1 uk-inline-clip uk-transition-toggle uk-light"
                                                                    tabindex="0">
                                                                    <img :src="image.image" class="hover_img" alt="">
                                                                    <form class="uk-position-center px-4"
                                                                        style="width:100%">
                                                                        <span
                                                                            class="uk-transition-fade uk-width-1-1"><v-file-input
                                                                                class="w-100" type="file"
                                                                                placeholder="353354"
                                                                                label="Нажмите чтобы выбрать изображение"
                                                                                ref="post"></v-file-input><v-btn
                                                                                elevation="2" outlined plain tile
                                                                                @click.prevent=" this.currentImageId = image.id; update(image.id)">Сохранить</v-btn></span>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </v-col>
                                                    </div>
                                                    <p class="uk-text-right">
                                                        <button class="uk-button uk-button-default uk-modal-close"
                                                            type="button">Cancel</button>
                                                    </p>
                                                </div>
                                            </div>
                                            <v-btn @click.prevent=" deletePost(post.id)" variant="plain"
                                                icon="mdi-delete-outline"></v-btn>
                                        </div>
                                        <span class="h-25 px-5">{{ post.created_at.substr(0, 10) }}</span>
                                    </div>
                                </v-card>
                                <div class="w-50">
                                    <div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1"
                                        uk-slider="center: true">
                                        <ul class="uk-slider-items uk-grid">
                                            <li class="uk-width-3-4" v-for="    image     in     post.arr_images    "
                                                :key="image">
                                                <div class="uk-panel">
                                                    <img :src="image.image" width="400"
                                                        style="height: 400px; object-fit: cover;" alt="">
                                                    <div class="uk-position-center uk-panel">
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>

                                        <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#"
                                            uk-slidenav-previous uk-slider-item="previous"></a>
                                        <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#"
                                            uk-slidenav-next uk-slider-item="next"></a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </v-window-item>
                    <v-window-item value="two">
                        <div v-for="sovet in this.sovets" :key="sovet">
                            <div class="width-block mx-auto">
                                <div class="d-flex flex-column flex-md-row flex-lg-row flex-xl-row mt-12">
                                    <v-col>
                                        <div>
                                            <article class="uk-comment uk-visible-toggle" tabindex="-1" role="comment">
                                                <header class="uk-comment-header uk-position-relative">
                                                    <div class="otst uk-flex-middle" uk-grid>
                                                        <div class="uk-width-auto mx-auto avatar">
                                                            <img class="uk-comment-avatar" :src="sovet.id_master.avatar"
                                                                width="100" height="100" cover alt="">
                                                        </div>
                                                        <div class="uk-width-expand margin-h4">
                                                            <h4 class="uk-comment-title text-h5 black--text"><a
                                                                    class="uk-link-reset" href="#">{{ sovet.id_master.name
                                                                    }} {{ sovet.id_master.surname }}</a></h4>
                                                            <span
                                                                v-if="sovet.privilege == 0 && sovet.id_master.id_user == this.id_my"
                                                                class="text-info">На стадии рассмотрения
                                                                администратором</span>
                                                            <span
                                                                v-if="sovet.privilege == 1 && sovet.id_master.id_user == this.id_my"
                                                                class="text-green">Активно для всех</span>
                                                            <span
                                                                v-if="sovet.privilege == 2 && sovet.id_master.id_user == this.id_my"
                                                                class="text-red">Отклонено, видно только вам</span>
                                                        </div>
                                                    </div>
                                                    <div class="uk-position-top-right uk-position-small"><a href="#"><v-img
                                                                class="arrow" src="public/assets/Arrow.png"></v-img></a>
                                                    </div>
                                                </header>
                                            </article>
                                        </div>
                                        <hr class="w-100 mt-6 mb-10">
                                        <div class="text-sovet">
                                            {{ sovet.description }}
                                        </div>
                                    </v-col>
                                    <v-col>
                                        <div class="height-100 uk-position-relative" uk-slideshow="animation: fade">
                                            <ul class="height-100 uk-slideshow-items">
                                                <li v-for="image in sovet.arr_images" :key="image">
                                                    <img :src="image.image" alt="" uk-cover>
                                                </li>
                                            </ul>
                                            <div
                                                class="uk-position-center-right uk-position-small h-100 d-flex align-center">
                                                <ul class="uk-thumbnav uk-thumbnav-vertical" cover>
                                                    <li v-for="(image, index) in sovet.arr_images" style="height:75px;"
                                                        cover :key="image" :uk-slideshow-item="index">
                                                        <a class="h-100" href="#" cover><img :src="image.image"
                                                                class="h-100" width="99" style="object-fit: cover;" uk-cover
                                                                alt=""></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </v-col>
                                </div>
                                <v-divider class="my-8"></v-divider>
                            </div>
                        </div>

                    </v-window-item>
                </v-window>
            </v-card-text>
        </div>

    </div>
</template>

<script>
import axios from 'axios';
import NotificationCenter from '@/scripts/notifications.js';
const NC = new NotificationCenter;

export default {
    data() {
        return {
            tab: null,
            id: this.$route.params.id,
            currentImageId: 0,
            posts: [],
            sovets: [],
            name: '',
            postImages: [],
            surname: '',
            images: [],
            description: '',
            token: localStorage.getItem('token'),
            id_my: localStorage.getItem('id'),
        }
    },
    mounted() {
        this.getPosts(this.$route.params.id)
        this.getSovets(this.$route.params.id)
    },
    methods: {
        getSovets(id) {
            axios.get(`/api/master/${id}/sovet`, this.id, {
                headers: {
                    'Accept': 'application/json',
                    'Content-type': 'application/json',
                }
            }).then(response => {
                // sovet.privilege == 1 || sovet.privilege == 2 && sovet.id_master.id_user == this.id_my
                if (response.data.data[0].id_master.id_user == this.id_my) {
                    this.sovets = response.data.data
                }
                else {
                    for (let index = 0; index < response.data.data.length; index++) {
                        if (response.data.data[index].privilege == 1) {
                            this.sovets.push(response.data.data[index])
                        }
                    }
                }

                console.log(response.data.data);
            }).catch(response => { console.log(response) })
        },
        getPosts(id) {
            axios.get(`/api/master/${id}/post`, this.id, {
                headers: {
                    'Accept': 'application/json',
                    'Content-type': 'application/json',
                }
            }).then(response => {
                this.posts = response.data.data
                this.posts.forEach(post => {
                    post.arr_images.forEach(image => {
                        this.postImages.push(image.id)
                    })
                });
            }).catch(response => { console.log(response) })
        },
        deletePost(id) {
            axios.delete(`/api/master/post/${id}`, {
                headers: {
                    'Accept': 'application/json',
                    'Content-type': 'application/json',
                    'Authorization': 'Bearer ' + localStorage.getItem('token')
                }
            }).then(response => {
                NC.spawnNote("success", response.data.message, '', ["Закрыть"])
                this.getPosts()
            })
        },
        update(id) {
            let formData = new FormData();
            for (let index = 0; index < this.postImages.length; index++) {
                if (this.currentImageId == this.postImages[index]) {
                    formData.append("image", this.$refs.post[index].files[0]);
                }
            }
            axios.post(`/api/master/post/image/${id}/update`, formData, {
                headers: {
                    "Authorization": "Bearer " + this.token,
                    "Content-Type": 'multipart/form-data',
                }
            }).then(response => {
                NC.spawnNote("success", response.data.message, '', ["Закрыть"])
                this.getPosts(this.$route.params.id)
            }).catch(response => {
            })
        },
        updateText() {
            axios.post(`/api/master/post/${id}/update/text`, '')
        }
    },
}
</script>

<style scoped>
.hover:hover .hover_img {
    filter: brightness(30%);
    transition: .2s ease-in-out;
}

.w-80 {
    width: 80%;
}

.w-35 {
    width: 30%;
}

.h-10 {
    height: 10%;
}
</style>