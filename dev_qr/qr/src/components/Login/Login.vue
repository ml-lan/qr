<template>
  <div>
    <div class="login">
      <el-form :model="form" :label-position="labelPosition" ref="form" :rules="rules" label-width="100px">
        <el-form-item label="手机号码：" prop='phoneNum'>
          <el-input v-model.number="form.phoneNum" type="text" placeholder="">

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

        <el-button type="primary" @click="Login('form')">登录</el-button>
        <el-button @click="reset('form')">取消</el-button>
      </el-form>
    </div>
  </div>
</template>

<script>

export default {
  data() {
    var checkPhoneNum = (rule, value, callback) => {
      if (!value) {
        return callback(new Error('手机号码不能为空'))
      }
      setTimeout(() => {
        if (!Number.isInteger(value)) {
          callback(new Error('请输入数字类型值'))
        } else {
          if (value.toString().length !== 11) {
            callback(new Error('手机号码长度错误'))
          } else {
            callback()
          }
        }
      }, 1000)
    }
    return {
      labelPosition: 'right',
      form: {
        phoneNum: '',
        passWord: '',
        identity: ''
      },
      rules: {
        phoneNum: [
          {
            validator: checkPhoneNum,
            trigger: 'blur'
          }
        ],
        passWord: [
          {
            required: true,
            message: '请输入密码',
            trigger: 'blur'
          }
        ],
        identity: [
          {
            required: true,
            message: '请选择登录身份',
            trigger: 'change'
          }
        ]
      }
    }
  },
  methods: {
    Login(form) {
      var num = this.form.phoneNum
      var pass = this.form.passWord
      var identity = this.form.identity
      console.log(num + ':' + pass + ':' + identity)
      this.$refs[form].validate((valid) => {
        if (valid) {
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
          console.log('submit!')
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    reset(form) {
      this.$refs[form].resetFields()
    }
  },
  components: {
  }
}
</script>


<style scoped lang="stylus" rel="stylesheet/stylus">
.login
  margin:0 auto;
  width:400px;
  padding:75px 0px;
  text-align :center
@media only screen and (min-width: 300px)
  .login
    width: 80%
</style>
