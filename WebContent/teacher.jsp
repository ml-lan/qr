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
<title>二维码签到系统教师端</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/dhtmlxmessage_dhx_skyblue.css">
 		
<link rel="stylesheet" href="css/style.css">
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
						<li>
							<a href="#"><span class="glyphicon glyphicon-log-out"> </span> 安全退出</a>
						</li>
					</ul>
				</div>	
		</div>
</nav>

		<div class="jumbotron" style="margin-top: 50px;">
			<div class="container">
				<h1>理工大二维码签到程序</h1>
				<p>教师中心</p>
			</div>
		</div>

<div class="container">
			
			<div class="col-lg-3" >
				<div class="list-group">
					  <a href="#" class="list-group-item  disabled">
					  	  班级管理
					  </a>
					  <a href="#" id="a_kq" class="list-group-item">15级计应1班<span class="badge">14</span></a>
					  <a href="#" class="list-group-item">15级计应2班</a>
					  <a href="#" id="a_set" class="list-group-item active">设置</a>
 				</div>
			</div>
			<div class="col-lg-9" id="teacher_con">
			
				<div id="div_set" >
					<input type="button" value="修改密码(搁置)" class=" btn btn-info" />
					<br />	<br />
					<table class="table">
						<tr>
							<td>当日口令</td>
							<td><input type="text" class="form-control" name="" id="" value="432JH432H324GG432JHG43JH3" /> </td>
							<td><input type="button" name="" id=""  class="btn btn-success" value="一键生成" /></td>
						</tr>
						<tr>
							<td>上课时间</td>
							<td>
								<input type="checkbox" name="" id="" value="" />9:00
								<input type="checkbox" name="" id="" value="" />13:00
							</td>
							<td></td>
						</tr>
						<tr>
							<td>服务器地址</td>
							<td><input type="text"  class="form-control"  name="" id="" value="" /></td>
							<td></td>
						</tr>
						<tr>
							<td>二维码接口地址</td>
							<td><input type="text"  class="form-control"  name="" id="" value="" /></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3"  align="center">
								<input type="button" name="" id="" class="btn btn-danger" value="保存设置" />
							</td>
						</tr>
					</table>
				</div> 
				
				
                 <div id="div_qd" style="display: none;">
 					 
					  <ul class="nav nav-tabs" role="tablist">
					    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">考勤</a></li>
					    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">出勤记录</a></li>
					    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">消息</a></li>
 					  </ul>
					
					  <!-- Tab panes -->
					  <div class="tab-content">
					    <div role="tabpanel" class="tab-pane active" id="home" align="center">
					    	
					    	<img style="height: 500px; width: 500px;" src="http://qr.topscan.com/api.php?text=HTTP://WWW.BAIDU.COM" />
					    	<div class="alert alert-info" role="alert" align="left" style="text-align: left;">
								<h4>应签到50人,实际签到35人</h4>
							</div>
					    	
					    </div>
					    <div role="tabpanel" class="tab-pane" id="profile">
					    	 <div class="col-lg-12">
					    	 	
					    	 	<table class="table">
						    	 	<tr>
						    	 		<td>开始日期</td>
						    	 		<td><input type="text" class="form-control" name="" id="" value="" /></td>
						    	 		<td>结束日期</td>
						    	 		<td><input type="text" class="form-control" name="" id="" value="" /></td>
						    	 		<td>
						    				<input type="button" name="" id="" value="搜索" class="btn btn-primary" />
						    				<input type="button" name="" id="" value="Excel下载" class="btn btn-primary" />
						    	 		</td>
						    	 	</tr>
						    	 </table>
					    	 	
					    	 </div>
					    	 <div class="col-lg-12">
					    	 	<table class="table table-striped table-hover table-bordered">
						    	 	<tr>
						    	 		<td>姓名</td>
						    	 		<td>性别</td>
						    	 		<td>电话</td>
						    	 		<td>考勤时间</td>
						    	 		<td>考勤状态</td>
						    	 	</tr>
						    	 	<tr>
						    	 		<td>张无忌</td>
						    	 		<td>男</td>
						    	 		<td>18500000000</td>
						    	 		<td>2017-07-14</td>
						    	 		<td>正常</td>
						    	 	</tr>
						    	 </table>
					    	 </div>
					    </div>
					    <div role="tabpanel" class="tab-pane" id="messages">
					    	
					    	<table class="table table-striped table-hover table-bordered">
					    		<tr>
					    			<td>日期</td>
					    			<td>发送人</td>
					    			<td>类型</td>
					    			<td>内容</td>
					    			<td>操作</td>
					    		</tr>
					    		<tr>
					    			<td>殷素素</td>
					    			<td>2017-08-09</td>
					    			<td>病假</td>
					    			<td>冰火岛太冷了，冻感冒了</td>
					    			<td>
					    				<input type="button" value="同意" class="btn btn-success" />
					    				<input type="button" value="不同意" class="btn btn-danger" />
					    			</td>
					    		</tr>
					    	</table>
					    	
					    </div>
 					  </div>
 				</div>
                
				
				
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


</script>
</body>
</html>