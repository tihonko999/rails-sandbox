<template>
  <div class="app">
    <div class="header">Vue App header</div>
    <div class="page">
      <router-view :key="$route.fullPath"></router-view>
    </div>
  </div>
</template>

<style scoped>
.app {
  padding: 20px;
  margin: 20px;
  border: 3px solid rebeccapurple;
}
.page {
  padding: 20px;
  margin: 20px;
  border: 3px solid maroon;
}
.header {
  padding: 20px;
  margin: 20px;
  border: 3px solid skyblue;
}
</style>
