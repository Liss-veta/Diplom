<template>
    <div class="orange lighten-5 d-flex flex-column align-center">
        <img class="w-100" style="height: 200px; object-fit: cover;" src="assets/image 10.png" alt="">
        <div class="w-90 mt-4">
            <v-row class="w-100 d-flex flex-row orange lighten-5 ma-0">
                <v-col class="w-100 d-flex flex-column align-center">
                    <v-list-item-group height="80" class="uk-width-1-1 mt-6 d-flex align-center justify-space-between">
                        <v-list-item class="spisok text-center">
                            <router-link class="text-decoration-none" to="/">Главная</router-link>
                        </v-list-item>
                        <v-list-item class="spisok text-center">
                            <router-link class="text-decoration-none" to="/about">О нас</router-link>
                        </v-list-item>
                        <v-list-item class="spisok text-center">
                            <router-link class="text-decoration-none" to="/masters">Мастера</router-link>
                        </v-list-item>
                        <v-list-item class="spisok text-center">
                            <router-link class="text-decoration-none" to="/sovets">Советы</router-link>
                        </v-list-item>
                        <v-list-item>
                            <v-btn variant="outlined" icon >
                                <v-icon>mdi-exit-to-app</v-icon>
                            </v-btn>
                        </v-list-item>
                    </v-list-item-group>
                    <hr>
                    <div class="width uk-width-1-1 d-flex justify-center align-center flex-column mt-5">
                        <div class="uk-width-1-1 d-flex flex-column justify-start align-start mt-4">
                            <h2 class="text-h3 my-0 py-0">Валерий Игнатьев</h2>
                            <p class="my-1 py-0">31, Москва</p>
                        </div>
                        <div class="uk-width-1-1 mt-12">
                            <div class="d-flex justify-space-between w-100 pb-12 pb-sm-8 pb-md-2 pb-lg-0 pb-xl-0">
                                <div class="d-flex flex-column justify-center">
                                    <h5 class="font-weight-bold mb-0 text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">2
                                        года</h5>
                                    <p class="mt-0">Стаж</p>
                                </div>
                                <div class="d-flex flex-column justify-center">
                                    <h5 class="font-weight-bold mb-0 text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">
                                        Москва</h5>
                                    <p class="mt-0">Город</p>
                                </div>
                                <div class="d-flex flex-column justify-center">
                                    <h5 class="font-weight-bold mb-0 text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">от
                                        900р</h5>
                                    <p class="mt-0">Стоимость</p>
                                </div>
                            </div>
                            <div class="my-12">
                                <v-chip size="large" class="mr-2" label color="success" text-color="white">
                                    Вечерний
                                </v-chip>
                                <v-chip size="large" class="mx-2" label color="pink" text-color="white">
                                    Свадебный
                                </v-chip>
                                <v-chip size="large" class="mx-2" label color="success" text-color="white">
                                    Дневной
                                </v-chip>
                                <v-chip size="large" class="mx-2" label color="pink" text-color="white">
                                    Деловой
                                </v-chip>
                            </div>
                        </div>

                    </div>
                    <div class="w-100 mt-10 d-flex align-center justify-space-between">
                        <hr class="w-100 ma-0">
                        <DialogZapis></DialogZapis>
                    </div>
                </v-col>
                <v-col class="w-50 d-flex justify-center position-relative">
                    <v-img class="obj" src="assets/image 18.png"></v-img>
                </v-col>
            </v-row>
        </div>
    </div>
</template>
<script>
import DialogZapis from '../DialogZapis.vue';
export default {
    name: 'v-ProfilHeader',
    components: {
        DialogZapis,
    }
}
</script>
<style>
.width {
    width: 85%;
}

.w-90 {
    width: 90%;
}

hr {
    background-color: black;
    height: 2px;
    width: 100%;
}

.obj-fit {
    width: 8vw;
    height: 8vw;
    object-fit: cover;
    object-position: center;
}

.obj {
    height: 80%;
    width: 100%;
    object-fit: cover;
    object-position: top;
}
</style>