<template>
    <div>
        <section class="about_laptop container mt-12">
            <fieldset class="bottomlegend">
                <legend>
                    <div><img src="assets/image 10.png" alt=""></div>
                    <div><img src="assets/image 10.png" alt=""></div>
                </legend>
            </fieldset>
        </section>
    </div>
</template>
<script>
export default{
    name: 'v-AboutTwo'
}
</script>
<style>

.bottomlegend {
    min-width: auto;
    padding: 0 10px 0 25vh;
    margin: 0;
    height: 20vw;
    border: 1px solid black;
    transform: rotate(180deg);
}
.bottomlegend > legend {
    color: black;
    padding: 3px 6px;
    float: none;
    width: auto;
    margin-left: 0;
    font-size: 2em;
    transform: rotate(180deg);
    display: flex;
}

.bottomlegend > legend div:first-child {
    padding-right: 10vw;
}

.bottomlegend > legend > div > img {
    height: 20vh;
    width: 40vh;
    object-fit: cover;
}
</style>