<template>
  <div>
    <Home></Home>
    <Sovet></Sovet>
    <Footer></Footer>
  </div>
</template>

<script>
import Home from '../components/Home.vue'
import Sovet from '../components/Sovet.vue'
import Footer from '../components/Base/Footer.vue'

export default {
  name: 'SovetView',
  components: {
    Home,
    Sovet,
    Footer
  }
}

</script>
