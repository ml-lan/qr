// sql语句
var sqlMap = {
  // 用户
  leader: {
    query: 'select * from account where sphone = ? and spass = ?'
  },
  teacher: {
    query: 'select * from teacher where tphone = ? and tpassword = ?'
  },
  student: {
    query: 'select * from studnet where sphone = ? and spassword = ?'
  }
}

module.exports = sqlMap;