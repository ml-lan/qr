export default function startTime(selector) {
  var date = new Date()
  var d = date.getDate()
  var mon = date.getMonth() + 1
  var y = date.getFullYear()
  var h = date.getHours()
  var m = date.getMinutes()
  var s = date.getSeconds()
  h = checkTime(h)
  m = checkTime(m)
  s = checkTime(s)
  var result
  result = y + '年' + mon + '月' + d + '日  ' + h + ':' + m + ':' + s
  return result
}

function checkTime(i) {
  if (i < 10) {
    i = '0' + i
  }
  return i
}
