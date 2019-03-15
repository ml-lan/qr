// sql语句
var sqlMap = {
  // 用户
  user: {
      add: 'select * from account where sphone = ? and spass = ?'
  }
}

module.exports = sqlMap;