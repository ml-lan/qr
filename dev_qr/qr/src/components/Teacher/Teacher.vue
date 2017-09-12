<template>
  <div>
    <el-row class="teacher_con">
      <h4>{{'欢迎：' + tid}}</h4>
      <el-col :span="4">
        <el-menu default-active="1" class="el-menu-vertical-demo">
          <el-menu-item index="1" @click="classinfo">
            <i class="el-icon-menu"></i>班级管理
          </el-menu-item>

          <el-menu-item index="2" @click="changeTabs">
            <i class="el-icon-setting"></i>系统设置
          </el-menu-item>
          <el-menu-item index="3" @click="logout">
            <i class="el-icon-setting"></i>用户注销
          </el-menu-item>
        </el-menu>
      </el-col>
      <el-col :span="18" style="float:right">
        <div ref="count" style="display:block">
          <el-tabs type="border-card">
            <el-tab-pane label="扫码签到">

              <el-select v-model="listVaule" placeholder="请选择">
                <el-option v-for="item in list" :key="item.value" :label="item.label" :value="item.value">
                </el-option>
              </el-select>
              <div class="qr_img">
                <svg>
                  <g id="qrcode" />
                </svg>
              </div>

            </el-tab-pane>
            <el-tab-pane label="出勤记录">出勤记录</el-tab-pane>
          </el-tabs>
        </div>
        <div style="display:none" ref='manage'>
          <el-input placeholder="待访问地址" v-model="qrURL">
            <template slot="prepend">Http://</template>
          </el-input>
          <div class="select">
            <el-select v-model="value" placeholder="请选择">
              <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value">
              </el-option>
            </el-select>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import QRCode from '../../common/js/qrcode'
import { getCookie, delCookie } from '../../common/js/cookie'
export default {
  data() {
    return {
      name: '',
      tid: '',
      classid: '',
      list: [],
      listVaule: '',
      qrURL: `http://mzl0101.com`,
      options: [{
        value: '08:00',
        label: '08:00'
      }, {
        value: '10:00',
        label: '10:00'
      }, {
        value: '14:00',
        label: '14:00'
      }, {
        value: '16:00',
        label: '16:00'
      }, {
        value: '19:00',
        label: '19:00'
      }],
      value: ''
    }
  },
  mounted() {
    let phoneNum = getCookie('username')
    this.name = phoneNum
    if (phoneNum === '') {
      this.$router.push('/')
    }
  },
  created() {
    this.tid = localStorage.getItem('userinfo')
  },
  methods: {
    classinfo() {
      let data = {
        'id': this.tid
      }
      this.$http.post('/api/class/teacherClass', data).then((response) => {
        console.log(response)
        if (response.data.length === 1) {
          var listObj = {}
          for (let i = 0; i < response.data.length; i++) {
            listObj.label = response.data[i].dnjname + '级' + response.data[i].dzyname + '专业' + response.data[i].dbjname + '班级'
            listObj.value = response.data[i].dnjname + '级' + response.data[i].dzyname + '专业' + response.data[i].dbjname + '班级'
            this.list.push(listObj)
          }
          this.createQr()
        }
      })
      this.$refs.count.style.display = 'block'
      this.$refs.manage.style.display = 'none'
    },
    changeTabs(e) {
      var index = parseInt(e._props.index)
      if (index === 2) {
        this.$refs.count.style.display = 'none'
        this.$refs.manage.style.display = 'block'
      }
    },
    // 创建二维码图片
    createQr() {
      const qrcode = new QRCode(document.getElementById('qrcode'), {
        width: 100,
        height: 100,
        useSVG: true
      })
      qrcode.makeCode(this.qrURL)
    },
    logout() {
      delCookie('username')
      localStorage.removeItem('userinfo')
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
.select {
  margin-top: 20px;
}
</style>
