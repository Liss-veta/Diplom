<template>
    <div class="w-100 d-flex flex-column align-center">
        <div class="w-75" v-for="sovet in this.sovets" :key="sovet">
            <div class="width-block mx-auto">
                <div class="d-flex flex-column flex-md-row flex-lg-row flex-xl-row mt-12">
                    <v-col>
                        <div>
                            <article class="uk-comment uk-visible-toggle" tabindex="-1" role="comment">
                                <header class="uk-comment-header uk-position-relative">
                                    <div class="otst uk-flex-middle" uk-grid>
                                        <div class="uk-width-auto mx-auto avatar">
                                            <img class="uk-comment-avatar" :src="sovet.id_master.avatar" width="100"
                                                height="100" cover alt="">
                                        </div>
                                        <div class="uk-width-expand margin-h4">
                                            <h4 class="uk-comment-title text-h5 black--text"><a class="uk-link-reset">{{
                                                sovet.id_master.name
                                            }} {{ sovet.id_master.surname }}</a></h4>
                                            <v-btn prepend-icon="mdi-trash-can" rounded="0" variant="tonal" color="red" @click.prevent="deleteSovet(sovet.id)">Удалить</v-btn>
                                        </div>
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
                        <div class="h-100 uk-position-relative" cover uk-slideshow="animation: fade">
                            <ul class="h-100 uk-slideshow-items" cover>
                                <li v-for="image in sovet.arr_images" cover :key="image">
                                    <img :src="image.image" alt="" cover>
                                </li>
                            </ul>
                            <div class="uk-position-center-right uk-position-small h-100 d-flex align-center">
                                <ul class="uk-thumbnav uk-thumbnav-vertical" cover>
                                    <li v-for="(image, index) in sovet.arr_images" style="height:75px;" cover :key="image" :uk-slideshow-item="index">
                                        <a class="h-100" href="#" cover><img :src="image.image" class="h-100" width="99" style="object-fit: cover;" uk-cover alt=""></a></li>
                                </ul>
                            </div>

                        </div>
                    </v-col>
                </div>
                <v-divider class="my-8"></v-divider>
            </div>
        </div>
    </div>
</template>

<script>
import { mdiHeartOutline, mdiHeart } from '@mdi/js';
import NotificationCenter from '@/scripts/notifications.js';
const NC = new NotificationCenter;
export default {
    data() {
        return {
            sovets: [],
            token: localStorage.getItem('token'),
        }
    },
    mounted() {
        this.getSovets()
    },
    methods: {
        getSovets() {
            axios.get('/api/sovets').then(response => {
                this.sovets = response.data.content
                console.log(this.sovets);
            })
        },
        deleteSovet(id){
            axios.delete(`/api/admin/delete/${id}/sovet`,{
                headers: {
                    'Authorization': 'Bearer ' + this.token,
                    'Accept': "application/json",
                    'Content-type': "application/json"
                }
            }).then(response => {
                this.getSovets()
                NC.spawnNote("success", response.data.message, '', ["Закрыть"])
            })
        }
    }
}
</script>