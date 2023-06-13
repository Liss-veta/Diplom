<template>
  <div class="uk-slider-container-offset mt-12" uk-slider>
    <h2 class="my-16 text-h2" style="margin-left: 180px">Советы от профессионалов</h2>
    <div class="uk-position-relative uk-visible-toggle uk-light w-90 " tabindex="-1"  style="margin-left: 180px">

      <ul class="uk-slider-items uk-child-width-1-2@s uk-grid">
        <li v-for="sovet in sovets" :keys="sovet">
          <div class="uk-card uk-card-default">
            <div class="uk-card-media-top">
              <v-carousel  style="height: 300px;" :show-arrows="false" delimiter-icon="mdi-square">
                <v-carousel-item contain v-for="image in sovet.arr_images" :key="image" class="bg-orange-lighten-5" :src="image.image">
                </v-carousel-item>
              </v-carousel>
            </div>
            <div class="uk-card-body bg-orange-lighten-5">
              <h3 class="uk-card-title">{{ sovet.id_master.name }} {{ sovet.id_master.surname }}</h3>
              <v-divider :thickness="2"></v-divider>
              <p>{{sovet.description}}</p>
            </div>
          </div>
        </li>
      </ul>

      <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous
        uk-slider-item="previous"></a>
      <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next
        uk-slider-item="next"></a>

    </div>

    <ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"></ul>

  </div>
</template>

<script>
export default {
  name: 'SliderSovet',
  data() {
    return {
      sovets: [],
      colors: [
        'indigo',
        'warning',
        'pink darken-2',
        'red lighten-1',
        'deep-purple accent-4',
      ],
      slides: [
        'First',
        'Second',
        'Third',
        'Fourth',
        'Fifth',
      ],
    }
  },
  mounted() {
        this.getSovets()
    },
    methods: {
        getSovets() {
            axios.get('/api/sovets').then(response => {
                this.sovets = response.data.content
            })
        }
    }
}
</script>

<style>
.w-90 {
  width: 80%;
}
</style>
