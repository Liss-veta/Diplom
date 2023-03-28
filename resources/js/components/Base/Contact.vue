<template>
    <v-container>
        <h2 class="mt-4 mt-sm-0 mt-md-8 mt-lg-12 mt-xl-16 text-h3 text-sm-h2 text-md-h2 text-lg-h2 text-xl-h2 mb-6 text-center text-sm-center text-md-left text-lg-left text-xl-left">Свяжитесь с нами</h2>
        <div class="d-flex flex-column flex-sm-row flex-md-row flex-lg-row flex-xl-row justify-space-between align-end">
          <div class="stret uk-height-1-1 pa-2 text-center d-flex flex-column align-center justify-space-between orange lighten-5">
                <img class="imag" src="assets/Contact1.png">
                <p>Позвоните нам!<br>Есть вопросы? Мы поможем<br>+7-906-457-03-40</p>
          </div>
          <div class="stret uk-height-1-1 pa-2 text-center  d-flex flex-column align-center justify-space-between orange lighten-5">
                <img class="imag" src="assets/Contact2.png">
                <p>Позвоните нам!<br>Есть вопросы? Мы поможем<br>+7-906-457-03-40</p>
          </div>
          <div class="stret uk-height-1-1 pa-2 text-center d-flex flex-column align-center justify-space-between orange lighten-5">
                <img class="imag" src="assets/Contact3.png">
                <p>Позвоните нам!<br>Есть вопросы? Мы поможем<br>+7-906-457-03-40</p>
          </div>
      </div>
    </v-container>
  </template>

<script>
export default {
  name: 'v-Contact',
}
</script>
<style scoped>

.stret {
  align-self: stretch;
}
.imag{
  /* background-image: url(../assets/contact_fon2.png);
  background-size: cover; */
  /* width: 50%; */
  height: 170px;
  width: 170px;
  object-fit: scale-down;
  object-position: center;
}
</style>