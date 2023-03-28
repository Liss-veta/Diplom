<template>
    <v-container>
        <h1 class="text-h1">Я хочу стать мастером...</h1>
        <v-form>
            <v-row>
                <v-col cols="12" md="6">
                    <v-text-field v-model="form.name" label="Имя" :error-messages="nameErrors"></v-text-field>
                    <v-text-field v-model="form.surname" label="Фамилия" :error-messages="surnameErrors"></v-text-field>
                    <v-text-field v-model="form.email" label="Электронная почта" :error-messages="emailErrors"></v-text-field>
                    <v-text-field v-model="form.number" label="Телефон" :error-messages="numberErrors"></v-text-field>
                </v-col>
                <v-col cols="12" md="6">
                    <v-file-input accept="image/*" label="Фотография вашего профиля"></v-file-input>
                </v-col>
                <v-col cols="12" md="4">
                    <v-select v-model="form.select" :items="form.items" :error-messages="selectErrors" label="Пол"></v-select>
                </v-col>
                <v-col cols="12" md="4">
                    <v-text-field v-model="form.age" label="Возраст" :error-messages="ageErrors"></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                    <v-combobox v-model="form.selectN" :items="form.napravlenie" :error-messages="selectNErrors" label="Выберите ваши направления" multiple chips></v-combobox>
                </v-col>
            </v-row>
            <v-row>
                <v-col cols="12" md="4">
                    <v-text-field v-model="form.city" label="Город" :error-messages="cityErrors"></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                    <v-text-field v-model="form.staj" label="Стаж" :error-messages="stajErrors"></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                    <v-text-field v-model="form.cena" label="Стоимость" :error-messages="cenaErrors"></v-text-field>
                </v-col>
            </v-row>
            <v-row>
                <v-col cols="12" md="8">
                    <v-text-field v-model="form.opisanie" :counter="200" label="Оставьте ваше описание для профиля" :error-messages="opisanieErrors"></v-text-field>
                </v-col>
            </v-row>
        <v-row>
            <v-col cols="12" md="4">
                <v-btn>Отправить заявку</v-btn>
            </v-col>
        </v-row>
        </v-form>
    </v-container>
</template>
<script>
import { useVuelidate } from '@vuelidate/core'
import {required, minLength, email, maxLength} from '@vuelidate/validators'

export default {
    name: "v-FormMasterView",
    setup () {
        return { v$: useVuelidate() }
    },
    
    data: () => ({
        form: {
           name: '',
            surname: '',
            email: '',
            number: '',
            age: '',
            city: '',
            staj: '',
            cena: '',
            opisanie: '',
            select: null,
            selectN: null,
            items: [
                'Мужской',
                'Женский'
            ],
            napravlenie: [
                'Programming',
                'Design',
                'Vue',
                'Vuetify',
            ], 
        }
    }),

    validations: {
        form: {
            name: {required, minLength: minLength(2)},
            surname: {required, minLength: minLength(3)},
            email: {required, minLength: minLength(2), email},
            number: {required, minLength: minLength(11), maxLength: maxLength(11)},
            age: {required},
            city: {required},
            staj: {required},
            cena: {required},
            opisanie: {required, minLength: minLength(200)},
            select: {required},
            selectN: {required}
        }
    },
    computed: {
        nameErrors() {
         const errors = [];
         if(!this.$v.form.name.required) errors.push('Обязательное поле для заполнения');
         if(!this.$v.form.name.minLength) errors.push('Не менее 2 символов');
         return errors;   
        },
        surnameErrors() {
         const errors = [];
         if(!this.$v.form.surname.required) errors.push('Обязательное поле для заполнения');
         if(!this.$v.form.surname.minLength) errors.push('Не менее 3 символов');
         return errors;   
        },
        emailErrors() {
         const errors = [];
         if(!this.$v.form.email.required) errors.push('Обязательное поле для заполнения');
         if(!this.$v.form.email.email) errors.push('Невалидный email');
         return errors;   
        },
        numberErrors() {
         const errors = [];
         if(!this.$v.form.number.required) errors.push('Обязательное поле для заполнения');
         if(!this.$v.form.number.minLength) errors.push('Не меньше 11 символов');
         if(!this.$v.form.email.maxLength) errors.push('Не больше 11 символов');
         return errors;   
        },
        ageErrors() {
         const errors = [];
         if(!this.$v.form.age.required) errors.push('Обязательное поле для заполнения');
         return errors;   
        },
        cityErrors() {
         const errors = [];
         if(!this.$v.form.city.required) errors.push('Обязательное поле для заполнения');
         return errors;   
        },
        stajErrors() {
         const errors = [];
         if(!this.$v.form.staj.required) errors.push('Обязательное поле для заполнения');
         return errors;   
        },
        cenaErrors() {
         const errors = [];
         if(!this.$v.form.cena.required) errors.push('Обязательное поле для заполнения');
         return errors;   
        },
        opisanieErrors() {
         const errors = [];
         if(!this.$v.form.opisanie.required) errors.push('Обязательное поле для заполнения');
         if(!this.$v.form.opisanie.minLength) errors.push('Не менее 200 символов');
         if(!this.$v.form.opisanie.maxLength) errors.push('Не более 400 символов');
         return errors;   
        },
        selectErrors() {
         const errors = [];
         if(!this.$v.form.select.required) errors.push('Обязательное поле для заполнения');
         return errors;   
        },
        selectNErrors() {
         const errors = [];
         if(!this.$v.form.selectN.required) errors.push('Обязательное поле для заполнения');
         return errors;   
        },
    }
}
</script>