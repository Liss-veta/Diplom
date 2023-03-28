<template>
  <div class="h-100 w-100">
     <div class="h-100 uk-position-relative uk-visible-toggle uk-light" tabindex="-1"  uk-slideshow="autoplay: true; autoplay-interval: 6000; min-height: 100%">
        <ul class="h-100 uk-slideshow-items">
            <li>
                <img src="assets/image 10.png" alt="" uk-cover>
            </li>
            <li>
                <img src="assets/image 7.png" alt="" uk-cover>
            </li>
            <li>
                <img src="assets/image 5.png" alt="" uk-cover>
            </li>
        </ul>

        <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
        <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
    </div>
  </div>


</template>

<script>
  export default {
    name: 'v-SliderVertikal',
    data () {
      return {
        items: [
          {
            src: 'https://cdn.vuetifyjs.com/images/carousel/squirrel.jpg',
          },
          {
            src: 'https://cdn.vuetifyjs.com/images/carousel/sky.jpg',
          },
          {
            src: 'https://cdn.vuetifyjs.com/images/carousel/bird.jpg',
          },
          {
            src: 'https://cdn.vuetifyjs.com/images/carousel/planet.jpg',
          },
        ],
      }
  },

    created () {
      setInterval(() => {
        if (!this.autorun) return
        if (++this.window >= this.length) this.window = 0
      }, 4000)
    },
  }
</script>
