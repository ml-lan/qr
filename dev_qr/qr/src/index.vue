<template>
  <div>
    <HeadNav/>
    <Login></Login>
  </div>
</template>

<script>
import HeadNav from './base/HeadNav/HeadNav'
import Login from './components/Login/Login'
export default {
  data() {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  },
  components: {
    HeadNav,
    Login
  }
}

</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
@import 'common/stylus/index';
</style>
