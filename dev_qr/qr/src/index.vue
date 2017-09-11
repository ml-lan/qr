<template>
  <div>
    <HeadNav/>
    <keep-alive>
      <router-view></router-view>
    </keep-alive>
    <FooterBoottom/>
  </div>
</template>

<script>
import Login from './components/Login/Login'
import HeadNav from './base/HeadNav/HeadNav'
import FooterBoottom from './base/FooterBoottom/FooterBoottom'
export default {
  data() {
    return {
    }
  },
  created() {
    console.log(this.cookie)
  },
  components: {
    Login,
    HeadNav,
    FooterBoottom
  }
}

</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
@import 'common/stylus/index';
</style>
