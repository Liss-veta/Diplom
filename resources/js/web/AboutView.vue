<template>
  <div class="about">
    <Home></Home>
    <About></About>
    <AboutTwo></AboutTwo>
    <v-divider class="mt-12"></v-divider>
    <LentaSlider></LentaSlider>
    <v-divider class="mt-12"></v-divider>
    <Contact></Contact>
    <v-divider class="mt-12"></v-divider>
    <Reviews></Reviews>
    <Footer></Footer>
  </div>
</template>

<script>
import LentaSlider from "../components/LentaSlider.vue"
import About from "../components/About.vue"
import Home from "../components/Home.vue"
import AboutTwo from "../components/AboutTwo.vue"
import Contact from "../components/Base/Contact.vue"
import Reviews from "../components/Reviews.vue"
import Footer from "../components/Base/Footer.vue"

export default {
  name: 'AboutView',
  components: {
    LentaSlider,
    About,
    Home,
    AboutTwo, 
    Contact,
    Reviews,
    Footer
  }
}

</script>
<style>
.logoslider {
    padding: 20px;
    overflow: hidden;
    max-width: 100vw;
    width: 100%;
    margin: 0 auto;
    position: relative;
    display: flex;
    /*top: 154vh;*/
    top:0;
}
.logoslider:hover div {
    animation-play-state: paused;
}
.logoslider div {
    display: flex;
    position: relative;
    animation: marquee 10s linear infinite;
    justify-content: space-around;
}
.logoslider img {
    display: block;
    min-width: 40vh;
    height: 40vh;
    margin: 0 1vw;
    object-fit: cover;
    object-position: center;
}
.logoslider:after {
    content: "";
    position: absolute;
    width: 100%;
    height: 100%;
    left: 0;
    top: 0;
    background: linear-gradient(to right, white, rgba(255, 255, 255, 0) 80px, rgba(255, 255, 255, 0) calc(100% - 80px), white);
}
@keyframes marquee {
    0% {
        transform: translateX(0%);
    }
    100% {
        transform: translateX(-100%);
    }
}
</style>
