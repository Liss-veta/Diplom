<template>
    <div class="text-center">
            <v-dialog activator="parent" v-model="dialog" class="bg-pink-lighten-3">
                <template v-slot:activator="{ props }">
                    <v-btn icon="mdi-exit-to-app" v-bind="props" >
                    </v-btn>
                </template>  
                <v-card class="di di_w ml-0 d-flex justify-space-between" color="transparent" uk-grid>
                    <button class="uk-modal-close-default" @click="dialog = false" aria-label="Close" uk-close></button>
                    <div class="di uk-width-1-1 uk-height-1-1 mt-0 pl-0">
                        <v-card class="d-flex uk-width-1-1" style="height: 100%">
                            <v-tabs v-model="tab" class="bg-pink-accent-2 flex-column text-center" style="height: 100%;" direction="vertical">
                                <v-tooltip class="text-center" v-model="show" location="bottom">
                                    <template v-slot:activator="{ props }">
                                        <v-tab style="height: 33%" class="text-center justify-center" value="option-1">
                                            <v-icon v-bind="props" start>
                                                mdi-account
                                            </v-icon>
                                        </v-tab>
                                    </template>
                                    <span>Авторизация</span>
                                </v-tooltip>
                                <v-tooltip v-model="show" location="bottom">
                                    <template v-slot:activator="{ props }">
                                        <v-tab style="height: 33%" class="justify-center" value="option-2">
                                            <v-icon v-bind="props" start>
                                                mdi-lock
                                            </v-icon>
                                        </v-tab>
                                    </template>
                                    <span>Регистрация</span>
                                </v-tooltip>
                                <v-tooltip v-model="show" location="bottom">
                                    <template v-slot:activator="{ props }">
                                        <v-tab style="height: 33%" class="justify-center" value="option-3" min-width="auto">
                                            <v-icon v-bind="props" start>
                                                mdi-access-point
                                            </v-icon>
                                        </v-tab>
                                    </template>
                                    <span>Регистрация мастера</span>
                                </v-tooltip>
                            </v-tabs>
                            <v-window class="w-100 h-100" v-model="tab">
                                <v-window-item value="option-1" style="height: 100%">
                                    <v-card class="uk-height-1-1" flat>
                                        <div class="uk-height-1-1 pink-lighten-3 ">
                                                <div class="uk-height-1-1 uk-width-1-1 d-flex justify-center">
                                                    <div class="uk-width-2-5 h-100 d-none d-sm-block d-lg-block d-md-block d-xl-block">
                                                        <img src="assets/image auth.png" class="h-100 img-auth"/>
                                                    </div>
                                                <div class="d-flex flex-column align-end justify-center uk-width-4-5@m uk-width-1-1 uk-width-4-5@s uk-width-4-5@l uk-width-4-5@xl py-12 border-x">
                                                    
                                                    <div class="uk-width-1-1">
                                                        <h3 class="text-h4 text-sm-h3 text-md-h3 text-lg-h3 text-xl-3 uk-width-1-1 px-8 py-2">Авторизация</h3>
                                                        <v-divider class="uk-width-1-1"></v-divider>
                                                        <form class="uk-width-1-1 px-sm-8 px-md-8 px-lg-8 px-xl-8 px-1">
                                                            <v-text-field
                                                                label="E-mail"
                                                                prepend-icon="mdi-at"
                                                            ></v-text-field>
                                                            <v-text-field
                                                                label="Password"
                                                                prepend-icon="mdi-lock"
                                                            ></v-text-field>
                                                        </form>
                                                    </div>
                                                    <div class="uk-width-1-1 px-8 d-flex justify-end">
                                                        <div class="btn_first" color="primary" v-bind="props" >
                                                            <span class="noselect"><router-link @click="dialog = false" to="/prof">Войти</router-link></span>
                                                        </div>
                                                    </div>
                                                    
                                                </div> 
                                                </div>         
                                            </div>
                                    </v-card>
                                </v-window-item>
                                <v-window-item value="option-2" style="height: 100%">
                                    <v-card class="h-100" flat>
                                        <div class="h-100">
                                                <div class="uk-width-1-1 h-100 d-flex justify-center">
                                                    <div class="uk-width-2-5 d-none d-sm-block d-lg-block d-md-block d-xl-block">
                                                        <img src="assets/image auth.png" class="h-100 img-auth"/>
                                                    </div>
                                                <div class="d-flex flex-column align-end justify-center uk-width-4-5@m uk-width-1-1 uk-width-4-5@s uk-width-4-5@l uk-width-4-5@xl py-12 border-x">
                                                    <div class="uk-width-1-1">
                                                        <h3 class="text-h4 text-sm-h3 text-md-h3 text-lg-h3 text-xl-3 uk-width-1-1 px-8 py-2">Регистрация</h3>
                                                        <v-divider class="uk-width-1-1"></v-divider>
                                                        <form class="uk-width-1-1 px-sm-8 px-md-8 px-lg-8 px-xl-8 px-1">
                                                            <v-text-field
                                                                label="E-mail"
                                                                prepend-icon="mdi-at"
                                                            ></v-text-field>
                                                            <v-text-field
                                                                label="Имя"
                                                                prepend-icon="mdi-at"
                                                            ></v-text-field>
                                                            <v-text-field
                                                                label="Пароль"
                                                                prepend-icon="mdi-lock"
                                                            ></v-text-field>
                                                            <v-text-field
                                                                label="Повторите пароль"
                                                                prepend-icon="mdi-lock"
                                                            ></v-text-field>
                                                        </form>
                                                    </div>
                                                    <div class="uk-width-1-1 px-8 d-flex justify-end">
                                                        <div class="btn_first" color="primary" v-bind="props">
                                                            <span class="noselect"><router-link @click="dialog = false" to="/prof">Войти</router-link></span>
                                                        </div>
                                                    </div>
                                                    
                                                </div> 
                                                </div>         
                                            </div>
                                    </v-card>
                                </v-window-item>
                                <v-window-item class="h-100" value="option-3">
                                    <v-card class="uk-height-1-1 h-100" flat>
                                        <div class="uk-height-1-1 pink-lighten-3 ">
                                                <div class=" uk-height-1-1 uk-width-1-1 d-flex justify-center">
                                                    <div class="uk-width-2-5 d-none d-sm-block d-lg-block d-md-block d-xl-block h-100">
                                                        <img src="assets/image auth.png" class="h-100 img-auth"/>
                                                    </div>
                                                    <div class="d-flex align-center justify-center uk-width-4-5 h-100 py-12 border-x text-center">
                                                        <h3 class="text-h6 text-sm-h4 text-md-h4 text-lg-h4 text-xl-h4 w-75" color="black">Для того чтобы подать заявку на сотрудничество, зарегистрируйтесь на сайте</h3>                                                  
                                                    </div> 
                                                </div>         
                                            </div>
                                    </v-card>
                                </v-window-item>
                            </v-window>
                        </v-card>
                    </div>
                </v-card>
                <!-- <v-card class="di di_w ml-0 d-flex justify-space-between" color="transparent" uk-grid>
            <button class="uk-modal-close-default" @click="dialog = false" aria-label="Close" uk-close></button>
            <div class="di uk-width-1-1 uk-height-1-1 pl-0">
                <template>
                <v-card style="height: 100%">
                    <v-tabs v-model="tab" direction="vertical" style="height: 100%" class="uk-width-1-1">
                    <v-tooltip bottom>
                            <template v-slot:activator="{ props }">
                                <v-tab value="option-1" v-bind="props">
                                    <v-icon start>
                                    mdi-account
                                    </v-icon>                          
                                </v-tab>
                            </template>                 
                            <span>Авторизация</span>
                    </v-tooltip>
                    <v-tooltip bottom>
                            <template v-slot:activator="{ props }">
                                <v-tab value="option-2" v-bind="props">
                                    <v-icon start>
                                    mdi-account-plus
                                    </v-icon>                          
                                </v-tab>
                            </template>                 
                            <span>Регистрация</span>
                    </v-tooltip>
                    <v-tooltip bottom>
                            <template v-slot:activator="{ props }">
                                <v-tab value="option-3" v-bind="props">
                                    <v-icon start>
                                    mdi-account-star
                                    </v-icon>                          
                                </v-tab>
                            </template>                 
                            <span>Регистрация мастера</span>
                    </v-tooltip>
                    </v-tabs>
                    <v-window v-model="tab">
                            <v-window-item value="option-1" style="height: 100%">
                                <v-card class="uk-height-1-1" flat>
                                    <div class="uk-height-1-1 pink-lighten-3 ">
                                            <div class=" uk-height-1-1 uk-width-1-1 d-flex justify-start ">
                                            <div class="uk-width-2-5">
                                                <v-img src="assets/image auth.png" class="img-auth"></v-img>
                                            </div>
                                            <div class="d-flex flex-column align-end justify-center uk-width-4-5 py-12 border-x">
                                                
                                                <div class="uk-width-1-1">
                                                    <h3 class="text-h3 uk-width-1-1 px-8 py-2">Авторизация</h3>
                                                    <v-divider class="uk-width-1-1"></v-divider>
                                                    <form class="uk-width-1-1 px-8">
                                                        <v-text-field
                                                            label="E-mail"
                                                            prepend-icon="mdi-at"
                                                        ></v-text-field>
                                                        <v-text-field
                                                            label="Password"
                                                            prepend-icon="mdi-lock"
                                                        ></v-text-field>
                                                    </form>
                                                </div>
                                                <div class="uk-width-1-1 px-8 d-flex justify-end">
                                                    <div class="btn_first" color="primary" v-bind="props" >
                                                        <span class="noselect"><router-link @click="dialog = false" to="/prof">Войти</router-link></span>
                                                    </div>
                                                </div>
                                                
                                            </div> 
                                            </div>         
                                        </div>
                                </v-card>
                            </v-window-item>
                            <v-window-item value="option-2" class="uk-height-1-1">
                                <v-card flat>
                                    <div class="pink-lighten-3 ">
                                            <div class="uk-width-1-1 d-flex justify-start">
                                            <div class="uk-width-2-5">
                                                <v-img src="assets/image auth.png" class="img-auth"></v-img>
                                            </div>
                                            <div class="d-flex flex-column align-end justify-center uk-width-4-5 py-12 border-x">
                                                <div class="uk-width-1-1">
                                                    <h3 class="text-h3 uk-width-1-1 px-8 py-2">Регистрация</h3>
                                                    <v-divider class="uk-width-1-1"></v-divider>
                                                    <form class="uk-width-1-1 px-8">
                                                        <v-text-field
                                                            label="E-mail"
                                                            prepend-icon="mdi-at"
                                                        ></v-text-field>
                                                        <v-text-field
                                                            label="Имя"
                                                            prepend-icon="mdi-at"
                                                        ></v-text-field>
                                                        <v-text-field
                                                            label="Пароль"
                                                            prepend-icon="mdi-lock"
                                                        ></v-text-field>
                                                        <v-text-field
                                                            label="Повторите пароль"
                                                            prepend-icon="mdi-lock"
                                                        ></v-text-field>
                                                    </form>
                                                </div>
                                                <div class="uk-width-1-1 px-8 d-flex justify-end">
                                                    <div class="btn_first" color="primary" v-bind="props">
                                                        <span class="noselect"><router-link @click="dialog = false" to="/prof">Войти</router-link></span>
                                                    </div>
                                                </div>
                                                
                                            </div> 
                                            </div>         
                                        </div>
                                </v-card>
                            </v-window-item>
                    </v-window>
                </v-card>
                </template>
            </div>
                <div class="di uk-height-1-1 uk-width-1-2 pr-0 pl-6">
                    <transition name="slide-fade" appear mode="out-in">          
                <div v-if="show" key="visible" class=" uk-height-1-1 pink lighten-3 ">
                    <div class=" uk-height-1-1 uk-width-1-1 d-flex justify-start ">
                    <div class="uk-width-2-5">
                        <v-img src="../../assets/image auth.png" class="img-auth"></v-img>
                    </div>
                    <div class="d-flex flex-column align-end justify-center uk-width-4-5 py-12 border-x">
                        
                        <div class="uk-width-1-1">
                            <h3 class="text-h3 uk-width-1-1 px-8 py-2">Авторизация</h3>
                            <v-divider class="uk-width-1-1"></v-divider>
                            <form class="uk-width-1-1 px-8">
                                <v-text-field
                                    label="E-mail"
                                    prepend-icon="mdi-at"
                                ></v-text-field>
                                <v-text-field
                                    label="Password"
                                    prepend-icon="mdi-lock"
                                ></v-text-field>
                            </form>
                        </div>
                        <div class="uk-width-1-1 px-8 d-flex justify-end">
                            <div class="btn_first" color="primary" dark v-bind="attrs" v-on="on" >
                                <span class="noselect"><router-link @click="dialog = false" to="/prof">Войти</router-link></span>
                            </div>
                        </div>
                        
                    </div> 
                    </div>         
                </div>
                <div v-else key="not visible" class="pink lighten-3 ">
                    <div class="uk-width-1-1 d-flex justify-start ">
                    <div class="uk-width-2-5">
                        <v-img src="../../assets/image auth.png" class="img-auth"></v-img>
                    </div>
                    <div class="d-flex flex-column align-end justify-center uk-width-4-5 py-12 border-x">
                        <div class="uk-width-1-1">
                            <h3 class="text-h3 uk-width-1-1 px-8 py-2">Регистрация</h3>
                            <v-divider class="uk-width-1-1"></v-divider>
                            <form class="uk-width-1-1 px-8">
                                <v-text-field
                                    label="E-mail"
                                    prepend-icon="mdi-at"
                                ></v-text-field>
                                <v-text-field
                                    label="Имя"
                                    prepend-icon="mdi-at"
                                ></v-text-field>
                                <v-text-field
                                    label="Пароль"
                                    prepend-icon="mdi-lock"
                                ></v-text-field>
                                <v-text-field
                                    label="Повторите пароль"
                                    prepend-icon="mdi-lock"
                                ></v-text-field>
                            </form>
                        </div>
                        <div class="uk-width-1-1 px-8 d-flex justify-end">
                            <div class="btn_first" color="primary" dark v-bind="attrs" v-on="on" >
                                <span class="noselect"><router-link @click="dialog = false" to="/prof">Войти</router-link></span>
                            </div>
                        </div>
                        
                    </div> 
                    </div>         
                </div>
             </transition>              
            </div>             -->
                <!-- </v-card> -->
            </v-dialog>
    </div>
</template>
<script>
export default {
    data() {
        return {
            dialog: false,
            tab: 'option-1',
            show: false,
        }
    },
}
</script>

<style>
.v-window__container {
    height: 100%;
}

.v-slide-group--vertical .v-tab {
    padding: 0;
    justify-content: center;
}

.theme--light.v-tabs>.v-tabs-bar {
    background-color: #9CCC65;
}

.v-slide-group--vertical .v-tab {
    height: 33%;
}

.di_w {
    height: 70vh;
}

/* Анимации появления и исчезновения могут иметь
различные продолжительности и динамику.       
 .slide-fade-enter-active {
  transition: all .3s ease;
}
.slide-fade-leave-active {
  transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);
} 
 .slide-fade-enter, .slide-fade-leave-to 
.slide-fade-leave-active до версии 2.1.8 { 
   transform: translateX(30vw);
  z-index: -2;
  opacity: 0;
}  */

.di {
    overflow: hidden;
}

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

.border {
    border: 1px solid black;
    border-color: black;
}

.border-x {
    border-left: 1px solid black;
}

.border-bottom {
    border-bottom: 1px solid black;
}

.img-auth {
    height: 100%;
    object-fit: cover;
    object-position: right;
}

@media screen and (max-width: 650px){
    .border-x {
        border: none;
    }
    .w-5{
        width: 15%;
    }
}

/* .vid {
    position: relative;
    box-shadow: inset 0px 0px 100px 5px black;
}
video {
    filter: brightness(0.2);
    filter: saturate(70%);
    height: 100%;
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    object-fit: cover;
    object-position: center;
    z-index: -1;
} */
</style>