<template>
    <div class="w-100 d-flex flex-column align-center">
        <div class="w-80 d-flex justify-space-around my-12" v-for="post in this.posts" :key="post">
            <v-card class="w-35">
                <v-card-title class="uk-height-1-5">
                    <h3>{{ post.id_master.name }} {{ post.id_master.surname }}</h3>
                </v-card-title>
                <hr>
                <v-card-text class="uk-height-3-5">{{ post.description }}</v-card-text>
                <hr>
                <span class="uk-height-1-5 text-end">{{ post.created_at.substr(0,10) }}</span>
            </v-card>
            <div class="w-50">
                <div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1" uk-slider="center: true">
                    <ul class="uk-slider-items uk-grid">
                        <li class="uk-width-3-4" v-for="image in post.arr_images" :key="image">
                            <div class="uk-panel">
                                <img :src="'/storage/' + image.image" width="400" style="height: 400px; object-fit: cover;"
                                    alt="">
                                <div class="uk-position-center uk-panel">
                                </div>
                            </div>
                        </li>
                    </ul>

                    <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous
                        uk-slider-item="previous"></a>
                    <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next
                        uk-slider-item="next"></a>

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
            id: this.$route.params.id,
            posts: [],
            name: '',
            surname: '',
            images: [],
        }
    },
    mounted() {
        this.getPosts()
    },
    methods: {
        getPosts() {
            axios.get(`/api/master/${this.id}/post`, this.id, {
                headers: {
                    'Accept': 'application/json',
                    'Content-type': 'application/json',
                }
            }).then(response => {
                this.posts = response.data.data
                console.log(response);
            }).catch(response => { console.log(response) })
        }
    }
}
</script>

<style>
.w-80 {
    width: 80%;
}

.w-35 {
    width: 30%;
}</style>