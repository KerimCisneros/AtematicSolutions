<template>
  <v-app>
    <VideoDialog/>
    <app-header @update-header-height="updateHeaderHeight"></app-header>
    <router-view :style="{ 'margin-top': headerHeight }">
    </router-view>
    <!-- <v-dialog :model-value="showDialog" persistent="">
      <template v-slot:activator="{ on, attrs }">
        <v-btn v-bind="attrs" v-on="on">Open Dialog</v-btn>
      </template>
      <video width="500" controls autoplay>
        <source src="tu_video.mp4" type="video/mp4">
        Tu navegador no soporta videos.
      </video>
      <v-btn @click="showDialog = false">Cerrar</v-btn>
    </v-dialog> -->

  </v-app>
</template>
<script>
import VideoDialog from "@/components/Video.vue";
import AppHeader from '@/components/AppHeader.vue'
export default {
  components: {
    AppHeader,
    VideoDialog 
  },
  data() {
    return {
      headerHeight: '0px'
    }
  },
  methods: {
    updateHeaderHeight(newHeight) {
      this.headerHeight = newHeight;
    }
  }
}
</script>
<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
