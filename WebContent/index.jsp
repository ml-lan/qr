<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>二维码签到系统</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>css/dhtmlxmessage_dhx_skyblue.css">
<link rel="stylesheet" href="<%=basePath%>css/style.css">
<link rel="stylesheet" href="<%=basePath%>css/animate.min.css">
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">XAUT</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<span id="time_show"></span>
						</li>
					</ul>
				</div>	
		</div>
</nav>
<div class="jumbotron" style="margin-top: 50px;">
	<div class="container">
		<h1 class="animated fadeInDown ">高效办公 技术先行</h1>
		<p class="animated fadeInRightBig">西安理工大学二维码签到程序 登录入口</p>
	</div>
</div>

<div class="container" id="con_table">
	<div class="col-lg-4 col-sm-4 col-xs-4 col-lg-offset-4 col-sm-offset-4 col-xs-offset-4">
		<form action="<%=basePath%>servlet/UserLoginServlet" method="post">
				<table  id="table1" class="table table-bordered">
					<tr>
						<td style="vertical-align: middle;"> <span class="glyphicon glyphicon-user"> </span> 用户名</td>
						<td> <input class="form-control" type="text" name="sname" id="" value="" /></td>
					</tr>
					
					<tr>
						<td style="vertical-align: middle;"> <span class="glyphicon glyphicon-lock"> </span>  密码</td>
						<td><input class="form-control" type="password" name="spass"/></td>
					</tr>
					
					
					<tr>
						<td style="vertical-align: middle;"> <span class="glyphicon glyphicon-exclamation-sign"> </span> 身份</td>
						<td>
							<input class="" name="sf" type="radio" value="gly" checked="checked"/>管理员
							<input class="" name="sf" type="radio" value="ls" />老师	
						</td>
					</tr>
					 <tr>
						<td colspan="2" align="right">
							<a href="javascript:void(0)" onclick="change('#table1','#table2')">忘记密码</a>
						</td>
					</tr> 
					<tr>
						<td colspan="2" align="center">
							<input type="button" class="btn btn-info" value="二维码登录" />
							<input class="btn btn-danger btn-danger" type="submit" value="立即登录" />
						</td>
					</tr>
					
					 
				</table>
			</form>
				
				
				 <table  style="display: none;" id="table2" class="table table-bordered">
					<tr>
						<td style="vertical-align: middle;">手机号码：</td>
						<td><input class="form-control" type="text" id="txtPhone" /></td>
					</tr>
 			
					<tr>
						<td colspan="2" align="center">
							<input type="button" onclick="to3()" class="btn btn-info" value="下一步" />
						</td>
					</tr>
				</table>
				
				<table  style="display: none;"  id="table3" class="table">
					<tr>
						<td style="vertical-align: middle;">验证码：</td>
						<td><input class="form-control" type="text" name="" id="" value="" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" class="btn btn-info" onclick="change('#table3','#table4')" value="下一步" />
						</td>
					</tr>
				</table>
				
				<table style="display: none;" id="table4" class="table">
					<tr>
						<td style="vertical-align: middle;">新密码：</td>
						<td><input class="form-control" type="text" name="" id="pass1" value="" /></td>
					</tr>
					<tr>
						<td  style="vertical-align: middle;">重复密码：</td>
						<td  ><input class="form-control" type="text" name="" id="pass2" value="" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" class="btn btn-info" onclick="repassf()" value="完成" />
						</td>
					</tr>
				</table> 

	</div>
</div>


<footer>
<div>
<div class="container">
	<h4>理工大 曲江校区</h4>
	<p>Designed and built by <a href="#" target="_blank">@XAUT</a></p>	
 </div>
 </div> 
</footer>


<script type="text/javascript" src="<%=basePath%>js/jquery-1.12.3.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>js/dhtmlxmessage.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index.js"></script>
<script type="text/javascript">
function to3() {

	//需要校验用户数输入的手机号码是否ok
	var phoneval = $("#txtPhone").val();
	$.ajax({     
			     type : "POST", //提交方式
			     url : "<%=basePath%>servlet/GetPhoneRamdomNoServlet",//路径
			     data : {
			      "phoneno" : phoneval
			     },//数据，这里使用的是Json格式进行传输
			     success : function(result) {//返回数据根据结果进行相应的处理
 			      		//根据后台返回的结果 做相应的逻辑处理
						if(result=='01') {
							dhtmlx.message({
								type: "error",
								text: "请输入合法的手机号码",
								expire: 5000
							});
						}else if(result=='02'){
							dhtmlx.message({
								type: "error",
								text: "手机号码不存在请检查",
								expire: 5000
							});
						} else {
							dhtmlx.message({
								text: "验证码已经发送,请注意接收",
								expire: 3000
							});
 							$("#table2").fadeOut(500);
							$("#table3").fadeIn(500);
 						}
 			     }
		  }); 

}

//确认修改密码按钮的点击事件处理函数
		function repassf(){
		
			var phoneval = $("#txtPhone").val();
			//jquery简化ajax的发送
			//
			$.ajax({     
			     type : "POST", //提交方式
			     url : "<%=basePath%>servlet/RepassServlet",//路径
			     data : {
			      	"phoneno" : phoneval,
			       	"pass1"   : $("#pass1").val(),
			        "pass2"   : $("#pass2").val()
			     },
			     success : function(result) {//返回数据根据结果进行相应的处理
 			      		//根据后台返回的结果 做相应的逻辑处理
						if(result=='修改密码成功') {
							dhtmlx.message({
								text: result,
								expire: 3000
							});
							//返回到登陆的div上
							$("#table4").fadeOut(500);
							$("#table1").fadeIn(500);
							
						}else {
							dhtmlx.message({
								type: "error", 
								text: result,
								expire: 5000
							});
 						
 						}
 			     }
		    }); 
		    //============ajax end
		
		}
		
		
		var msg='<%=request.getAttribute("msg")%>';
		if(msg!='null'){//如果有消息
			dhtmlx.message({
				text: msg,   
				expire: 3000
			});
		}

</script>
</body>
</html>