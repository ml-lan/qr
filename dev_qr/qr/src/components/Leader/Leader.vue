<template>
  <div>
    <el-row class="leader_con">
      <h4>{{'欢迎：' + name}}</h4>
      <el-col :span="4">
        <el-menu default-active="1" class="el-menu-vertical-demo">
          <el-menu-item index="1" @click="changeTabs">
            <i class="el-icon-menu"></i>学生统计
          </el-menu-item>
          <el-menu-item index="2" @click="changeTabs">
            <i class="el-icon-menu"></i>教师管理
          </el-menu-item>
          <el-menu-item index="3" @click="changeTabs">
            <i class="el-icon-setting"></i>系统设置
          </el-menu-item>
          <el-menu-item index="4" @click="logout">
            <i class="el-icon-setting"></i>用户注销
          </el-menu-item>
        </el-menu>
      </el-col>
      <el-col :span="18" style="float:right">
        <div ref="count" style="display:block">
          <el-tabs type="border-card">

            <img src="../../common/img/chart.jpg" width="200px" />

          </el-tabs>
        </div>
        <div style="display:none" ref='manage'>
          <el-tabs type="border-card">
            <el-tab-pane label="教师管理">教师管理</el-tab-pane>
            <el-tab-pane label="出勤记录">出勤记录</el-tab-pane>
          </el-tabs>
        </div>
        <div style="display:none" ref='setting'>
          <el-tabs type="border-card">
            <el-tab-pane label="专业班级">专业班级</el-tab-pane>
            <el-tab-pane label="上课时段">上课时段</el-tab-pane>
          </el-tabs>
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
    changeTabs(e) {
      var index = parseInt(e._props.index)
      if (index === 1) {
        this.$refs.count.style.display = 'block'
        this.$refs.manage.style.display = 'none'
        this.$refs.setting.style.display = 'none'
      } else if (index === 2) {
        this.$refs.count.style.display = 'none'
        this.$refs.manage.style.display = 'block'
        this.$refs.setting.style.display = 'none'
      } else if (index === 3) {
        this.$refs.count.style.display = 'none'
        this.$refs.manage.style.display = 'none'
        this.$refs.setting.style.display = 'block'
      }
    },
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

.leader_con{
  width :960px;
  height :400px;
  margin :0 auto;
  padding :40px 0px;
}
</style>
