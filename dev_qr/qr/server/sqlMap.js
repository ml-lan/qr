// sql语句
var sqlMap = {
  // 用户
  leader: {
    query: 'select * from account where sphone = ? and spass = ?'
  },
  teacher: {
    query: 'select * from teacher where tphone = ? and tpassword = ?',
    class: 'select d.did , d.dnjname,d.dzyname,d.dbjname from teacher t,dictionary d,teacherclass  tc where t.tid = ? and tc.dictionaryid = d.did and tc.teacherid = t.tid'
  },
  student: {
    query: 'select * from student where sphone = ? and spassword = ?'
  }
}

module.exports = sqlMap;
