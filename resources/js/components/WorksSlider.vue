<template>
 <div class="container">
  <div class="card" v-for="post in this.posts" :key="post">
    <img :src="post.arr_images[0].image">
    <div class="card__head">{{ post.id_master.name }} {{ post.id_master.surname }}</div>
  </div>
</div>
</template>

<script>
  export default {
    name: 'HelloWorld',
    data() {
      return {
        posts: [],
      }
    },
    methods: {
      getPosts() {
            axios.get('/api/posts', {
                headers: {
                    'Accept': "application/json",
                    'Content-type': "application/json"
                }
            }).then(response => {
                this.posts = response.data.data
            }).catch(error => {
              console.log(error)
            })
        },
    },
    mounted() {
      this.getPosts()
    },
  }
</script>
<style scoped>
body {
  margin: 0;
  min-height: 100vh;
  background: #000;
  font-family: sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
}

.container {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 10vmin;
  overflow: hidden;
  transform: skew(5deg);
}
.container .card {
  flex: 1;
  transition: all 1s ease-in-out;
  height: 75vmin;
  position: relative;
}
.container .card .card__head {
  color: black;
  background: rgba(249, 77, 132, 0.75);
  padding: 0.5em;
  transform: rotate(-90deg);
  transform-origin: 0% 0%;
  transition: all 0.5s ease-in-out;
  min-width: 100%;
  text-align: center;
  position: absolute;
  bottom: 0;
  left: 0;
  font-size: 1em;
  white-space: nowrap;
}
.container .card:hover {
  flex-grow: 10;
}
.container .card:hover img {
  filter: grayscale(0);
}
.container .card:hover .card__head {
  text-align: center;
  top: calc(100% - 2em);
  color: white;
  background: rgba(0, 0, 0, 0.5);
  font-size: 2em;
  transform: rotate(0deg) skew(0deg);
}
.container .card img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: all 1s ease-in-out;
  filter: grayscale(40%);
}
.container .card:not(:nth-child(5)) {
  margin-right: 1em;
}
</style>
