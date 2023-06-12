<template>
    <div class="very my-16">
        <div class="ma">
            <div id="one" class="one" @click.prevent="galleryOne()">
                <img src="assets/hgfgfh.jpg" />
            </div>
            <div id="three" class="three" @click.prevent="galleryThree()">
                <img src="assets/5c61154bc3c724e9bb79153dda91aec5retger.jpg" />
            </div>
        </div>
        <div class="two" id="two">
            <img src="assets/696bca3299a1ac62623c6efae7349bcfgf.jpg" />
        </div>

    </div>
</template>
<script>
export default {
    name: 'v-AboutTwo',
    methods:{
        galleryOne(){
            let center = document.getElementById('one').innerHTML
            let left = document.getElementById('two').innerHTML
            document.getElementById('one').innerHTML = left;
            document.getElementById('two').innerHTML = center;
        },
        galleryThree(){
            let center = document.getElementById('three').innerHTML
            let right = document.getElementById('two').innerHTML
            document.getElementById('three').innerHTML = right;
            document.getElementById('two').innerHTML = center;
        },
    }
}
</script>
<style>
.very {
    width: 100%;
    display: flex;
    justify-content: center;
    position: relative;
}
.ma{
    width: 90%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    z-index: 5;
}
.one > img, .two > img, .three > img {
    height: 100%;
    object-fit: cover;
    width: 100%;
}
.one, .three {
    height: 350px;
    width: 35%;
    margin-top: 5%;
}
.one, .three {
    filter: brightness(0.4);
}
.two{
    height: 500px;
    width: 50%;
    z-index: 15;
    position: absolute;
    top: 0;
}
.one:hover, .three:hover{
    cursor: pointer;
}
</style>