<template>
  <div class="login">
    <form>
      <el-input v-model="phoneNum" name="phoneNum" type="text" placeholder="">

      </el-input>
      <br>
      <br>
      <el-input v-model="passWord" name="passWord" type="password" placeholder="">

      </el-input>
      <br>
      <br>
      <el-button type="button" @click="Login">登录</el-button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      phoneNum: '',
      passWord: ''
    }
  },
  methods: {
    Login() {
      var num = this.phoneNum
      var pass = this.passWord
      this.$http.post('/api/user/UserLogin', {
        num: num,
        pass: pass
      }, {}).then((response) => {
        console.log(response)
      })
    }
  }
}
</script>


<style scoped lang="stylus" rel="stylesheet/stylus">
.login{
  margin:0 auto;
  width:400px;
  padding:40px 0px;
  text-align :center
}
.login button{
  width:100%;
}
</style>
