//login
//时间函数
//window.onload = function(){
//	startTime();
//}
$(function(){
	startTime();
})
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

function change(selector1,selector2){
	
		$(selector1).css({
			"display":"none"
		});
		$(selector2).css({
			"display":"table"
		});
	
	
}


//teacher

//为班级考勤和设置链接增加点击事件的处理
$("#a_kq").click(function(){
	
	$(".col-lg-3").find(".active").removeClass("active");
	
	$(this).addClass("active");
	
	$("#div_set").fadeOut(500,function(){
		$("#div_qd").fadeIn(500);//显示设置区域
	});
	
	
	
});

$("#a_set").click(function(){
	
	//先去处已经获得焦点的标签的样式
	//$(".active")表示获取拥有active样式的元素对象
	//removeclass意思是移除这个对象的active样式
	$(".col-lg-3").find(".active").removeClass("active");
	//this代表当前
	//this是指向当前正在使用的那个对象的一个引用
	$(this).addClass("active");
	
	$("#div_qd").fadeOut(500,function(){
		$("#div_set").fadeIn(500);//显示设置区域
	});
	
});


		
//leader
//将右侧的两个内容隐藏起来
$(".col-lg-9").children("div:gt(0)").hide();

//希望为左侧的所有的链接增加一个点击的事件
$(".list-group").children("a").click(function() {
	//把之前设置了 选中样式的a的 选中效果去处
	$(".list-group").find(".active").removeClass("active");
	//然后当前点击的是哪一个a就为a增加选中的样式
	$(this).addClass("active");
	//获取当前左侧a的下标值
	var aindex = $(this).index();
	//对应的获取到右侧的div并且显示出来
	$(".col-lg-9").children(":visible").fadeOut(500, function() {
		$(".col-lg-9").children(":eq(" + aindex + ")").fadeIn(500);
	});
});


function addTeacherJob(){
	
	//首先拷贝
	var addtj = $(".addteacherjob:first").clone();
	
	//然后将拷贝的内容再次放入 添加老师工作的区域
	$(".panel-body").append(addtj);
}
$(".table-add-teacher").on("click","input[name='sub']",function(event){
    if($(".addteacherjob").length<2)
    {
    	return;
    }
    else{
    	$(event.target).parents("table").remove();
    }
	//console.log($(".addteacherjob").length);
})


function showAddTeacher(){
	
	$("#teacher_show").fadeOut(500,function(){
		$("#teacher_add").fadeIn(500);
	});
}

function saveTeacher(){
	dhtmlx.message({
		text:"添加老师信息成功"
	});
	$("#teacher_add").fadeOut(500,function(){
		$("#teacher_show").fadeIn(500);
	});
}

/*studentPhone.jsp */
function showHomePage(div_id){
	$("#"+div_id).fadeOut(100,function(){
		$("#btnDiv").fadeIn(500); 
	});
	
	
}

//为按钮增加点击的事件处理
$("#btn1").click(function() {
	$("#btnDiv").fadeOut(500, function() {
		$("#div_qd").fadeIn(500,function(){
			alert('您还未登陆，请先登陆');
			alert('程序模拟已经登陆的情况');
			
		});
	});

});

$("#btn2").click(function() {
	$("#btnDiv").fadeOut(500, function() {
		$("#div_sqqj").fadeIn(500);
	});
});

$("#btn3").click(function() {
	$("#btnDiv").fadeOut(500, function() {
		$("#div_ckkq").fadeIn(500);
	});
});

$("#btn4").click(function() {
	$("#btnDiv").fadeOut(500, function() {
		$("#div_xgxx").fadeIn(500);
	});
});

function sendQJMessage() {

	alert('提交成功');
	$("#div_sqqj").fadeOut(500, function() {
		$("#btnDiv").fadeIn(500);
	});

}
