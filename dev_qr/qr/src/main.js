// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import Index from './index'
import router from './router'
import {
  Icon,
  Row,
  Col,
  Menu,
  Submenu,
  MenuItem,
  MenuItemGroup,
  Button,
  Input,
  Form,
  FormItem,
  Radio,
  RadioGroup,
  RadioButton,
  Tabs,
  TabPane,
  Message,
  Select,
  Option
} from 'element-ui'
import VueResource from 'vue-resource'

Vue.use(VueResource)
Vue.use(Icon)
Vue.use(Row)
Vue.use(Col)
Vue.use(Menu)
Vue.use(Submenu)
Vue.use(MenuItem)
Vue.use(MenuItemGroup)
Vue.use(Button)
Vue.use(Input)
Vue.use(Form)
Vue.use(FormItem)
Vue.use(Radio)
Vue.use(RadioGroup)
Vue.use(RadioButton)
Vue.use(Tabs)
Vue.use(TabPane)
Vue.use(Message)
Vue.use(Select)
Vue.use(Option)
Vue.prototype.$message = Message
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
