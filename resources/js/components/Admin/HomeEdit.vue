<template>
    <v-row class="pa-12">
        <v-col class="d-flex child-flex" cols="4">
            <div class="uk-text-center">
                <div class="uk-inline-clip uk-transition-toggle uk-light" tabindex="0">
                    <img :src="'../assets/image 18.png'" class="hover"  alt="">
                    <div class="uk-position-center uk-width-1-1">
                        <span class="uk-transition-fade uk-width-1-1"><v-file-input type="file" label="Нажмите чтобы выбрать изображение" variant="filled"
                                prepend-icon="mdi-camera"></v-file-input></span>
                    </div>
                </div>
            </div>
        </v-col>
        <v-col class="d-flex child-flex" cols="4">
            <v-img :src="`../assets/image 15.jpg`" aspect-ratio="1" cover class="bg-grey-lighten-2">
                <template v-slot:placeholder>
                    <v-row class="fill-height ma-0" align="center" justify="center">
                        <v-progress-circular indeterminate color="grey-lighten-5"></v-progress-circular>
                    </v-row>
                </template>
            </v-img>
        </v-col>
        <v-col class="d-flex child-flex" cols="4">
            <v-img :src="`../assets/image 13.jpg`" aspect-ratio="1" cover class="bg-grey-lighten-2">
                <template v-slot:placeholder>
                    <v-row class="fill-height ma-0" align="center" justify="center">
                        <v-progress-circular indeterminate color="grey-lighten-5"></v-progress-circular>
                    </v-row>
                </template>
            </v-img>
        </v-col>
    </v-row>
</template>

<script>

export default {
}

</script>

<style>
.hover:hover {
    filter: brightness(50%);
    transition: .2s ease-in-out;
}
</style>