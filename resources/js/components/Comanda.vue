<template>
    <div class="mt-12" v-for="(masters, index) in arr_masters" :key="masters">
        <div class="comanda_laptop position-relative" v-if="(index % 2) == 0">
            <div uk-scrollspy="cls: uk-animation-slide-left; repeat: true" class="prof"><img :src="masters.avatar" alt="">
            </div>
            <div uk-scrollspy="cls: uk-animation-slide-right; repeat: true" class="textprof">
                <form>
                    <fieldset class="topfiel">
                        <legend>
                            <div class="btn_first">
                                <router-link :to="'/profile/' + masters.id"><span
                                        class="noselect">Подробнее</span></router-link>
                            </div>
                        </legend>
                        <div class="cartochka d-flex flex-column">
                            <h2>{{ masters.name }} {{ masters.surname }}
                                <router-link :to="'/profile/' + masters.id"><v-btn dark class="but_com550 pink accent-1">
                                        Подробнее
                                    </v-btn></router-link>
                            </h2>
                            <div class="d-flex flex-column justify-content-between pb-12 pb-sm-8 pb-md-2 pb-lg-0 pb-xl-0 mb-4">
                                <div>
                                    <h5 class="text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">{{ masters.staj }} года
                                    </h5>
                                    <h5 class="text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">от {{
                                        masters.min_cena }}р</h5>
                                    <h5 class="text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">{{ masters.city }}</h5>
                                </div>
                                <div>
                                    <p>Стаж</p>
                                    <p>Стоимость</p>
                                    <p>Город</p>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="bottomfiel">
                        <legend v-if="masters.tag.length > 0">
                            <v-chip v-for="(tag, i) in masters.tag" :key="tag" size="large" class="mr-2" label
                                :color="i % 2 == 0 ? 'success' : 'pink'" text-color="white">
                                {{ tag.id_tag.tag_name }}
                            </v-chip>
                        </legend>
                    </fieldset>
                </form>
            </div>
        </div>
        <div class="comanda_laptop two position-relative" v-else>
            <div uk-scrollspy="cls: uk-animation-slide-right; repeat: true" class="prof1"><img :src="masters.avatar" alt="">
            </div>
            <div uk-scrollspy="cls: uk-animation-slide-left; repeat: true" class="textprof1">
                <form>
                    <fieldset class="topfiel1">
                        <legend>
                            <div class="btn_first">
                                <span class="noselect"><router-link
                                        :to="'/profile/' + masters.id">Подробнее</router-link></span>
                            </div>
                        </legend>
                        <div
                            class="cartochka d-flex flex-column align-start align-sm-end align-md-end align-lg-end align-xl-end">
                            <h2> {{ masters.name }} {{ masters.surname }}
                                <router-link :to="'/profile/' + masters.id"><v-btn dark class="but_com550 pink accent-1">
                                        Подробнее
                                    </v-btn></router-link>
                            </h2>
                            <div class="d-flex flex-column justify-content-between pb-12 pb-sm-8 pb-md-2 pb-lg-0 pb-xl-0 mb-6">
                                <div>
                                    <h5 class="text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">{{ masters.staj }} года
                                    </h5>
                                    <h5 class="text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">от {{
                                        masters.min_cena }}р</h5>
                                    <h5 class="text-h6 text-sm-h5 text-md-h5 text-lg-h5 text-xl-h5">{{ masters.city }}</h5>
                                </div>
                                <div>
                                    <p>Стаж</p>
                                    <p>Стоимость</p>
                                    <p>Город</p>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="bottomfiel1">
                        <legend v-if="masters.tag.length > 0">
                            <v-chip v-for="(tag, i) in masters.tag" :key="tag" size="large" class="mr-2" label
                                :color="i % 2 == 0 ? 'success' : 'pink'" text-color="white">
                                {{ tag.id_tag.tag_name }}
                            </v-chip>
                        </legend>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</template>

<script>

export default {
    name: 'Comanda',
    data() {
        return {
            arr_masters: [],
        }
    },
    mounted() {
        this.all()
    },
    methods: {
        all() {
            axios.get('api/masters').then(response => {
                this.arr_masters = response.data.content;
                console.log(response.data)
            }).catch(response => { console.log(response) })

        }
    }
}
</script>
<style scoped>
.comanda_laptop {
    padding-left: 53px;
    position: relative;
    margin-bottom: 10vw;
    margin-top: 48px;
}

.prof {
    width: 20vw;
    height: 20vw;
    object-fit: cover;
    text-align: center;
    background-color: rgb(167, 156, 143);
    text-align: center;
    margin: 0;
    position: relative;
    z-index: 1;
}

.prof1 {
    width: 20vw;
    height: 20vw;
    object-fit: cover;
    text-align: center;
    background-color: rgb(167, 156, 143);
    text-align: center;
    margin: 0;
    position: relative;
    z-index: 1;
    margin-left: 71.5vw;
}

.prof img,
.prof1 img {
    height: 100%;
    width: 100%;
    object-fit: cover;
    object-position: top;
}

.prof::after {
    content: "";
    position: absolute;
    left: 30%;
    bottom: -15%;
    width: 20vw;
    height: 20vw;
    z-index: -1;
    background-color: #FF4081;
    transform: translateX(-50%);
}

.prof1::before {
    content: "";
    position: absolute;
    left: 70%;
    bottom: -15%;
    width: 20vw;
    height: 20vw;
    z-index: -1;
    background-color: #FF4081;
    transform: translateX(-50%);
}

.textprof,
.textprof1 {
    position: absolute;
    left: 5%;
    top: 14%;
    width: 90vw;
}

.topfiel {
    width: 100%;
    min-width: auto;
    padding: 20px 40px 0 20px;
    margin: 0;
    border: 1px solid black;
    display: flex;
    justify-content: end;
    border-bottom: none;
}

.topfiel1 {
    width: 100%;
    min-width: auto;
    padding: 20px 40px 0 20px;
    margin: 0;
    border: 1px solid black;
    display: flex;
    justify-content: start;
    border-bottom: none;
}

.topfiel>legend {
    padding: 3px 6px;
    float: none;
    width: auto;
    font-size: 20px;
    /* Расположение конпки на fieldset */
    margin-left: 80vw;
}

.topfiel1>legend {
    padding: 3px 6px;
    float: none;
    width: auto;
    font-size: 20px;
    margin-left: -10vh;
}

.bottomfiel,
.bottomfiel1 {
    width: 100%;
    min-width: auto;
    padding: 0 10px 0 10px;
    margin: 0;
    height: 0;
    border: 1px solid black;
    border-bottom: none;
    transform: rotate(180deg);
}

.bottomfiel>legend {
    color: black;
    padding: 3px 6px;
    float: none;
    width: auto;
    margin-left: 0;
    font-size: 2em;
    transform: rotate(180deg);
    display: flex;
}

.bottomfiel>legend>div {
    margin-right: 10px;
}

.bottomfiel>legend>div>img {
    height: 95px;
    width: 95px;
    object-fit: cover;
}

.bottomfiel1>legend {
    color: black;
    padding-top: 3px;
    margin-left: 67vw;
    float: none;
    width: auto;
    margin-right: 0;
    font-size: 2em;
    transform: rotate(180deg);
    display: flex;
}

.bottomfiel1>legend>div {
    margin-left: 1.5vh;
}

.bottomfiel1>legend>div>img {
    height: 95px;
    width: 95px;
    object-fit: cover;
}

.cartochka {
    width: 75%;
}

.cartochka>div {
    width: 50%;
}

.cartochka>div>div {
    display: flex;
    width: 100%;
    justify-content: space-between;
}

.cartochka>div>div>h5,
.cartochka>div>div>p {
    margin: 0;
}

.cartochka>h2 {
    display: flex;
    justify-content: space-between;
}

.btn_first {
    width: 150px;
    height: 50px;
    border: 1px solid #333;
    font-family: 'Cinzel', serif;
    font-size: 20px;
    cursor: pointer;
    -webkit-tap-highlight-color: transparent;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    z-index: 0;
    transition: 1s;
}

.btn_first::before,
.btn_first::after {
    position: absolute;
    background: #F8BBD0;
    z-index: -1;
    transition: 1s;
    content: '';
}

.btn_first::before {
    height: 50px;
    width: 130px;
}

.btn_first::after {
    width: 150px;
    height: 30px;
}

.noselect {
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

.btn_first:hover::before {
    width: 0px;
    background: #F06292;
    color: white;
}

.btn_first:hover::after {
    height: 0px;
    background: #F06292;
    color: white;
}

.btn_first:hover {
    background: #F06292;
    color: white;
}

.btn_first a {
    text-decoration: none;
    color: black;
}

.btn_first a:hover::before,
.btn_first a:hover::after {
    color: white;
}

.but_com550 {
    display: none;
}

@media screen and (max-width: 1150px) {
    .topfiel>legend {
        margin-left: 76vw;
    }

    .comanda_laptop {
        margin-bottom: 20vw;
    }

    .two {
        margin-top: 10vw;
    }

    .bottomfiel1>legend {
        margin-left: 58vw;
    }
}

@media screen and (max-width: 960px) {
    .topfiel>legend {
        margin-left: 70vw;
    }

    .topfiel1>legend {
        margin-left: -6vw;
    }

    .cartochka {
        width: 50%;
    }

    .cartochka>div {
        width: 100%;
    }

    .prof::after,
    .prof1::after,
    .prof1::before {
        content: none;
    }

    .prof,
    .prof1 {
        width: 40vw;
        height: 40vw;
    }

    .prof1 {
        margin-right: 0;
        margin-left: auto;
    }

    .comanda_laptop {
        padding-left: 0;
    }

    .bottomfiel>legend {
        margin-left: 2vw;
    }

    .bottomfiel>legend>div {
        margin-right: 40px;
    }

    .bottomfiel1>legend {
        margin-left: 43vw;
        margin-right: 0;
        font-size: 2em;
    }

    .bottomfiel1>legend>div {
        margin-left: 40px;
    }
}

@media screen and (max-width: 850px) {
    .bottomfiel>legend {
        margin-left: 1vw;
    }

    .bottomfiel>legend>div {
        margin-right: 20px;
    }

    .bottomfiel1>legend {
        margin-left: 43vw;
    }

    .bottomfiel1>legend>div {
        margin-left: 20px;
    }
}

@media screen and (max-width: 700px) {
    .topfiel>legend {
        margin-left: 66vw;
    }

    .bottomfiel1>legend {
        margin-left: 38vw;
    }
}

@media screen and (max-width: 600px) {
    .topfiel>legend {
        margin-left: 62vw;
    }

    .comanda_laptop {
        margin-bottom: 40vw;
    }

    .bottomfiel1>legend {
        margin-left: 35vw;
    }
}

@media screen and (max-width: 550px) {

    .topfiel,
    .topfiel1 {
        margin-top: 10vw;
        justify-content: end;
    }

    .cartochka {
        width: 90%;
        padding-top: 37vw;
    }

    .prof,
    .prof1 {
        margin: 0 auto;
        width: 70vw;
        height: 50vw;
    }

    .topfiel>legend,
    .topfiel1>legend {
        display: none;
    }

    .comanda_laptop {
        margin-bottom: 65vw;
    }

    .bottomfiel>legend {
        margin-left: 6vw;
    }

    .bottomfiel>legend>div {
        margin-right: 40px;
    }

    .bottomfiel1>legend {
        margin-left: 7vw;
    }

    .bottomfiel1>legend>div {
        margin-left: 40px;
    }

    .but_com550 {
        display: block;
    }
}

@media screen and (max-width: 500px) {
    .comanda_laptop {
        margin-bottom: 85vw;
    }

    .cartochka>h2 {
        width: 100%;
        row-gap: 20px;
        flex-direction: column;
    }
}

@media screen and (max-width: 471px) {
    .bottomfiel>legend {
        margin-left: 1vw;
    }

    .bottomfiel1>legend {
        margin-left: 2vw;
    }

    .comanda_laptop {
        margin-bottom: 88vw;
    }
}

@media screen and (max-width: 400px) {
    .bottomfiel>legend {
        margin-left: 1vw;
    }

    .comanda_laptop {
        margin-bottom: 120vw;
    }

    .bottomfiel>legend>div {
        margin-right: 10px;
    }

    .bottomfiel1>legend>div {
        margin-left: 10px;
    }

    .topfiel,
    .topfiel1 {
        padding: 10px 5px 0 10px;
        justify-content: center;
    }
}</style>