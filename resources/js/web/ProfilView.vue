<template>
    <div>
        <div class="mt-n16 d-flex flex-column align-items-center">
            <div class="d-flex justify-center">
                <p class="uk-width-4-5 text-center">
                    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam
                    rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt
                    explicabo.
                    <br><br>
                    Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,sed quia consequuntur magni
                    dolores eos qui ratione voluptatem sequi nesciunt.
                </p>
            </div>
            <div class="uk-width-4-5">
                <v-btn color="light-green-lighten-1" prepend-icon="mdi-cloud-upload"
                    @click="load(2)">
                    Upload
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
    }
}
</script>

<style></style>