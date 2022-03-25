import axios from "axios";

const api = axios.create({
  baseURL: "/",
  headers: {
    Accept: "application/json",
    "Content-Type": "application/json",
    // Update, Create, Delete operations require csrf token
    "X-CSRF-TOKEN": document
      .querySelector('[name="csrf-token"]')
      .getAttribute("content"),
  },
});

// for debugging
window.api = api;

export default api;
