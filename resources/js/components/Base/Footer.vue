<template>
  <v-footer class="bg-light-green-lighten-1 d-flex flex-column mt-10">
    <div class="d-flex mt-2 text-white align-center w-100 justify-space-between align-center">
      <img src="assets/паттерн 1.png" style="height: 70px;" cover alt=""/>
      <v-row justify="center" no-gutters>
      <v-btn variant="text" class="mx-2" rounded="xl">
        <router-link style="text-decoration: none;" class="mx-2 text-white" rounded="xl" to="/">Главная</router-link>
      </v-btn>
      <v-btn variant="text" class="mx-2" rounded="xl">
        <router-link style="text-decoration: none;" class="mx-2 text-white" rounded="xl" to="/about">О нас</router-link>
      </v-btn>
      <v-btn variant="text" class="mx-2" rounded="xl">
        <router-link style="text-decoration: none;" class="mx-2 text-white" rounded="xl"
          to="/masters">Мастера</router-link>
      </v-btn>
      <v-btn variant="text" class="mx-2" rounded="xl">
        <router-link style="text-decoration: none;" class="mx-2 text-white" rounded="xl" to="/sovets">Советы</router-link>
      </v-btn>
    </v-row>
       <div class="text-caption text-end text-grey-darken-3"> 
        <p class="ma-0">Условия пользования</p>
        <p class="ma-0">Политика конфиндециальности</p>
        <hr class="w-100 my-2 bg-grey-darken-3" style="border-top: 1px solid #424242;" color="grey-darken-3">
        <p class="mt-1">CopyRight © 2023. Все права защищены</p>
      </div>
      
    </div>
  </v-footer>
</template>

<script>
export default {
  name: 'v-Footer',
  data: () => ({
    icons: [
      'mdi-facebook',
      'mdi-twitter',
      'mdi-linkedin',
      'mdi-instagram',
    ],
  }),
}
</script>