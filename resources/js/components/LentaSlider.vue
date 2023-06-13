<template>
    <div class="logoslider mt-16">
        <div>
            <img v-for="image in this.lenta_slider" :src="image.image" alt="">
        </div>
        <div>
            <img v-for="image in this.lenta_slider" :src="image.image" alt="">
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: "LogoSlider",
    data(){
        return {
            lenta_slider: [],
        }
    },
    mounted(){
        this.getGallery()
    },
    methods: {
        getGallery(){
            axios.get('api/about/gallery').then(response => {
                this.lenta_slider = response.data.content
            }).catch(response => { console.log(response) })
        }
    }
}
</script>

<style scoped>

</style>
