<template>
  <div>
      <el-row :gutter="0">
      <div class="con">
        <el-col :xs="12" :sm="12" :md="12" :lg="12">
        <div class='logo'>
          <a href="#">XUT</a>
        </div>
        </el-col>
        <el-col :xs="12" :sm="12" :md="12" :lg="12">
        <div class="con_right">
          <ul>
            <li>
              <span>{{time}}</span>
            </li>
          </ul>
        </div>
        </el-col>
      </div>
      </el-row>
      <div class="clear"></div>
      <div class="jumbotron">

        <div class="jumbotron_con">
          <h1 class="">高效办公 技术先行</h1>
          <p class="">西安理工大学二维码签到程序 登录入口</p>
        </div>
      </div>
    
  </div>
</template>

<script>
import startTime from '../../common/js/time'
export default {
  data() {
    return {
      time: 0
    }
  },
  created() {
    var me = this
    setInterval(function() {
      me.TimeShow()
    }, 1000)
  },
  methods: {
    TimeShow() {
      this.time = startTime()
    }
  }
}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
@import '../../common/stylus/variable'
@import '../../common/stylus/index';
.clear{
  clear: both;
}
.con {
  width: 80%;
  height: 50px;
  margin: 0 auto;
  text-align :center
}
.logo{
  float :left;
  font-size : $font-size-large-x;
}
.con_right span{
  display: inline-block;
  float:right;
}

.jumbotron{
	text-shadow: 0px 1px 3px rgba(0, 0, 0, 0.4), 0px 0px 30px rgba(0, 0, 0, 0.075);
	background: linear-gradient(45deg, rgb(2, 0, 49) 0px, rgb(109, 51, 83) 100%) repeat scroll 0% 0% transparent;
	box-shadow: 0px 3px 7px rgba(0, 0, 0, 0.2) inset, 0px -3px 7px rgba(0, 0, 0, 0.2) inset;
	color: white;
}
.jumbotron .jumbotron_con{
  padding:50px 30px;
}
.jumbotron .jumbotron_con h1{
  font-size : 30px;
}
.jumbotron .jumbotron_con p{
  margin-top:20px;
}
</style>
