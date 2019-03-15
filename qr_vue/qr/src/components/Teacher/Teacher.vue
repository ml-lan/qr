<template>
  <div>
    <HeadNav/>
    <el-row class="teacher_con">
      <el-col :span="4">
        <el-menu default-active="1" class="el-menu-vertical-demo">
          <el-menu-item index="1">
            <i class="el-icon-menu"></i>班级管理
          </el-menu-item>
          
          <el-menu-item index="2" @click="changeTabs">
            <i class="el-icon-setting"></i>设置
          </el-menu-item>
        </el-menu>
      </el-col>
      <el-col :span="18" style="float:right">
        <div style="display:none" ref='setting'>
         设置
        </div>
      </el-col>

    </el-row>

    <Footer-boottom/>
  </div>
</template>

<script>
import HeadNav from '../../base/HeadNav/HeadNav'
import FooterBoottom from '../../base/FooterBoottom/FooterBoottom'
export default {
  data() {
    return {
    }
  },
  methods: {
  },
  components: {
    HeadNav,
    FooterBoottom
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
