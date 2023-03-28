<template>
    <v-footer class="d-flex flex-column" color="light-green lighten-1">
        <v-container class="d-flex flex-column flex-sm-row flex-md-row flex-lg-row flex-xl-row align-center justify-space-between px-4">
          <div class="uk-width-4-5 uk-width-2-5@s uk-width-2-5@m uk-width-1-5@l d-flex justify-space-around">
              <v-btn icon>
                  <v-icon large>mdi-facebook</v-icon>
              </v-btn>
              <v-btn icon>
                  <v-icon large>mdi-twitter</v-icon>
              </v-btn>
              <v-btn icon>
                  <v-icon large>mdi-linkedin</v-icon>
              </v-btn>
              <v-btn icon>
                  <v-icon large>mdi-instagram</v-icon>
              </v-btn>
          </div>
          <div class="px-4 py-2 text-center d-none d-sm-block d-md-block d-lg-block d-xl-block">
            2022 — <strong>Liss_V</strong>
          </div>
        </v-container>
    </v-footer>
  </template>

<script>
export default {
    name: 'v-Footer',
    data: () => ({
      icons: [
        'mdi-facebook',
        'mdi-twitter',
        'mdi-linkedin',
        'mdi-instagram',
      ],
    }),
}
</script>