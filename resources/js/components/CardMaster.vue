<template>
  <div>
  <v-container class="d-flex 
    flex-column flex-sm-row flex-md-row flex-lg-row flex-xl-row 
    justify-sm-space-around justify-md-space-between justify-lg-space-between justify-xl-space-between
    mb-12
    text-center">
    <h2 class="text-h2">Наши мастера</h2>
    <v-btn><router-link to="/masters">Специалисты</router-link></v-btn>
  </v-container>
  <v-container class="d-flex flex-column flex-md-row flex-lg-row flex-xl-row justify-space-between mb-12">
    <div class="proba2">
      <div class="t1"></div>
      <div class="t2">
        <v-img
        class="uk-height-1-1"
        src="assets/master.png"></v-img>
      </div>
      <div class="t3 d-flex justify-end align-center">
        <div @click.prevent="$router.push('/profile')" class="d-sm-flex flex-column d-md-none d-lg-none d-xl-none uk-width-4-5">
          <h3 class="ch text-h3">Мастер Алина</h3>
          <p class="ch">Возраст: <span>23 года</span></p>
          <p class="ch">Стаж: <span>3 года</span></p>
          <p class="ch">Стоимость: от <span>1200</span>Р</p>
        </div>
      </div>
    </div>
    <div class="proba2">
      <div class="t1"></div>
      <div class="t2"><v-img
        class="uk-height-1-1"
        src="assets/image 13.jpg"></v-img></div>
      <div class="t3 d-flex justify-end align-center">
        <div class="d-sm-flex flex-column d-md-none d-lg-none d-xl-none uk-width-4-5">
          <h3 class="ch text-h3">Мастер Алина</h3>
          <p class="ch">Возраст: <span>23 года</span></p>
          <p class="ch">Стаж: <span>3 года</span></p>
          <p class="ch">Стоимость: от <span>1200</span>Р</p>
        </div>
      </div>
    </div>
    <div class="proba2">
      <div class="t1"></div>
      <div class="t2">
        <v-img
        class="uk-height-1-1"
        src="assets/image 15.jpg"></v-img>
      </div>
      <div class="t3 d-flex justify-end align-center">
        <div class="d-sm-flex flex-column d-md-none d-lg-none d-xl-none uk-width-4-5">
          <h3 class="ch text-h3">Мастер Алина</h3>
          <p class="ch">Возраст: <span>23 года</span></p>
          <p class="ch">Стаж: <span>3 года</span></p>
          <p class="ch">Стоимость: от <span>1200</span>Р</p>
        </div>
      </div>
    </div>
  </v-container> 
  </div>
</template>

<script>
  export default {
    name: 'CardMaster',
    data: () => ({
        imageMaster: {
          image1: {backgroundImage: 'url(assets/image 10.png)'},
          image2: 'assets/image 7.png',
          image3: 'assets/image 5.png',
      }
    }),
  }
</script>
<style>
.t2 {
  width: 15vw;
  height: 18vw;
}

.proba2{
  display: flex;
  justify-content: center;
  align-items: center;
  height: 10vw;
}

.t1{
  border: 1px solid black;
  border-right: none;
  width: 1vw;
  height: 13vw;
}

.t3{
  border: 1px solid black;
  border-left: none;
  width: 1vw;
  height: 13vw;
}
@media screen and (max-width: 959px){
  .proba2{
    height: 52vw;
  }
  .t1{
    width: 7vw;
    height: 40vw;
  }
  .t3{
    width: 33vw;
    height: 40vw;
  }
  .t2{
    width: 40vw;
    height: 50vw;
  }

}
@media screen and (max-width: 750px){
  .t1{
    width: 5vw;
  }
  .t3{
    width: 40vw;
  }
} 
@media screen and (max-width: 650px){
  .ch {
    display: none;
  }
  .proba2{
    height: 75vw;
  }
  .t1, .t3{
    width: 10vw;
    height: 60vw;
  }
  .t2{
    width: 60vw;
    height: 70vw;
  }
}

</style>