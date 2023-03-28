import './bootstrap';

// import { createApp } from 'vue';
// import App from './web/App.vue';
// import RouterWeb from './router/index'
// import '@mdi/font/css/materialdesignicons.css'
// import 'vuetify/styles'
// import { createVuetify } from 'vuetify'
// import * as components from 'vuetify/components'
// import * as directives from 'vuetify/directives'
// const app = createApp(App);
// const vuetify = createVuetify({
//   components,
//   directives,
// })
// app.use(RouterWeb);
// app.use(vuetify)
// app.mount('#app');
import { createApp } from 'vue'
import App from './App.vue'
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import router from './router/index.js'; 
import '@mdi/font/css/materialdesignicons.css'

const vuetify = createVuetify({
  components,
  directives,
  iconfont: 'mdi',
})

createApp(App).use(vuetify).use(router).mount('#app')