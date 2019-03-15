<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

<title>二维码签到系统</title>
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
		<form action="${CTX_PATH}/servlet/UserLoginServlet" method="post">
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
							<input class="" name="sf" type="radio" value="gly" checked="checked"/>&nbsp&nbsp管理员&nbsp&nbsp&nbsp&nbsp  
							<input class="" name="sf" type="radio" value="ls" />&nbsp&nbsp老师	
						</td>
					</tr>
					<!--忘记密码功能暂时不做
					 <tr>
						<td colspan="2" align="right">
							<a href="javascript:void(0)" onclick="change('#table1','#table2')">忘记密码</a>
						</td>
					</tr> 
					  -->
					<tr>
						<td colspan="2" align="center">
							<input class="btn btn-info btn-block" type="submit" value="立即登录" />
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
							<input type="button" onclick="next_step()" class="btn btn-info" value="下一步" />
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

<script type="text/javascript">
$(function(){
	//时间函数
	startTime();
})
function change(selector1,selector2){
	$(selector1).css({
		"display":"none"
	});
	$(selector2).css({
		"display":"table"
	});
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