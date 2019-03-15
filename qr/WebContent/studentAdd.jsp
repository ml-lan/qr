<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>二维码签到系统学生手机端</title>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				    </button>
					<a class="navbar-brand" href="#">理工大</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="studentLogin.html"> <span class="glyphicon glyphicon-user"> </span> 登陆</a>
						</li><li>
							<a href="#"> <span class="glyphicon glyphicon-user"> </span> 帮助</a>
						</li>

					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
</nav>
		


<div class="jumbotron " style="margin-top: 50px;">
			<div class="container">
				<!--二维码签到程序 二维码签到系统 二维码签到软件 -->
				<h1>二维码签到系统</h1>
				<p>好好学习 天天向上</p>
				<div align="right">
					<span class="badge">15</span>
				</div>
			</div>

</div>

		
<div class="container">
	<table class="table table-bordered">
				<tr>
					<td>手机号码:</td>
				</tr>
				<tr>
					<td>
						<input type="text" class="form-control" name="sphone" id="sphone" value="" />
					</td>
				</tr>
				
				<tr>
					<td>姓名:</td>
				</tr>
				<tr>
					<td>
						<input type="text" class="form-control" name="sname" id="sname" value="" />
					</td>
				</tr>
				
				<tr>
					<td>性别:</td>
				</tr>
				<tr>
					<td>
						<input type="radio"  name="ssex" id="ssex" value="1"  checked="checked"/>男
						<input type="radio"  name="ssex" id="" value="0" />女
					</td>
				</tr>
				
				 
				
				<tr>
					<td>登陆密码:</td>
				</tr>
				<tr>
					<td>
						<input type="password"  class="form-control" name="spass" id="spass" value="" />
					</td>
				</tr>
				<tr>
					<td>重复密码:</td>
				</tr>
				<tr>
					<td>
						<input type="password"  class="form-control" name="srpass" id="srpass" value="" />
					</td>
				</tr>
				 
				<tr>
					<td align="center">
						<input type="button" name="" id="btnSave"  class="btn btn-success" value="录入信息" />
 					</td>
				</tr>
			</table>
</div>

</body>
<script type="text/javascript">

//添加学生信息
$("#btnSave").click(function(){
	//取值
	var sphone=$("#sphone").val();
	var sname=$("#sname").val();
 
	var spass=$("#spass").val();
	var srpass=$("#srpass").val();
	//判断
	if(sphone==''){
		alert('电话号码为必填项');
		return ;
	}
	if(sname==''){
		alert('姓名为必填项');
		return ;
	}
 
	if(spass==''){
		alert('密码为必填项');
		return ;
	}
	if(srpass==''){
		alert('重复密码为必填项');
		return ;
	}
	
	if(srpass!=spass){
		alert('两次密码不一致');
		return ;
	}
	
	var ssex= 1;
	
	if($("#ssex").attr("checked") !='checked' ){
		ssex = 0;
	}
	
	
	//发送ajax
	
	$.ajax({      
	     type : "POST", //提交方式
	     url : "${CTX_PATH}/servlet/AddStudentServlet",//路径
	       
	     data:{
	     	"sphone":sphone,
	     	"sname":sname,
	     	"ssex":ssex,
	     	"spass":spass,
	     	"srpass":srpass,
	     },
	     success : function(result) {//返回数据根据结果进行相应的处理 
		      	 
		      	 if(result=='录入信息成功了'){     
		      	 	 window.location.href='studentLogin.jsp';
		      	 }
		     }
    }); 
	
});
</script>
</html>