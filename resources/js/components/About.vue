<template>
    <div class="d-flex justify-center">
        <div class="mw mt-12">
            <div class="d-flex al_ab">
                <div class="pa-0 d-flex flex-column tex800">
                    <div class="text-z d-flex flex-row align-end justify-space-between border-bottom pa-0">
                        <h1 class="text-h2">О нас</h1>
                        <v-card color="light-green lighten-1" 
                        class="rounded-0 kv"></v-card>
                    </div>
                    <div class="textWidth">
                        <p class="text-subtitle-1">
                            {{ this.text_one }}
                        </p>
                    </div>
                </div>
                <div class="pa-lg-0 align-s">
                    <v-card color="light-green-lighten-1"
                        class="rounded-0 kv710"></v-card>
                    <div class="pa-0 about_adap">
                        <v-img :src=this.image_one
                        >
                        <template v-slot:placeholder>
                            <v-row
                            class="fill-height ma-0"
                            align="center"
                            justify="center"
                            >
                            <v-progress-circular
                                indeterminate
                                color="red-lighten-2"
                            ></v-progress-circular>
                            </v-row>
                        </template></v-img>
                    </div>
                    <v-card color="pink-accent-2"
                        class="rounded-0 kv"></v-card>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "v-About",
    data() {
        return {
            image_one: "",
            text_one: "",
        }
    },
    mounted() {
        this.getIndex()
    },
    methods: {
        getIndex() {
            axios.get('api/about').then(response => {
                this.image_one = response.data.content[0].image
                this.text_one = response.data.content[0].description
                console.log(response.data.content)
            }).catch(response => { console.log(response) })
        },
    }
}
</script>
<style scoped>
.border{
    border-bottom: 1px solid black;
}
.tex800, .align-s{
    width: 50%;
}
.textWidth{
    width: 80%;
    margin-top: 32px;
}
.kv{
    width: 200px;
    height: 200px;
}
.kv710{
    display: none;
}
.mw{
    max-width: 1200px;
}
.al_ab{
    align-items: center;
    justify-content: center;
}
@media screen and (max-width: 1150px){
    .mw{
        max-width: 1000px;
        display: flex;
        justify-content: center;
    }
    .textWidth{
        width: 90%;
    }
    .kv{
        width: 150px;
        height: 150px;
    }
}
@media screen and (max-width: 1011px){
    .mw{
        max-width: 900px;
    }
    .about_adap{
        width: 450px;
        height: 100%;
    }
    .al_ab{
        align-items: flex-start;
    }
}
@media screen and (max-width: 900px){
    .al_ab{
        padding:0 20px;
        align-items: center;
    }
    .textWidth{
        width: 98%;
    }
    .align-s{
        align-self: flex-end;
    }
}
@media screen and (max-width: 850px){
    .about_adap{
        width: 400px;
    }
}
@media screen and (max-width: 831px){
    .align-s{
        align-self: center;
    }
}
@media screen and (max-width: 710px) {
    .theme--light.v-image {
        height: 550px;
    }
    .align-s{
        position: absolute;
        top: 0;
        right: 2%;
    }
    .textWidth{
        margin-top: 25%;
        width: 90%;
    }
    .text-z{
        position: absolute;
        top: 0;
        overflow-x: visible;
        width: 95%;
    }
    .text-z > .kv {
        display: none;
    }
    .al_ab{
        position: relative;
        padding: 2.5vw 2.5vw 0 20px;
        justify-content: start;
    }
    .about_adap{
        width: 370px;
    }
    .about_adap > img{
        width: 100%;
        height: 100vw;
    }
}
@media screen and (max-width: 601px){
    .align-s{
        position: static;
        order: -1;
        width: 60%;
        height: 40vw;
        align-self: flex-end;
    }
    .theme--light.v-image {
        height: 40vw;
    }
    .text-z{
        position: static;
        padding: 0;
        margin-right: 0;
        width: 100%;
    }
    .text-z > h1{
        padding-left: 5%;
    }
    .textWidth{
        margin-top: 4vw;
        width: 90%;
        align-self: center;
    }
    .al_ab{
        flex-direction: column;
        width: 100%;
        padding: 0;
    }
    .kv{
        display: none;
    }
    .tex800{
        width: 100%;
        margin-top: -13.5%;
    }
}
@media screen and (max-width:575px){
    .tex800{
        margin-top: -14%;
    }
}
@media screen and (max-width:550px){
    .tex800{
        margin-top: -14.5%;
    }
}
@media screen and (max-width:525px){
    .align-s, .about_adap {
        width: 90vw;
        height: 60vw;
        align-self: center;
    }
    .theme--light.v-image {
        height: 60vw;
    }
    .tex800{
        margin-top: 5%;
    }
    .text-z > .kv {
        display: block;
        width: 100px;
        height: 100px;
        margin-right: 5vw;
    }
}

</style>
