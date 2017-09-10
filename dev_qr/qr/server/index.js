// node 后端服务器

const leaderLogin = require('./api/leaderLogin');
const teacherLogin = require('./api/teacherLogin');
const studentLogin = require('./api/studentLogin');
const fs = require('fs');
const path = require('path');
const bodyParser = require('body-parser');
const express = require('express');
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: false
}));

// 后端api路由
app.use('/api/user', leaderLogin);
app.use('/api/user', teacherLogin);
app.use('/api/user', studentLogin);
// 监听端口
app.listen(3000);
console.log('success listen at port:3000......');
