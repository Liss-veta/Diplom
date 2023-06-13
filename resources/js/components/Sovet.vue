<template>
    <div v-for="sovet in this.sovets" :key="sovet">
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
                                    </div>
                                </div>
                                <div class="uk-position-top-right uk-position-small"
                                    @click.prevent="this.$router.push('/profile/' + sovet.id_master.id)"><img class="arrow"
                                        src="../../../public/assets/Arrow.png">
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
                        <div class="uk-position-center-right uk-position-small h-100 d-flex align-center">
                            <ul class="uk-thumbnav uk-thumbnav-vertical" cover>
                                <li v-for="(image, index) in sovet.arr_images" style="height:75px;" cover :key="image"
                                    :uk-slideshow-item="index">
                                    <a class="h-100" href="#" cover><img :src="image.image" class="h-100" width="99"
                                            style="object-fit: cover;" uk-cover alt=""></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </v-col>
            </div>
            <v-divider class="my-8"></v-divider>
        </div>
    </div>
</template>

<script>
export default {
    name: 'v-Sovet',
    data() {
        return {
            sovets: [],
        }
    },
    mounted() {
        this.getSovets()
    },
    methods: {
        getSovets() {
            axios.get('/api/sovets').then(response => {
                this.sovets = response.data.content
            })
        }
    }
}
</script>

<style scoped>
.text-h5 {
    padding-left: 8px;
}

.width-block {
    width: 80%;
}

.avatar {
    width: 100px;
    height: 80px;
}

.avatar img {
    height: 100%;
    width: 100%;
    object-fit: cover;
    object-position: center;
}

.text-sovet {
    width: 95%;
}

.margin-h4>h4 {
    margin: 0;
}

.height-100 {
    height: 100%;
}

@media screen and (max-width: 1301px) {
    .margin-h4>h4 {
        margin-top: 1vw;
        margin-bottom: 1vw;
    }

    .uk-position-small {
        margin: 10px;
    }
}

@media screen and (max-width: 1150px) {
    .margin-h4>h4 {
        margin-top: 1vw;
        margin-bottom: 2vw;
    }
}

@media screen and (max-width: 960px) {
    .margin-h4 h4 {
        padding-top: 10px;
        margin-bottom: 2vw;
    }

    .avatar {
        width: 130px;
        height: 110px;
    }
}

@media screen and (max-width: 600px) {
    .margin-h4 h4 {
        margin-top: 1.5vw;
        padding-top: 10px;
        margin-bottom: 5vw;
    }
}

@media screen and (max-width: 510px) {
    .margin-h4 {
        padding-top: 10px;
        margin-bottom: 2vw;
    }

    .arrow {
        display: none;
    }

    .text-sovet {
        width: 100%;
    }

    .width-block {
        width: 95%;
    }
}

@media screen and (max-width: 400px) {
    .uk-thumbnav-vertical {
        margin-top: 0;
    }

    .uk-thumbnav-vertical>* {
        padding-top: 5px;
    }
}

@media screen and (max-width: 350px) {
    .uk-thumbnav-vertical {
        padding: 0;
        display: flex;
        flex-direction: row;
    }

    .uk-thumbnav-vertical li,
    .uk-thumbnav-vertical a,
    .uk-thumbnav-vertical img {
        align-self: stretch;
    }

    .uk-position-small {
        margin: 0;
        max-width: 100%;
    }

    .v-rating {
        position: absolute;
        top: 120px;
        max-width: 100%;
        width: 100%;
        left: 0px;
        display: flex;
        justify-content: space-around;
    }

    .otst {
        margin-bottom: 14vw;
    }
}</style>