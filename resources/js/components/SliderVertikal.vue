<template>
  <div class="h-100 w-100">
    <div class="h-100 uk-position-relative uk-visible-toggle uk-light" tabindex="-1"
      uk-slideshow="autoplay: true; autoplay-interval: 6000; min-height: 100%">
      <ul class="h-100 uk-slideshow-items">
        <li>
          <img :src="this.one_slide" alt="" uk-cover>
        </li>
        <li>
          <img :src="this.two_slide" alt="" uk-cover>
        </li>
        <li>
          <img :src="this.three_slide" alt="" uk-cover>
        </li>
      </ul>

      <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous
        uk-slideshow-item="previous"></a>
      <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next
        uk-slideshow-item="next"></a>
    </div>
  </div>
</template>

<script>
export default {
  name: 'v-SliderVertikal',
  data() {
    return {
      one_slide: '',
      two_slide: '',
      three_slide: '',
    }
  },
  mounted() {
    this.getIndex()
  },
  methods: {
    getIndex() {
      axios.get('api/admin/slider', {
        headers: {
          "Authorization": "Bearer " + this.token
        }
      }).then(response => {
        this.one_slide = response.data.content[0].image;
        this.two_slide = response.data.content[1].image;
        this.three_slide = response.data.content[2].image;
      }).catch(response => { console.log(response) })
    },
  },
    created() {
      setInterval(() => {
        if (!this.autorun) return
        if (++this.window >= this.length) this.window = 0
      }, 4000)
    },
  }
</script>
