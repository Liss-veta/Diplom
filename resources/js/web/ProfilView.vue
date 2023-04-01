<template>
    <div>
        <div class="mt-n16 d-flex flex-column align-items-center">
            <div class="d-flex justify-center">
                <p class="uk-width-4-5 text-center tht">
                    {{ this.masters.description }}
                </p>
            </div>
            <div class="uk-width-4-5">
                <v-btn color="light-green-lighten-1" prepend-icon="mdi-cloud-upload"
                    @click="load(2)">
                    Добавить запись
                </v-btn>
                <v-btn color="light-green-lighten-1" prepend-icon="mdi-account-edit"
                    @click="load(2)">
                    Редактировать профиль
                </v-btn>
            </div>
        </div>
        <hr class="w-100" color="black">
        <!-- <Gallery></Gallery> -->
        <!-- <hr class="w-100" color="black"> -->
        <LentaSlider></LentaSlider>
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
export default {
    name: 'ProfilView',
    components: {
        Gallery,
        LentaSlider,
        Footer
    },
    data() {
        return {
            id: this.$route.params.id,
            masters: [],
        }
    },
    mounted() {
        this.getInfo()
    },
    methods:{
        getInfo(){
            axios.get(`/api/masters/${this.id}`, {
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
</style>