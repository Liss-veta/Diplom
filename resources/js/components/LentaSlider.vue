<template>
    <div class="logoslider mt-16">
        <div>
            <img v-for="image in this.lenta_slider" :src="image.image" alt="">
            <!-- <img src="assets/image 10.png">
            <img src="https://avatars.mds.yandex.net/i?id=81a2c5365d545dc30c4888d0b44ab9a858a002b8-5869570-images-thumbs&n=13">
            <img src="assets/e991fa13253b3fae8d2164a6ccc8263e.jpg">
            <img src="assets/e6f7127a246d07b005e7a8e98c2a72a5.jpg">
            <img src="assets/6bfac16f808b663e1953769180e7ed4cghfh.jpg">
            <img src="assets/5def34a8471329bfa3b3adcb3ab1f990.jpg">
            <img src="assets/95030c9aaed57a1259cf9bb0c61f74b2.jpg">
            <img src="assets/d9c943f2e3b119a562170bbcd3326586gfd.jpg"> -->
        </div>
        <div>
            <img v-for="image in this.lenta_slider" :src="image.image" alt="">
            <!-- <img src="assets/image 10.png">
            <img src="https://avatars.mds.yandex.net/i?id=81a2c5365d545dc30c4888d0b44ab9a858a002b8-5869570-images-thumbs&n=13">
            <img src="assets/e991fa13253b3fae8d2164a6ccc8263e.jpg">
            <img src="assets/e6f7127a246d07b005e7a8e98c2a72a5.jpg">
            <img src="assets/6bfac16f808b663e1953769180e7ed4cghfh.jpg">
            <img src="assets/5def34a8471329bfa3b3adcb3ab1f990.jpg">
            <img src="assets/95030c9aaed57a1259cf9bb0c61f74b2.jpg">
            <img src="assets/d9c943f2e3b119a562170bbcd3326586gfd.jpg"> -->
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
                console.log(response.data.content)
            }).catch(response => { console.log(response) })
        }
    }
}
</script>

<style scoped>

</style>
