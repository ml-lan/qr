// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import Index from './index'
import router from './router'
import {
  Button,
  Input
} from 'element-ui'
import VueResource from 'vue-resource'

Vue.use(VueResource)
Vue.use(Button)
Vue.use(Input)
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<Index/>',
  components: {
    Index
  }
})
