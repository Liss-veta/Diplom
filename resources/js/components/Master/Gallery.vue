<template>
    <v-container>
        <div class="margin-minus">
            <div class="d-flex justify-center">
            <div class="w-80-md d-flex flex-column align-items-center">
                <h1 class="text-h2 my-10">Портфолио работ</h1>
                    <div class="grid-gallery-portfolio">
                        <div class="one-portfolio uk-animation-toggle"><img class="uk-animation-scale-up uk-transform-origin-top-center" src="assets/изображение 27.png"></div>
                        <div class="two-portfolio"><img class="uk-animation-scale-up uk-transform-origin-top-center" src="assets/image 18.png"></div>
                        <div class="three-portfolio"><img class="uk-animation-scale-up uk-transform-origin-top-center" src="assets/image 10.png"></div>
                        <div class="four-portfolio"><img class="uk-animation-scale-up uk-transform-origin-top-center" src="assets/image 3.png"></div>
                        <div class="five-portfolio"><img class="uk-animation-scale-up uk-transform-origin-top-center" src="assets/image 5.png"></div>
                        <div class="six-portfolio"><img class="uk-animation-scale-up uk-transform-origin-top-center" src="assets/image 7.png"></div>
                    </div>
            </div>
        </div>
    </div>
    </v-container>
</template>
<script>
export default {
    name: 'v-Gallery',
    mounted() {
        this.galleryClick()
    },
    methods: {
        galleryClick() {
            let grid = document.querySelector('.grid-gallery-portfolio');

            grid.addEventListener('click', function (event) {
                    let one = document.querySelector('.one-portfolio').innerHTML;
                    let target = event.target;
                    if(target.tagName === 'IMG'){
                        document.querySelector('.one-portfolio').innerHTML = target.outerHTML;
                        target.parentElement.innerHTML = one;
                    }
            });
        },
    }
}
</script>
<style>
.margin-minus {
    margin-top: -8vw;
}
.grid-gallery-portfolio {
    display: grid;
    grid-template-areas:
    'one-p one-p two-p three-p'
    'one-p one-p four-p five-p'
    'one-p one-p six-p six-p';
    grid-template-columns: 15vw 15vw 15vw 15vw;
    grid-template-rows: 28vh 28vh 28vh;
    gap: 2vh;
}

.grid-gallery-portfolio > div > img {
    height: 100%;
    width: 100%;
    object-fit: cover;
    object-position: center;
    cursor: pointer;
}

.one-portfolio {
    grid-area: one-p;
    align-self: stretch;
}

.two-portfolio {
    grid-area: two-p;
}
.three-portfolio {
    grid-area: three-p;
}
.four-portfolio {
    grid-area: four-p;
}
.five-portfolio {
    grid-area: five-p;
}
.six-portfolio {
    grid-area: six-p;
}
</style>