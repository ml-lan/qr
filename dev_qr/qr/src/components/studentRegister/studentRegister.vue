<template>
  <div>
    <div class="student_register">
      <el-form :model="form" label-width="100px">
        <el-form-item label="手机号码：" prop='phoneNum'>
          <el-input v-model="form.phoneNum" type="text" placeholder="">

          </el-input>
        </el-form-item>

        <el-form-item label="用户昵称：" prop='stuName'>
          <el-input v-model="form.stuName" type="text" placeholder="">

          </el-input>
        </el-form-item>

        <el-form-item label="用户性别：" prop="sex">
          <el-radio-group v-model="form.sex">
            <el-radio class="radio" label="男"></el-radio>
            <el-radio class="radio" label="女"></el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="用户密码：" prop='passWord'>
          <el-input v-model="form.passWord" type="password" placeholder="">

          </el-input>
        </el-form-item>
        <el-form-item label="重复密码：" prop='repassWord'>
          <el-input v-model="form.repassWord" type="password" placeholder="">

          </el-input>
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
        stuName: '',
        sex: '',
        repassWord: ''
      }
    }
  },
  methods: {
    Login() {
      var form = JSON.stringify(this.form)
      console.log(form)
    }
  },
  components: {
  }
}
</script>


<style scoped lang="stylus" rel="stylesheet/stylus">
.student_register{
  margin:0 auto;
  width:400px;
  padding:75px 0px;
  text-align :center
}
</style>
