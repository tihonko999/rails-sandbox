<script>
import api from "../api";

export default {
  data() {
    return {
      article: null,
    };
  },
  mounted() {
    this.article = {
      title: "",
      description: "",
    };
  },
  methods: {
    async create() {
      const { data } = await api.post(`articles`, { article: this.article });
      alert("article was created");
      this.$emit("create", data.article);
    },
  },
};
</script>

<template>
  <form v-if="article" @submit.prevent="create">
    <h2>Article</h2>
    <input placeholder="Enter title" required v-model="article.title" />
    <input
      placeholder="Enter description"
      required
      v-model="article.description"
    />
    <button>Submit</button>
  </form>
</template>

<style scoped>
input {
  display: block;
  margin: 20px 0;
}
</style>
