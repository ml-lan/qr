<template>
  <div>
    <HeadNav/>
    <div class="login">
      <el-form label-width="100px">
        <el-form-item label="手机号码：">
          <el-input v-model="phoneNum" name="phoneNum" type="text" placeholder="">

          </el-input>
        </el-form-item>
        <br>
        <br>
        <el-form-item label="用户密码：">
          <el-input v-model="passWord" name="passWord" type="password" placeholder="">

          </el-input>
        </el-form-item>

        <br>
        <br>
        <el-form-item label="用户身份：" v-model="form.resource">
          <el-radio-group>
            <el-radio label="领导"></el-radio>
            <el-radio label="教师"></el-radio>
            <el-radio label="学生"></el-radio>
          </el-radio-group>
        </el-form-item>
        <br>
        <br>
        <el-button type="primary" @click="Login">登录</el-button>
        <el-button>取消</el-button>
      </el-form>
    </div>
    <Footer-boottom/>
  </div>
</template>

<script>
import HeadNav from '../../base/HeadNav/HeadNav'
import FooterBoottom from '../../base/FooterBoottom/FooterBoottom'
export default {
  data() {
    return {
      phoneNum: '',
      passWord: '',
      form: {
        resource: ''
      }
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
  },
  components: {
    HeadNav,
    FooterBoottom
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
