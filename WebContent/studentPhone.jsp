<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>二维码签到系统学生手机端</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
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
					<span class="badge">0</span>
				</div>
			</div>

		</div>

		<div id="btnDiv"> 
			<div class="container">
				<input type="button" id="btn1" class="btn btn-block btn-lg btn-danger" value="签到" />
				<input type="button" class="btn btn-block btn-primary btn-lg" id="btn2" value="申请请假" />
				<input type="button" class="btn btn-block btn-success btn-lg" id="btn3" value="查看考勤" />
				<input type="button" class="btn btn-block btn-warning btn-lg" onclick="alert('此功能看时间而定')" id="btn4" value="修改信息" />
			</div>
		</div>
		<!--内容区域div  开始-------------------------------------->

		<div id="div_qd" style="display: none;">
			
			<div class="container">
				
				<h2>授课老师：谢逊</h2>
				<h4>课程：微机原理</h4>
				<div align="center">
					
					<img src="img/dui.jpg" />
					
				</div>
				<br />
				<input type="button" name="" class="btn btn-danger btn-block" id="" value="返回主菜单" onclick="showHomePage('div_qd')" />
				
				<div style="margin-top: 55px;"></div>
				
			</div>
			
		</div>

		<div id="div_sqqj" style="display: none;">
			<table class="table table-striped">
				<tr>
					<td>请假时间</td>
				</tr>
				<tr>
					<td><input type="text" class="form-control" value="2017-07-19" /></td>
				</tr>

				<tr>
					<td>事由</td>
				</tr>
				<tr>
					<td>
						<input type="radio" value="b" checked="checked" name="sy" />病假
						<input type="radio" value="s" name="sy" />事假
					</td>

				</tr>
				<tr>
					<td>备注 </td>
				</tr>

				<tr>
					<td>
						<textarea name="3" rows="3" cols="" class="form-control"></textarea>
					</td>
				</tr>

				<tr>
					<td>
						<input type="button" class="btn btn-danger btn-block" name="" id="" onclick="sendQJMessage()" value="确认申请" />
					</td>
				</tr>

			</table>
		</div>

		<div id="div_ckkq" style="display: none;">
			
			<div class="container">
				
				<table class="table table-striped">
					<tr>
						<td>日期</td>
						<td>课程</td>
						<td>考勤状态</td>
					</tr>
					<tr>
						<td>2017-07-15</td>
						<td>微机原理</td>
						<td>正常</td>
					</tr>
					
					<tr>
						<td>2017-07-15</td>
						<td>微机原理</td>
						<td><span class="label label-danger">缺勤</span></td>
					</tr>
					
					<tr>
						<td>2017-07-15</td>
						<td>微机原理</td>
						<td><span class="label label-warning">迟到</span></td>
					</tr>
					
					<tr>
						<td>2017-07-15</td>
						<td>微机原理</td>
						<td><span class="label label-info">请假</span></td>
					</tr>
					
					<tr>
						<td>2017-07-15</td>
						<td>微机原理</td>
						<td><span class="label label-warning">迟到</span></td>
					</tr>
					
					<tr>
						<td>2017-07-15</td>
						<td>微机原理</td>
						<td>正常</td>
					</tr>
					
					<tr>
						<td>2017-07-15</td>
						<td>微机原理</td>
						<td><span class="label label-danger">缺勤</span></td>
					</tr>
					
					<tr>
						<td>2017-07-15</td>
						<td>微机原理</td>
						<td><span class="label label-warning">迟到</span></td>
					</tr>
					
					<tr>
						<td>2017-07-15</td>
						<td>微机原理</td>
						<td><span class="label label-info">请假</span></td>
					</tr>
					 
				</table>
				
				<input type="button" name="" class="btn btn-danger btn-block" id="" value="返回主菜单"  onclick="showHomePage('div_ckkq')" />
				<div style="margin-top: 25px;"></div>
				
			</div>
			
		</div>

		<div id="div_xgxx" style="display: none;">
			4444444444444444
		</div>
<script type="text/javascript" src="js/jquery-1.12.3.min.js" ></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js" ></script>
</body>
</html>