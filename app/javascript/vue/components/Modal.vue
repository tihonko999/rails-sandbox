<script>
export default {
  props: {
    show: { type: Boolean, default: false },
  },
};
</script>

<template>
  <div class="modal">
    <div class="content">
      <button class="button" @click="$emit('update:show')">Close</button>
      <slot />
    </div>
  </div>
</template>

<style scoped>
.modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 10;
  align-items: center;
  justify-content: center;
  display: flex;
  background: rgba(0, 0, 0, 0.5);
  overflow: auto;
}
.content {
  position: relative;
  background: white;
  padding: 20px;
  width: 800px;
}
.button {
  position: absolute;
  right: 15px;
  top: 15px;
}
</style>
