<template>
    <div class="width-block mx-auto mt-12">
        <div class="d-flex flex-column flex-md-row flex-lg-row flex-xl-row">
            <v-col>
                <div>
                    <article class="uk-comment uk-visible-toggle" tabindex="-1" role="comment">
                        <header class="uk-comment-header uk-position-relative">
                            <div class="otst uk-flex-middle" uk-grid>
                                <div class="uk-width-auto mx-auto avatar">
                                    <img class="uk-comment-avatar" src="assets/image 7.png" width="100" height="100" alt="">
                                </div>
                                <div class="uk-width-expand margin-h4">
                                    <h4 class="uk-comment-title text-h5 black--text"><a class="uk-link-reset" href="#">Author</a></h4>
                                    <v-rating
                                        v-model="rating"
                                        background-color="orange lighten-3"
                                        color="orange"
                                        large
                                        ></v-rating>
                                </div>
                            </div>
                            <div class="uk-position-top-right uk-position-small"><a  href="#"><v-img class="arrow" src="assets/Arrow.png"></v-img></a></div>
                        </header>
                    </article>
                </div>
                <v-divider class="w-100 mt-6 mb-10"></v-divider>
                <div class="text-sovet">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                </div>
            </v-col>
            <v-col>
                <div class="height-100 uk-position-relative" uk-slideshow="animation: fade">
                    <ul class="height-100 uk-slideshow-items">
                        <li>
                            <img src="assets/image 10.png" alt="" uk-cover>
                        </li>
                        <li>
                            <img src="assets/image 3.png" alt="" uk-cover>
                        </li>
                        <li>
                            <img src="assets/image 5.png" alt="" uk-cover>
                        </li>
                    </ul>

                    <div class="uk-position-center-right uk-position-small">
                        <ul class="uk-thumbnav uk-thumbnav-vertical">
                            <li uk-slideshow-item="0"><a href="#"><img src="assets/image 5.png" width="99" height="67" alt=""></a></li>
                            <li uk-slideshow-item="1"><a href="#"><img src="assets/image 3.png" width="100" height="67" alt=""></a></li>
                            <li uk-slideshow-item="2"><a href="#"><img src="assets/image 5.png" width="100" height="67" alt=""></a></li>
                        </ul>
                    </div>

                    </div>
            </v-col>
        </div>
        <v-divider class="my-8"></v-divider>
    </div>
</template>

<script>
export default {
    name: 'v-Sovet',
}
</script>

<style scoped>
.text-h5 {
    padding-left: 8px;
}

.width-block{
    width: 80%;
}
.avatar{
    width: 100px;
    height: 80px;
}
.avatar img {
    height: 100%;
    width: 100%;
    object-fit: cover;
    object-position: center;
}

.text-sovet{
    width: 95%;
}
.margin-h4 > h4 {
    margin: 0;
}

.height-100{
    height: 100%;
}

@media screen and (max-width: 1301px){
    .margin-h4 > h4{
        margin-top: 1vw;
        margin-bottom: 1vw;
    }
    .uk-position-small {
        margin: 10px;
    }
}
@media screen and (max-width: 1150px){
    .margin-h4 > h4{
        margin-top: 1vw;
        margin-bottom: 2vw;
    }
}
@media screen and (max-width: 960px) {
    .margin-h4 h4{
        padding-top: 10px;
        margin-bottom: 2vw;
    }
    .avatar{
    width: 130px;
    height: 110px;
}
}
@media screen and (max-width: 600px) {
    .margin-h4 h4{
        margin-top: 1.5vw;
        padding-top: 10px;
        margin-bottom: 5vw;
    }
}
@media screen and (max-width: 510px) {
    .margin-h4{
        padding-top: 10px;
        margin-bottom: 2vw;
    }
    .arrow{
        display: none;
    }
    .text-sovet {
        width: 100%;
    }
    .width-block{
        width: 95%;
    }
}
@media screen and (max-width: 400px){
    .uk-thumbnav-vertical{
        margin-top: 0;
    }
    .uk-thumbnav-vertical > *{
        padding-top: 5px;
    }
}
@media screen and (max-width: 350px){
    .uk-thumbnav-vertical {
        padding: 0;
        display: flex;
        flex-direction: row;
    }
    .uk-thumbnav-vertical li, .uk-thumbnav-vertical a, .uk-thumbnav-vertical img {
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
}
</style>