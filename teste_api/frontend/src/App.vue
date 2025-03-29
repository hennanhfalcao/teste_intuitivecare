<template>
  <div id="app" class="bg-light-green">
    <div class="container py-5">
      <div class="text-center mb-4">
        <i class="bi bi-database display-1 text-success"></i>
        <i class="bi bi-search ms-3 display-1 text-success"></i>
      </div>
      <BuscaOperadorasAtivas/>
    </div>
  </div>
</template>

<script>
import BuscaOperadorasAtivas from './components/BuscaOperadorasAtivas.vue'

export default {
  name: 'App',
  components: {
    BuscaOperadorasAtivas
  }
}
</script>

<style>
.bg-light-green {
  background-color: #e8f5e9;
  min-height: 100vh;
  padding: 20px;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}

* {
  transition: all 0.3s ease;
}
</style>
