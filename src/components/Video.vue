<template>
    <v-dialog height="500" width="700" v-model="showDialog" persistent>
      <template v-slot:activator="{ on, attrs }">
        <v-btn v-bind="attrs" v-on="on">Open Dialog</v-btn>
      </template>
      <video controls autoplay>
        <source src="/Video/TutorialVideo.mp4" type="video/mp4">
        Tu navegador no soporta videos.
      </video>
      <v-btn @click="showDialog = false">Cerrar</v-btn>
    </v-dialog>
  </template>
  
  <script>
  export default {
    data: () => ({
      showDialog: true
    })
  }
  </script>
  