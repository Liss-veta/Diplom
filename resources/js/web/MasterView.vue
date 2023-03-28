<template>
  <div>
    <Home></Home>
    <v-container class="mt-12"><h1 class="text-center text-sm-start text-md-start text-lg-start text-xl-start text-h3 text-sm-h2 text-md-h2 text-lg-h2 text-xl-h2">Наша команда</h1> </v-container>
    <Comanda></Comanda>
    <Contact></Contact>
    <v-divider class="mt-12"></v-divider>
    <Reviews></Reviews>
    <Footer></Footer>
  </div>
</template>

<script>
import Home from "../components/Home.vue"
import Comanda from "../components/Comanda.vue"
import Contact from "../components/Base/Contact.vue"
import Reviews from "../components/Reviews.vue"
import Footer from "../components/Base/Footer.vue"
export default {
  name: 'MasterView',
  components: {
    Home,
    Comanda,
    Contact,
    Reviews,
    Footer
  }
}
</script>

