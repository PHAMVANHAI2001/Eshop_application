// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: ["@vueuse/nuxt", "nuxt-icon"],
  css: ["~/assets/scss/main.scss"],
});
