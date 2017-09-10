<template>
  <div>
    <div class="login">
      <el-form :model="form" label-width="100px">
        <el-form-item label="手机号码：" prop='phoneNum'>
          <el-input v-model="form.phoneNum" type="text" placeholder="">

          </el-input>
        </el-form-item>

        <el-form-item label="用户密码：" prop='passWord'>
          <el-input v-model="form.passWord" type="password" placeholder="">

          </el-input>
        </el-form-item>

        <el-form-item label="用户身份：" prop="identity">
          <el-radio-group v-model="form.identity">
            <el-radio class="radio" label="领导"></el-radio>
            <el-radio class="radio" label="教师"></el-radio>
            <el-radio class="radio" label="学生"></el-radio>
          </el-radio-group>
        </el-form-item>

        <el-button type="primary" @click="Login">登录</el-button>
        <el-button>取消</el-button>
      </el-form>
    </div>
  </div>
</template>

<script>

export default {
  data() {
    return {
      form: {
        phoneNum: '',
        passWord: '',
        identity: ''
      }
    }
  },
  methods: {
    Login() {
      var num = this.form.phoneNum
      var pass = this.form.passWord
      var identity = this.form.identity
      console.log(identity)
      if (identity === '领导') {
        this.$http.post('/api/user/leaderLogin', {
          num: num,
          pass: pass
        }, {}).then((response) => {
          console.log(response)
          if (response.data.length === 1) {
            this.$router.push({
              path: `/leader`
            })
          }
        })
      } else if (identity === '教师') {
        this.$http.post('/api/user/teacherLogin', {
          num: num,
          pass: pass
        }, {}).then((response) => {
          console.log(response)
          if (response.data.length === 1) {
            this.$router.push({
              path: `/teacher`
            })
          }
        })
      } else {
        this.$http.post('/api/user/studentLogin', {
          num: num,
          pass: pass
        }, {}).then((response) => {
          console.log(response)
          if (response.data.length === 1) {
            this.$router.push({
              path: `/student`
            })
          }
        })
      }
    }
  },
  components: {
  }
}
</script>


<style scoped lang="stylus" rel="stylesheet/stylus">
.login{
  margin:0 auto;
  width:400px;
  padding:75px 0px;
  text-align :center
}
</style>
