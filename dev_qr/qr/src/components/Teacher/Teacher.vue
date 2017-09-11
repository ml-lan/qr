<template>
  <div>
    <el-row class="teacher_con">
      <h4>{{'欢迎：' + name}}</h4>
      <el-col :span="4">
        <el-menu default-active="1" class="el-menu-vertical-demo">
          <el-menu-item index="1">
            <i class="el-icon-menu"></i>班级管理
          </el-menu-item>

          <el-menu-item index="2">
            <i class="el-icon-setting"></i>系统设置
          </el-menu-item>
          <el-menu-item index="3" @click="logout">
            <i class="el-icon-setting"></i>用户注销
          </el-menu-item>
        </el-menu>
      </el-col>
      <el-col :span="18" style="float:right">
        <div style="display:none" ref='setting'>
          设置
        </div>
      </el-col>

    </el-row>
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

.teacher_con{
  width :960px;
  height :400px;
  margin :0 auto;
  padding :40px 0px;
}
</style>
