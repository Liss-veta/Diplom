<template>
  <div>
    <Home></Home>
    <v-container class="mt-12 d-flex justify-space-between align-center">
    </v-container>
    <Comanda></Comanda>
    <Contact></Contact>
    <v-divider class="mt-12"></v-divider>
    <Footer></Footer>
  </div>
</template>

<script>
import Home from "../components/Home.vue"
import Comanda from "../components/Comanda.vue"
import Contact from "../components/Base/Contact.vue"
import Footer from "../components/Base/Footer.vue"
export default {
  name: 'MasterView',
  data() {
    return {
      param: ''
    }
  },
  components: {
    Home,
    Comanda,
    Contact,
    Footer
  }
}
</script>

