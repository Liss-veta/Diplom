<template>
    <div class="overlay" v-if="this.loadingStatus">
        <v-progress-circular
      indeterminate
      color="pink accent-2"
    ></v-progress-circular></div>
    <div v-else>
        <div class="mt-n16 d-flex flex-column align-items-center">
            <div class="d-flex justify-center">
                <p class="uk-width-4-5 text-center tht">
                    {{ this.masters.description }}
                </p>
            </div>
        </div>
        <hr class="w-100" color="black">
        <Post/>
        <v-container>
            <v-divider class="my-2"></v-divider>
        </v-container>
        <Footer></Footer>
    </div>
</template>

<script>
import Gallery from "../components/Master/Gallery.vue"
import LentaSlider from "../components/LentaSlider.vue"
import Footer from "../components/Base/Footer.vue"
import Post from '../components/Master/Post.vue'

export default {
    name: 'ProfilView',
    components: {
        Gallery,
        LentaSlider,
        Post,
        Footer
    },
    data() {
        return {
            id: this.$route.params.id,
            masters: [],
            header: this.$route.fullPath,
        }
    },
    mounted() {
        this.getInfo(this.$route.params.id)
    },
    methods:{
        getInfo(id){
            axios.get(`/api/masters/${id}`, {
                headers: {
                    'Accept': 'application/json',
                    'Content-type': 'application/json',
                    'X-Request-with':'XMLHttpRequest'
                }
            }).then(response => {
                this.masters = response.data.content[0]
                console.log(response.data);
            }).catch(response => { console.log(response.data) })
        }
    }
}
</script>

<style>
.tht {
    word-break: break-word;
}

.overlay {
    position: absolute;
    background-color: rgba(0, 0, 0, 0.086);
    z-index: 1000;
    top: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    left: 0;
    width: 100vw;
    height: 100vh;
}
</style>