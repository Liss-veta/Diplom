<template>
  <div class="mb-12">
    <v-container class="d-flex 
    flex-column flex-sm-row flex-md-row flex-lg-row flex-xl-row 
    justify-sm-space-around justify-md-space-between justify-lg-space-between justify-xl-space-between mb-12 text-center">
      <h2 class="text-h2">Наши мастера</h2>
      <div class="btn_first" color="primary">
        <button @click.prevent="$router.push('/masters')" type="submit" class="noselect">Специалисты</button>
      </div>
    </v-container>
    <v-container class="d-flex flex-column flex-md-row flex-lg-row flex-xl-row justify-space-between mb-12 mt-6">
      <div @click.prevent="$router.push('/profile/' + master.id)" v-for="master in arr_masters" :key="master"
        class="proba2">
        <div class="t1"></div>
        <div class="t2">
          <v-img class="uk-height-1-1" cover :src="master.avatar"></v-img>
        </div>
        <div class="t3 d-flex justify-end align-center">
          <div @click.prevent="$router.push('/profile/' + master.id)"
            class="d-sm-flex flex-column d-md-none d-lg-none d-xl-none uk-width-4-5">
            <h3 class="ch text-h3">Мастер {{ master.name }}</h3>
            <p class="ch">Возраст: <span>{{ master.age }}</span></p>
            <p class="ch">Стаж: <span>master.staj</span></p>
            <p class="ch">Стоимость: от <span>master.min_cena</span>Р</p>
          </div>
        </div>
      </div>
      <!-- <div class="proba2">
        <div class="t1"></div>
        <div class="t2"><v-img class="uk-height-1-1" src="assets/image 13.jpg"></v-img></div>
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
        <div class="t2"><v-img class="uk-height-1-1" src="assets/image 15.jpg"></v-img></div>
        <div class="t3 d-flex justify-end align-center">
          <div class="d-sm-flex flex-column d-md-none d-lg-none d-xl-none uk-width-4-5">
            <h3 class="ch text-h3">Мастер Алина</h3>
            <p class="ch">Возраст: <span>23 года</span></p>
            <p class="ch">Стаж: <span>3 года</span></p>
            <p class="ch">Стоимость: от <span>1200</span>Р</p>
          </div>
        </div>
      </div> -->
    </v-container>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'CardMaster',
  data: () => ({
    arr_masters: [],
    arr: [],
  }),
  mounted() {
    this.getMaster()
  },
  methods: {
    getMaster() {
      axios.get('/api/admin/master/main', {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }
      }).then(response => {
        this.arr = response.data.content;
        for (let index = 0; index < this.arr.length; index++) {
          if(this.arr[index].admin_status == "active"){
            this.arr_masters.push(this.arr[index])
            if(this.arr_masters.length == 3){
              break;
            }
          }
          
        }
      })
    }
  }
}
</script>
<style>
.btn_first {
  width: 150px;
  height: 40px;
  border: 1px solid #333;
  font-family: 'Cinzel', serif;
  font-size: 20px;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  z-index: 0;
  transition: 1s;
}

.btn_first::before,
.btn_first::after {
  position: absolute;
  background: #F8BBD0;
  z-index: -1;
  transition: 1s;
  content: '';
}

.btn_first::before {
  height: 40px;
  width: 130px;
}

.btn_first::after {
  width: 150px;
  height: 30px;
}

.noselect {
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.btn_first:hover::before {
  width: 0px;
  background: #F06292;
  color: white;
}

.btn_first:hover::after {
  height: 0px;
  background: #F06292;
  color: white;
}

.btn_first:hover {
  background: #F06292;
  color: white;
}

.btn_first a {
  text-decoration: none;
  color: black;
}

.btn_first a:hover::before,
.btn_first a:hover::after {
  color: white;
}

.t2 {
  width: 15vw;
  height: 18vw;
  -webkit-box-shadow: 0px 0px 10px 10px rgba(244, 143, 177, 0.2);
  -moz-box-shadow: 0px 0px 10px 10px rgba(244, 143, 177, 0.2);
  box-shadow: 0px 0px 10px 10px rgba(244, 143, 177, 0.2);
}

.t2:hover {
  -webkit-box-shadow: 0px 0px 10px 10px rgba(244, 143, 177, 0.5);
  -moz-box-shadow: 0px 0px 10px 10px rgba(244, 143, 177, 0.5);
  box-shadow: 0px 0px 10px 10px rgba(244, 143, 177, 0.5);
}

.proba2 {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 10vw;
}

.t1 {
  border: 1px solid black;
  border-right: none;
  width: 1vw;
  height: 13vw;
}

.t3 {
  border: 1px solid black;
  border-left: none;
  width: 1vw;
  height: 13vw;
}

@media screen and (max-width: 959px) {
  .proba2 {
    height: 52vw;
  }

  .t1 {
    width: 7vw;
    height: 40vw;
  }

  .t3 {
    width: 33vw;
    height: 40vw;
  }

  .t2 {
    width: 40vw;
    height: 50vw;
  }

}

@media screen and (max-width: 750px) {
  .t1 {
    width: 5vw;
  }

  .t3 {
    width: 40vw;
  }
}

@media screen and (max-width: 650px) {
  .ch {
    display: none;
  }

  .proba2 {
    height: 75vw;
  }

  .t1,
  .t3 {
    width: 10vw;
    height: 60vw;
  }

  .t2 {
    width: 60vw;
    height: 70vw;
  }
}
</style>