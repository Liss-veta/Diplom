<template>
  <div class="home">
    <Home></Home>
    <v-row 
    class="w-100 justify-center mb-12">
      <WorksSlider></WorksSlider>
    </v-row>
    <CardMaster></CardMaster>
    <SliderSovet></SliderSovet>
    <Contact></Contact>
    <Footer></Footer>
  </div>
</template>

<script>
import Home from '../components/Home.vue';
import WorksSlider from '../components/WorksSlider.vue'
import CardMaster from '../components/CardMaster.vue'
import SliderSovet from '../components/SliderSovet.vue'
import Contact from '../components/Base/Contact.vue'
// import Reviews from '../components/Reviews.vue'
import Footer from '../components/Base/Footer.vue'

// @ is an alias to /src
export default {
  name: 'HomeView',
  components: {
    Home,
    WorksSlider,
    CardMaster,
    SliderSovet,
    Contact,
    // Reviews,
    Footer,
  }
}
</script>
