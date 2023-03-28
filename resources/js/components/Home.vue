<template>
  <div>
    <v-row class="justify-space-around">
      <v-col md="6" sm="12" class="border-logo">
        <v-col>
          <v-img
          height="500"
          contain
          class="uk-width-4-5@lg uk-width-1-1@s"
          src="assets/logo.png">
        </v-img>
        </v-col>
      </v-col>
      <v-col md="6" class="d-none d-md-display d-lg-display d-xl-display border-logo d-md-flex justify-center">
        <v-col
        cols="9"
        height="500">
          <SliderVertikal></SliderVertikal>
        </v-col>
      </v-col>
    </v-row>
 
  </div>
</template>

<script>
import SliderVertikal from '../components/SliderVertikal.vue'
  export default {
    name: 'v-Home',
    components: {
      SliderVertikal
    }
  }
</script>
<style>
.border-logo{
  border: 1px solid black;
  border-top:none;
}

</style>