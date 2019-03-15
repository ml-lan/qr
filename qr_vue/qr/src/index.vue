<template>
  <div>
    <keep-alive>
      <router-view></router-view>
    </keep-alive>
  </div>
</template>

<script>
import Login from './components/Login/Login'
export default {
  data() {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  },
  components: {
    Login
  }
}

</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
@import 'common/stylus/index';
</style>
