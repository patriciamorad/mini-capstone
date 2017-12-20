/* global axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  mounted: function() {},
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [{ path: "/", component: HomePage }],
  scrollBehavior(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#app",
  router: router
});

// productContainer.appendChild(template.content.cloneNode(true));
// productContainer.appendChild(template.content.cloneNode(true));
// productContainer.appendChild(template.content.cloneNode(true));
// productContainer.appendChild(template.content.cloneNode(true));
// productContainer.appendChild(template.content.cloneNode(true));
