<script setup>
useHead({
  link: [
    {
      rel: "stylesheet",
      href: "/vendor/simplebar/dist/simplebar.min.css",
      media: "screen",
    },
    {
      rel: "stylesheet",
      href: "/vendor/tiny-slider/dist/tiny-slider.css",
      media: "screen",
    },
    {
      rel: "stylesheet",
      href: "/vendor/drift-zoom/dist/drift-basic.min.css",
      media: "screen",
    },
    {
      rel: "stylesheet",
      href: "/vendor/lightgallery/css/lightgallery-bundle.min.css",
      media: "screen",
    },
    { rel: "stylesheet", href: "/css/theme.min.css", media: "screen" },
  ],
  script: [
    { src: "/vendor/bootstrap/dist/js/bootstrap.bundle.min.js", body: true },
    { src: "/vendor/simplebar/dist/simplebar.min.js", body: true },
    { src: "/vendor/tiny-slider/dist/min/tiny-slider.js", body: true },
    {
      src: "/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js",
      body: true,
    },
    { src: "/vendor/drift-zoom/dist/Drift.min.js", body: true },
    { src: "/vendor/lightgallery/lightgallery.min.js", body: true },
    { src: "/vendor/lightgallery/plugins/video/lg-video.min.js", body: true },
    { src: "/js/theme.min.js", body: true },
  ],
});
</script>

<template>
  <div class="handheld-toolbar-enabled">
    <!-- Sign in / sign up modal-->
    <SignInModal />
    <main class="page-wrapper">
      <!-- Quick View Modal-->
      <QuickViewModal />
      <!-- Navbar Electronic Store -->
      <Navbar />
      <slot />
    </main>
    <!-- Footer-->
    <Footer />
  </div>
</template>

<style scoped></style>
