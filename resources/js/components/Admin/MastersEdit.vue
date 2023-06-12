<template>
    <nav class="uk-navbar-container d-flex justify-space-between uk-width-1-1 bg-none" uk-navbar>
        <div class="uk-navbar-left pt-5 pl-12 uk-width-1-3 mx-0 d-flex align-center">
            <div class="uk-width-1-1">
                <v-autocomplete @change="sortHandler()" v-model="this.sortParam" label="Сортировка" bg-color="light-green-lighten-3"
                    :items="['Все', 'Забаненные', 'Активные', 'Max цена', 'Min цена', 'А -> Я', 'Я -> А']"></v-autocomplete>
            </div>
        </div>
        <div class="uk-navbar-right pr-5 mx-0 uk-width-1-2 d-flex justify-end">
        </div>
    </nav>
    <div v-for="masters in this.sortHandler" :key="masters">
        <div class="px-12 pt-6 w-100">
            <h2>
                {{ masters.name }} {{ masters.surname }}
            </h2>
            <div class="w-100 d-flex justify-space-between">
                <img style="width: 250px; object-fit: cover;" :src="masters.avatar" alt="">
                <div style="border-top: 1px solid black;" class="w-75 px-12 d-flex flex-column justify-space-between">
                    <h5 class="text-h5 mt-6">Возраст: {{ masters.age }}</h5>
                    <h5 class="text-h5 mt-1">Город: {{ masters.city }}</h5>
                    <h5 class="text-h5 mt-1">Стаж: {{ masters.staj }} года</h5>
                    <h5 class="text-h5 mt-1">Цена: от {{ masters.min_cena }}Р</h5>
                    <div class="my-6">
                        <v-chip v-for="(tag, i) in masters.tag" :key="tag" size="large" class="mr-2" label
                            :color="i % 2 == 0 ? 'success' : 'pink'" text-color="white">
                            {{ tag.id_tag.tag_name }}
                        </v-chip>
                    </div>
                    <div class="w-100">
                        <v-btn class="w-75" variant="outlined" rounded="0" disabled >Работает в {{ masters.tag.length }} направлениях</v-btn>
                        <v-btn v-if="masters.admin_status == 'active'" variant="tonal" class="w-25 bg-red-darken-4"
                            rounded="0" @click.prevent="ban(masters.id)">Забанить</v-btn>
                        <v-btn v-else class="w-25 bg-light-green-lighten-1" variant="tonal" rounded="0"
                            @click.prevent="ban(masters.id)">Разабанить</v-btn>
                    </div>
                </div>
            </div>
        </div>
        <hr class="my-5">
    </div>
</template>

<script>

export default {
    data() {
        return {
            arr_masters: [],
            sortParam: 'Все',
            token: localStorage.getItem('token')
        }
    },
    mounted() {
        this.all()
    },
    computed: {
        sortHandler() {
            // Сортировка по статусу
            if(this.sortParam === 'Все') return this.arr_masters
            switch(this.sortParam) {
                case 'Забаненные': return this.arr_masters.filter(masters => {
                return masters.admin_status.includes('ban')
                })
                case 'Активные': return this.arr_masters.filter(masters => {
                return masters.admin_status.includes('active')
                })
                case 'Max цена': return this.arr_masters.sort((d1, d2) => {
                    if(d1.min_cena < d2.min_cena) return 1;
                    if(d1.min_cena > d2.min_cena) return -1;
                    return 0;
                })
                case 'Min цена': return this.arr_masters.sort((d1, d2) => {
                    if(d1.min_cena > d2.min_cena) return 1;
                    if(d1.min_cena < d2.min_cena) return -1;
                    return 0;
                })
                case 'А -> Я': return this.arr_masters.sort((d1, d2) => {
                    if(d1.name > d2.name) return 1;
                    if(d1.name < d2.name) return -1;
                    return 0;
                })
                case 'Я -> А': return this.arr_masters.sort((d1, d2) => {
                    if(d1.name < d2.name) return 1;
                    if(d1.name > d2.name) return -1;
                    return 0;
                })
            }
            }
    },
    methods: {
        all() {
            axios.get('api/admin/masters', {
                headers: {
                    "Authorization": "Bearer " + this.token,
                    'Accept': 'application/json',
                    'Content-type': 'application/json',
                }
            }).then(response => {
                this.arr_masters = response.data.content;
                console.log(response.data.content)
            }).catch(response => { console.log(response) })

        },
        ban(id) {
            axios.post(`/api/admin/masters/${id}/update`, id, {
                headers: {
                    "Authorization": "Bearer " + this.token,
                    'Accept': 'application/json',
                    'Content-type': 'application/json',
                }
            }).then(response => {
                this.all()
                console.log(response)
            }).catch(response => {
                console.log(response)
            })
        }

    }
}
</script>