<template>
  <div>
    <h4>{{'欢迎：' + name}}</h4>
    <el-button type="primary" @click="logout">用户注销</el-button>
  </div>
</template>

<script>
import { getCookie, delCookie } from '../../common/js/cookie'
export default {
  data() {
    return {
      name: ''
    }
  },
  mounted() {
    let phoneNum = getCookie('username')
    this.name = phoneNum
    if (phoneNum === '') {
      this.$router.push('/')
    }
  },
  methods: {
    logout() {
      delCookie('username')
      this.$router.push('/')
    }
  },
  components: {

  }
}
</script>


<style scoped lang="stylus" rel="stylesheet/stylus">

.student_con{
  width :960px;
  height :400px;
  margin :0 auto;
  padding :40px 0px;
}
</style>
