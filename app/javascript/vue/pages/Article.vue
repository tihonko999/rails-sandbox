<script>
import api from "../api";

export default {
  data() {
    return {
      article: null,
    };
  },
  async mounted() {
    const { data } = await api.get(`articles/${this.$route.params.id}`);
    this.article = data.article;
  },
};
</script>

<template>
  <div v-if="article">
    <h1>{{ article.title }}</h1>
    <p>{{ article.description }}</p>
  </div>
  <div v-else>Loading...</div>
</template>
