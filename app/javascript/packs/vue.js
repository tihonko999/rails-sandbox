import { createApp } from "vue";
import { createRouter, createWebHistory } from "vue-router";
import App from "../vue/App";

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: "/", component: () => import("../vue/pages/Index") },
    { path: "/articles", component: () => import("../vue/pages/Articles") },
    { path: "/articles/:id", component: () => import("../vue/pages/Article") },
  ],
});

document.addEventListener("DOMContentLoaded", () => {
  const appElement = document.getElementById("vueApp");
  if (appElement) {
    createApp(App).use(router).mount(appElement);
  }
});
