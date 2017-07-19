<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>二维码签到系统学生手机端</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				    </button>
					<a class="navbar-brand" href="#">理工大</a>
				</div>

			
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="studentLogin.jsp"> <span class="glyphicon glyphicon-user"> </span> 登陆</a>
						</li><li>
							<a href="#"> <span class="glyphicon glyphicon-user"> </span> 帮助</a>
						</li>

					</ul>
				</div>
			
			</div>
		
</nav>
		


		<div class="jumbotron " style="margin-top: 50px;">
			<div class="container">
				
				<h1>二维码签到系统</h1>
				<p>好好学习 天天向上</p>
				<div align="right">
					<span class="badge">15</span>
				</div>
			</div>

		</div>

		
		<div class="container">
			<table class="table">
				<tr>
					<td style="vertical-align: middle;">手机号码:</td>
					<td>
						<input type="text" class="form-control" name="" id="" value="" />
					</td>
				</tr>
		
				<tr>
					<td style="vertical-align: middle;">登陆密码:</td>
					<td>
						<input type="password"  class="form-control" name="" id="" value="" />
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="checkbox" name="" id="" value="" />记住密码
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="button" name="" id="" onclick="window.location.href='studentAdd.jsp'" class="btn btn-success btn-block" value="录入信息" />
					
					</td>
					<td align="center">
						<input type="button" name="" id="" class="btn btn-danger btn-block" value="登录" />
					</td>
				</tr>
			</table>
		</div>
		 
<script type="text/javascript" src="js/jquery-1.12.3.min.js" ></script>
<script type="text/javascript" src="js/bootstrap.min.js" ></script>		 
</body>
</html>