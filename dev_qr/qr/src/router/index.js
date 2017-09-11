import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const Login = (resolve) => {
  import('../components/Login/Login').then((module) => {
    resolve(module)
  })
}
const Leader = (resolve) => {
  import('../components/Leader/Leader').then((module) => {
    resolve(module)
  })
}

const Teacher = (resolve) => {
  import('../components/Teacher/Teacher').then((module) => {
    resolve(module)
  })
}

const Student = (resolve) => {
  import('../components/Student/Student').then((module) => {
    resolve(module)
  })
}

export default new Router({
  routes: [{
    path: '/',
    redirect: 'login'
  },
  {
    path: '/login',
    component: Login
  },
  {
    path: '/leader',
    component: Leader,
    meta: {
      requireAuth: true // 添加该字段，表示进入这个路由是需要登录的
    }
  },
  {
    path: '/teacher',
    component: Teacher
  },
  {
    path: '/student',
    component: Student
  }
  ]
})
