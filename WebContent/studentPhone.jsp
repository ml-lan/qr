<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.xaut.service.StudentService"%>
<%@ page import="com.xaut.dao.StudentDao"%>
<%@ page import="com.xaut.entity.Student"%>
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
		<%
 
		String randomUUID=request.getParameter("randomUUID");
			Cookie cc[]= request.getCookies();//获取客户端本地的cookie数据
		
			boolean flag=false;//表示没有登录
			String sphone="";//学生电话号码
			String sno="";//学生在数据库的编号
			for(Cookie c:cc){
				if(c.getName().equals("islogin")){
					if(c.getValue().equals("true")){
						flag=true;
					}
				}
				
				if(c.getName().equals("sphone")){
					sphone=c.getValue();
				}
				
				if(c.getName().equals("sno")){
					sno=c.getValue();
				}
			}
			
		 %>

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
						<%
							if(flag==true){
						%>
						
							<li>
								<a href="#"> <span class="glyphicon glyphicon-user"> </span> 欢迎:<%= sphone %></a>
							</li>
						<%		
							}else{
							
						%>
							<li>
								<a href="studentLogin.jsp"> <span class="glyphicon glyphicon-user"> </span> 登陆</a>
							</li>
						<%	
							}
						 %>
					 

					</ul>
			</div>	
		</div>
</nav>
		


<div class="jumbotron " style="margin-top: 50px;">
	<div class="container">
		<h3 id="serverMsg"></h3>   
		<h1>二维码签到系统</h1>
		
						<%
							if(flag==true){
						%>
						
							 	<p >欢迎:<%=sphone%></p>
						<%		
							}else{
							
						%>
						
							<p >好好学习 天天向上</p>
						
						<%} %>
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

<div id="div_qd" style="display: none;">
			
			<div class="container">
				<h2>授课老师：谢逊</h2>
				<h4>课程：微机原理</h4>
				<div align="center">
					
					<img src="${CTX_PATH}/img/current.jpg" id="stateImg" />
					
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
					<td><input type="text" id="sqqj_day" class="form-control" value="2017-07-19" /></td>
				</tr>

				<tr>
					<td>事由</td>
				</tr>
				<tr>
					<td>
						<input type="radio" id="sqqj_sy" value="b" checked="checked" name="sy" />病假
						<input type="radio" value="s" name="sy" />事假
					</td>

				</tr>
				
				<tr>  
					<td>选择老师</td>
				</tr>  
				<tr>
					<td>
						<select   class="form-control"   id="teacherData">
							<option value="-1">请选择</option>
						</select>
					</td>

				</tr>
				
				
				<tr>
					<td>备注 </td>
				</tr>

				<tr>
					<td>
						<textarea name="3" rows="3"  id="sqqj_bz" cols="" class="form-control"></textarea>
					</td>
				</tr>

				<tr>
					<td>
						<input type="button" class="btn btn-danger btn-block" name="" id="btnaaa" onclick="sendQJMessage()" value="确认申请" />
					</td>
				</tr>

			</table>
</div>

<div id="div_ckkq" style="display: none;">
			
			<div class="container">
				
				<table class="table table-striped">
					<tr id="tableData">
						<td>日期</td>
						<td>上课时间</td>
						<td>签到时间</td>
 						<td>考勤状态</td>
					</tr>
				</table>
				
				<input type="button" name="" class="btn btn-danger btn-block" id="" value="返回主菜单"  onclick="showHomePage('div_ckkq')" />
				<div style="margin-top: 25px;"></div>
				
			</div>
			
</div>

<div id="div_xgxx" style="display: none;">
				4444
				<input type="button" name="" class="btn btn-danger btn-block" id="" value="返回主菜单"  onclick="showHomePage('div_ckkq')" />
</div>

<script type="text/javascript">

function showHomePage(div_id){
	$("#"+div_id).fadeOut(100,function(){
		$("#btnDiv").fadeIn(500);   
	});
	
	
}

//为按钮增加点击的事件处理
$("#btn1").click(function() {
	

	//判断用户是否登陆了，如果登陆了才可以签到，否则提示 请先登录
	
	<%
			Cookie cks[]= request.getCookies();
		String val=null;
		for(Cookie c:cks){
			if(c.getName().equals("islogin")){
				val=c.getValue();
			}
		}
	
	%>
	
	var islogin='<%=val%>';
		if(islogin=='null'){
		alert('请先登录才可以签到');
		return ;  
	}
		

	$("#btnDiv").fadeOut(500, function() {
		$("#div_qd").fadeIn(500,function(){
			 
			 //发送ajax签到自己
			 $.ajax({     
				     type : "POST", //提交方式
				     url : "${CTX_PATH}/servlet/QDServlet",//路径
				     data:{
				     	sno:'<%=sno%>',
				     	"uuid":'<%=randomUUID%>' 
				     },
				     success : function(result) {//返回数据根据结果进行相应的处理  
				     		$("#serverMsg").html(result);
				     		//返回的完整数据具体是是什么 需要 断点调试                  
	 			      		 if(result.length != 8 ){
	 			      		 	//显示错误的图片
	 			      		 	$("#stateImg").attr("src",'${CTX_PATH}/img/x.jpg');
	 			      		 }else{
	 			      		 	$("#stateImg").attr("src",'${CTX_PATH}/img/current.jpg');
	 			      		 }
	 			     } 
			    }); 
				
		});
	});
	
	
});
	

$("#btn2").click(function() {
	

	var islogin='<%=val%>';
		if(islogin=='null'){
		alert('请先登录才可以签到');
		return ;  
	}
	
	$("#btnDiv").fadeOut(500, function() {
		
		
		//为老师这个 选择框 赋值 /servlet/GetClassTeacherDataServlet
			$.ajax({        
			     type : "POST", //提交方式
			     url : "${CTX_PATH}/servlet/GetClassTeacherDataServlet",//路径
			     data:{   
			     	 "sno":'<%=sno%>'   
				     },
			     dataType:"json",  
			     success : function(result) {//返回数据根据结果进行相应的处理       
 			       	//
 			      	$.each(result,function(inx,iteam){
 			      		 var dddata="<option value='"+iteam.tid+"'> "+iteam.tname+" </option>";
 			      		
 			      		 $("#teacherData").append(dddata);   
 			      	});
 			     }
		  });      
		
		$("#div_sqqj").fadeIn(500);
	});
});

$("#btn3").click(function() {
	$("#btnDiv").fadeOut(500, function() {
		
		//访问后台获取数据
		$.ajax({        
			     type : "POST", //提交方式
			     url : "${CTX_PATH}/servlet/GetStudentQDRecordServlet",//路径
			     data:{
			     	 "stuno":'<%=sno%>'   
				     },
			     dataType:"json",  
			     success : function(result) {//返回数据根据结果进行相应的处理    
 			      	$.each(result,function(index,item){    
 			      	
 			      		 //将之间的数据先删除
 			      		 // 找到dom结构 删除#tableData 的后面的兄弟元素
 			      		 $("#tableData").next("tr").remove(); 
    		    
 			      		  var ss=(item.cqs<=0?"正常":"迟到");   
 			      		  var newTime = new Date(item.qdate); //就得到普通的时间了
	 			      		  var n=	newTime.getFullYear()+"-";
	 			      		  var y=	newTime.getMonth()+1+"-";   
	 			      		  var r=	newTime.getDate();  
	 			      		  $("#tableData").after(" <tr> <td> "+ (n+y+r) +" </td> <td> "+item.qstarttime1+" </td> <td> "+item.qtime1+" </td> <td> "+ ss +" </td> </tr> ");
 			      		 
 			      	});
 			     }
		  });      
		//并把数据进行解析
	
	
		$("#div_ckkq").fadeIn(500);
	});
});

$("#btn4").click(function() {
	$("#btnDiv").fadeOut(500, function() {
		$("#div_xgxx").fadeIn(500);
	});
});


	//请假信息提交后台
function sendQJMessage() {


				$("#btnaaa").attr("disabled","disabled");

				//获取请假的数据 
				   
				var sqqj_day = $("#sqqj_day").val();
				var sqqj_sy ;//事由是一个radio
				if( $("#sqqj_sy").attr("checked")==true){
					sqqj_sy="0";
				}else{
					sqqj_sy="1";  
				}
	 			var sqqj_ls = $("#teacherData").val();
				var sqqj_bz = $("#sqqj_bz").val();
				    
				if(sqqj_day=="" || sqqj_ls=="" || sqqj_bz==""  || sqqj_ls==-1){
					alert("填写的内容不完整,请检查后再次提交");
					return ;    
				}
				
				
				//访问后台获取数据
				$.ajax({        
					     type : "POST", //提交方式
					     url : "${CTX_PATH}/servlet/AddSQQJServlet",//路径
					     data:{
					     	 "sqqj_day":sqqj_day,        
					     	 "sqqj_sy":sqqj_sy,    
					     	 "sqqj_ls":sqqj_ls,
					     	 "sqqj_bz":sqqj_bz ,  
					     	 "stuno":'<%=sno%>'           
	 				     },
					    
					     success : function(result) {//返回数据根据结果进行相应的处理    
	 		 			      	
					    	
	 		 			      	alert(result);
	 		 			      
	 							$("#div_sqqj").fadeOut(500, function() { 
									$("#btnDiv").fadeIn(500);
								});
							 			      
			 			      
			 			      
			 		     }
				 });      
	
}


var msg='<%=request.getAttribute("msg")%>'; 
if(msg!='null'){//如果有消息
	alert(msg);
}

</script>
</body>
</html>