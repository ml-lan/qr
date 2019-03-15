/**
这个js文件主要写的是页面中公共的函数功能。
比如时间函数等等。
先写，然后再测试，影响性能的话，寻找另外一种方式解决。


最开始页面中直接书写js代码。当这个页面不是很复杂的时候，整个软件的功能也不是很复杂，按道理而言，减少请求数
确实优化性能。但是后面js代码逐渐增加。再次修改很是麻烦。决定重构。分离代码，以便后续的功能扩展和维护。
*/
//时间函数，调用函数。使html标签动态显示时间
function startTime()
{
	var date = new Date();
	var d=date.getDate();
	var mon=date.getMonth() + 1;
	var y=date.getFullYear();
	var h=date.getHours();
	var m=date.getMinutes();
	var s=date.getSeconds();
	m=checkTime(m)
	s=checkTime(s)
	$("#time_show").html(y+"年"+mon+"月"+d+"  "+h+":"+m+":"+s);
	t=setTimeout('startTime()',1000);//设定定时器，循环执行 
}

function checkTime(i)
{
	if (i<10) 
	{
	  	i="0" + i
	}
	return i
}


//导出excel函数




