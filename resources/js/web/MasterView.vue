<template>
  <div>
    <Home></Home>
    <v-container class="mt-12 d-flex justify-space-between align-center">
      <h1
        class="w-75 text-center text-sm-start text-md-start text-lg-start text-xl-start text-h3 text-sm-h2 text-md-h2 text-lg-h2 text-xl-h2">
        Наша команда</h1>
      <v-select class="w-25" bg-color="light-green-lighten-4" label="Сортировка по" :items="['Min цена', 'Max цена', 'Имя &#8593;', 'Имя &#8595;', 'Город &#8593;', 'Город &#8595;']"></v-select>
      <!-- <select class="uk-select w-25" aria-label="Select">
                <option @click="sortParam = 'Все'">Все</option>
                <option @click="sortParam = 'Отправлен'">Отправлен</option>
                <option @click="sortParam = 'Принято'">Принято</option>
                <option @click="sortParam = 'Отклонено'">Отклонено</option>
                <option @click="sortParam = 'Успешно завершено'">Успешно завершено</option>
                <option @click="sortParam = 'Экстренно отклонено'">Экстренно отклонено</option>
            </select> -->
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

