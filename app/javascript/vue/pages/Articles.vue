<script>
import api from "../api";
import Modal from "../components/Modal.vue";
import ArticleForm from "../components/ArticleForm.vue";

export default {
  components: {
    Modal,
    ArticleForm,
  },
  data() {
    return {
      articles: [],
      modalVisible: false,
    };
  },
  async mounted() {
    const { data } = await api.get("articles");
    this.articles = data.articles;
  },
  methods: {
    processCreate(article) {
      this.articles.push(article);
      this.modalVisible = false;
    },
    async destroyArticle(article) {
      await api.delete(`articles/${article.id}`);
      alert("Article was deleted");
      this.articles.splice(this.articles.indexOf(article), 1);
    },
  },
};
</script>

<template>
  <div>
    <h1>Articles</h1>
    <table>
      <thead>
        <tr>
          <th>Article</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="article in articles" :key="article.id">
          <td>
            <a :href="`/articles/${article.id}`">{{ article.title }}</a>
          </td>
          <td>
            <button @click="destroyArticle(article)">Delete article</button>
          </td>
        </tr>
      </tbody>
    </table>
    <button @click="modalVisible = true">Add article</button>
    <Modal v-if="modalVisible" v-model:show="modalVisible">
      <ArticleForm @create="processCreate" />
    </Modal>
  </div>
</template>

<style scoped>
td {
  border: 1px solid gray;
  padding: 10px;
}
</style>
