<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="utf-8"%>
<%@page import="com.xaut.entity.Dictionary"%>
<%@ include file="include.jsp" %>
<%

//声明
String xyname=""; //学院
String xiname=""; //系
String zyname=""; //专业
String njname=""; //年级
String bjname=""; //班级

%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>二维码签到系统管理端</title>

<!-- 报表引入的框架 -->	
<script src="${CTX_PATH}/js/dhtmlxchart.js" type="text/javascript"></script>
<link rel="STYLESHEET" type="text/css" href="${CTX_PATH}/css/dhtmlxchart.css">
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
		<p>管理中心</p>
	</div>
</div>

		
<div class="container">
	<div class="col-lg-3">
		<div class="list-group">
			<a href="#" id="a_kq" class="list-group-item active">数据统计 </a>
			<a href="#" class="list-group-item">教师管理</a>
			<a href="#" id="a_set" class="list-group-item ">设置</a>
		</div>
	</div>
	
	<div class="col-lg-9" style="background-color: white; min-height: 350px; padding-top: 10px;">

		<!-- 图表 -->
		<div id="div_chart" style="  height:300px;border:1px solid #A4BED4;">

				 

		</div>

			
		<div id="div_teacher_manager">
					
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active">
						<a href="#home" aria-controls="home" role="tab" data-toggle="tab">教师管理</a>
				</li>
				<li role="presentation">
						<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">出勤记录</a>
				</li>

			</ul>

				
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="home" style="padding: 10px;"> 

					 <input type="button" name="" id="" value="添加老师" onclick="showAddTeacher()" class="btn btn-sm btn-danger" style="margin:20px;"/>
							
							<!--显示老师信息 start -->
					<table id="teacher_show" class="table table-striped table-bordered table-hover">
							<tr>
								<td>编号</td>
								<td>姓名</td>
								<td>电话</td>
								<td>性别</td>
								<td>操作</td>
							</tr>
								
						</table>
							<!--显示老师信息 end -->
							
							<!---添加老师 start -->
					 <div id="teacher_add"  style="display: none;">
							<form action="${CTX_PATH}/servlet/TeacherAddServlet" method="post">
								<table class="table">
									<tr>
										<td style="vertical-align: middle;">姓名：</td>
										<td><input class="form-control" type="text" name="tname" id="" value="" /></td>
									</tr>
									<tr>
										<td style="vertical-align: middle;">性别：</td>
										<td><input type="radio" name="tsex" id="" value="1" checked="checked"/>男<input type="radio" name="tsex" id="" value="0" />女</td>
									
									</tr>
									<tr>
										<td style="vertical-align: middle;">电话：</td>
										<td><input class="form-control" type="text" name="tphone" id="" value="" /></td>
									
									</tr>
									<tr>
										<td style="vertical-align: middle;">密码：</td>
										<td><input class="form-control" type="text" name="tpass" id="" value="" /></td>
									
									</tr>
										
								</table>
								
		
								<div class="panel panel-info">
									  <div class="panel-heading">带班信息</div>
									  <div class="panel-body table-add-teacher">
									 
									     <table class="table table-bordered addteacherjob" >
									     	
									     		<tr>
									     		<td style="vertical-align: middle;">可供选择：</td>
									     		<td>
									     			<select name="tclass" class="form-control select_bjall" id="add-teacher-select">
									     				<option value="">请选择</option>
									     			</select>
									     		</td>
									  
									     		<td colspan="2" align="center"> 
									     			<input type="button" name="" id="" value="+" onclick="addTeacherJob()"  class="btn btn-danger" />
									     			<input type="button" name="sub" id="" value="-" class="btn btn-danger btn-sub" />
									     		
									     		</td>
									     		</tr>
									    	 </table>								   
									  	</div>
									</div>
								<input type="submit" name="" id="" value="保存老师信息" class="btn btn-danger btn-lg" />
							 </form>							
						</div>
							
									     
							<!---添加老师 end -->
							

				</div>
				<div role="tabpanel" class="tab-pane" id="profile">

							2222222222222222222

				</div>

			</div>
		</div>

		<div id="div_set" style="">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active">
							<a href="#sjzd" aria-controls="home" role="tab" data-toggle="tab">数据字典(专业班级)</a>
						</li>
						<li role="presentation">
							<a href="#sksd" aria-controls="profile" role="tab" data-toggle="tab">上课时段</a>
						</li>
						<li role="presentation">
							<a href="#yjfs" aria-controls="messages" role="tab" data-toggle="tab">邮件发送</a>
						</li>

					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="sjzd">

							<!-- HTML表单 提交 字典数据 -->
							<form onsubmit="return validateForm()" action="${CTX_PATH}/servlet/AddDictionaryServlet" method="post">
 								<table class="table">
									<tr> 
										<td style="vertical-align: middle;">学院</td>
										<td style="vertical-align: middle;">
											<select id="select_xy" name="select_xy" class="form-control">
													<option value="-1">请选择</option>
											</select>
										</td>
										<td style="vertical-align: middle;"><input type="button" name="" id="" value="+" class="btn btn-danger" data-toggle="modal" data-target="#modal_yuan_add" /></td>
										<td style="vertical-align: middle;">系名称</td>
										<td style="vertical-align: middle;">
											<select  id="select_x" name="select_x" class="form-control">
													<option value="-1">请选择</option>
											</select>
										</td>
										<td><input type="button" name="" id="" value="+" class="btn btn-danger"  data-toggle="modal" data-target="#modal_xi_add"  /></td>
									</tr>
	
									<tr>
										<td style="vertical-align: middle;">专业</td>
										<td style="vertical-align: middle;">
											<select id="select_zy" name="select_zy" class="form-control">
													<option value="-1">请选择</option>
											</select>
										</td>
										<td style="vertical-align: middle;"><input type="button" name="" id="" value="+" class="btn btn-danger"  data-toggle="modal" data-target="#modal_zhuanye_add"  /></td>
										<td style="vertical-align: middle;">年级</td>
										<td style="vertical-align: middle;">
											<select  id="select_nj"  name="select_nj" class="form-control">
													<option value="-1">请选择</option>
											</select>
										</td>
										<td><input type="button" name="" id="" value="+" class="btn btn-danger"  data-toggle="modal" data-target="#modal_nianji_add"  /></td>
									</tr>
	
									<tr>
										<td style="vertical-align: middle;">班级</td>
										<td style="vertical-align: middle;">
											<select  id="select_bj"  name="select_bj" class="form-control">
													<option value="-1">请选择</option>
											</select>
										</td>
										<td style="vertical-align: middle;"><input type="button" name="" id="" value="+" class="btn btn-danger"  data-toggle="modal" data-target="#modal_banji_add"  /></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;" colspan="2">
											<input type="button" name="" id="" value="查询" class="btn btn-primary " />
											<input type="submit" name="" id="" value="保存" class="btn btn-success" />
										</td>
	
									</tr>
	
								</table>
								
							</form>
							<table class=" table table-striped table-bordered">
								<tr>
									<td>学院</td>
									<td>系名称</td>
									<td>专业</td>
									<td>年级</td>
									<td>班级</td>
								</tr>
								
									<!-- 以下表格的行数据来源于 servlet 中存储的数据  -->
								<!-- 在jsp中可以编码java代码叫做java小脚本 -->
								
								<%
									
								
								
								List<Dictionary> list=(List<Dictionary>) request.getAttribute("data");
															
									for(Dictionary d:list){
									%>
										<tr>
											<td><%=d.getDxyname() %></td>
											<td><%=d.getDxiname() %></td>
											<td><%=d.getDzyname() %></td>
											<td><%=d.getDnjname() %></td>
											<td><%=d.getDbjname() %></td>
										</tr>
										
									<%	
										
										}
								
								 %>
								
								
							</table>

						</div>
						<div role="tabpanel" class="tab-pane" id="sksd">222222222</div>
						<div role="tabpanel" class="tab-pane" id="yjfs">.3333333333333</div>
					</div>
				</div>

	</div>

</div>
		

<!-- 模态框 弹出代码 start -->
	
<div class="modal fade" id="modal_yuan_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">新增学院</h4>
				</div>
				<div class="modal-body">
					学院名称:<input type="text" class="form-control" name="" id="txtxymc" value="" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btnsaveXY">保存</button>
				</div>
		</div>
	</div>
</div>
		
		
<div class="modal fade" id="modal_xi_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">新增系</h4>
				</div>
				<div class="modal-body">
						系名称:<input type="text" class="form-control" name="" id="txtX" value="" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btnsaveX">保存</button>
				</div>
		</div>
	</div>
</div>
		
		
<div class="modal fade" id="modal_zhuanye_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">新增专业</h4>
			</div>
			<div class="modal-body">
				专业名称:<input type="text" class="form-control" name="" id="txtZY" value="" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="btnsaveZY">保存</button>
			</div>
		</div>
	</div>
</div>
		
		
<div class="modal fade" id="modal_nianji_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">新增年级</h4>
			</div>
			<div class="modal-body">
				年级名称:<input type="text" class="form-control" name="" id="txtNJ" value="" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary"  id="btnsaveNJ">保存</button>
			</div>
		</div>
	</div>
</div>
		 
		
<div class="modal fade " id="modal_banji_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
				<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">新增班级</h4>
				</div>
				<div class="modal-body">
						班级名称:<input type="text" class="form-control" name="" id="txtBJ" value="" />
				</div>
				<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary"  id="btnsaveBJ">保存</button>
				</div>
		</div>
	</div>
</div>

<!-- 模态框 弹出代码 end -->
		
<footer>
<div>
<div class="container">
	<h4>理工大 曲江校区</h4>
	<p>Designed and built by <a href="#" target="_blank">@XAUT</a></p>	
 </div>
 </div> 
</footer>
<!-- java 脚本 -->
<%

for(Dictionary d:list){			
		xyname=xyname+" "+d.getDxyname();				
		
		xiname=d.getDxiname()+" "+xiname;
		
		zyname=d.getDzyname()+" "+zyname;
		
		njname=d.getDnjname()+" "+njname;
		
		bjname=d.getDbjname()+" "+bjname;
						
}										
%>

<script type="text/javascript">
$(function(){
	//加载报表
	var barChart2 = new dhtmlXChart({
	    view: "bar",
	    container: "div_chart",
	    value: "#dcount#",
	    label: "#dcount#",
	    tooltip: {
	        template: "#dcount#"  
	    },
	    xAxis: {
		        template: "#dclassname#" 
	    },
	    yAxis: {
            title: "人数" 
            
        }
	});
	barChart2.load("${CTX_PATH}/servlet/GetClassStuCountServlet", "json");
		

});

function addTeacherJob(){	
	//首先拷贝
	var addtj = $(".addteacherjob:first").clone();
	//然后将拷贝的内容再次放入 添加老师工作的区域
	$(".panel-body").append(addtj);
}
//增加按钮事件
$(".table-add-teacher").on("click","input[name='sub']",function(event){
  if($(".addteacherjob").length<2)
  {
  	return;
  }
  else{
  	$(event.target).parents("table").remove();
  }
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
//向服务器请求老师的数据
	$.ajax({        
				     type : "POST", //提交方式
				     dataType:"json",
				     url : "${CTX_PATH}/servlet/GetTeacherDataServlet",//路径
 				     success : function(result) {//返回数据根据结果进行相应的处理
	 			       	//alert(result);
	 			    	  //var dataObj = eval("("+arr+")");//这里要加上加好括号和双引号的原因我也不知道，就当是json语法，只能死记硬背了
	 			    	  //$.each是jquery的核心函数之一 主要用于对数据进行遍历
	 			       	$.each(result,function(idx,item){    
						   //输出
						   //alert(idx+"哈哈"+item);
						   //把json数组中的每一条数据添加到表格中
						   //teacher_show
						   //动态创建一行数据
						   
						   var sex="男";
						   if(item.tsex==0){
						   		sex="女";
						   }  
						   
				var rowdata=	" <tr>"+    
								"	<td>"+ item.tid +"</td>"+  
								"	<td>"+ item.tname +"</td>"+  
								"	<td>"+ item.tphone +"</td>"+
								"	<td>"+ sex +"</td>"+ 
 								"	<td>"+
								"		<input type='button' name='' id='' value='修改' class='btn btn-sm btn-warning' />"+
								"		<input type='button' name='' id='' value='删除' class='btn btn-sm btn-warning' />"+
								"	</td>"+
								"</tr>";
								   
								$("#teacher_show").append($(rowdata));
														   
						     
						})
	 			     }
	}); 




//模态框 函数 保存单个数据
function Model_box_save(selector1,selector2,selector3,selector4){
	$("#"+selector1).click(function(){
		var tem = $("#"+selector2).val();
		$("#"+selector3).append("<option selected='selected' value='"+tem+"'>"+tem+"<option>");
		$("#"+selector4).modal('hide');
	})
}
Model_box_save("btnsaveXY","txtxymc","select_xy","modal_yuan_add");
Model_box_save("btnsaveX","txtX","select_x","modal_xi_add");
Model_box_save("btnsaveZY","txtZY","select_zy","modal_zhuanye_add");
Model_box_save("btnsaveNJ","txtNJ","select_nj","modal_nianji_add");
Model_box_save("btnsaveBJ","txtBJ","select_bj","modal_banji_add");	
	
var msg='<%=request.getAttribute("msg")%>';
if(msg!='null'){//如果有消息
	dhtmlx.message({ 
		text: msg,     
		expire: 3000
	});
}
		
	//js数组去重	方法
Array.prototype.unique = function(){
		var res = [];
		var json = {};
		for(var i = 0; i < this.length; i++){
			if(!json[this[i]]){
				res.push(this[i]);
				json[this[i]] = 1;
			}
		}
		return res;
}

var xyname="<%=xyname%>";
var xiname="<%=xiname%>";
var zyname="<%=zyname%>";
var njname="<%=njname%>";
var bjname="<%=bjname%>";
	

	
//下拉列表函数
function xaut_select(name,selector){
	var tem = name.trim().split(" ");
	var result = tem.unique();
	for(var i=0;i<result.length;i++)
		{
		$("#"+selector).append("<option value='"+result[i]+"'>"+result[i]+"</option>");
		
		}
	$("#"+selector).children(":first-child").attr("selected","selected");
	
} 

xaut_select(xyname,"select_xy");
	
xaut_select(xiname,"select_x");
	
xaut_select(zyname,"select_zy");
	
xaut_select(njname,"select_nj");
	
xaut_select(bjname,"select_bj");
	
var flag='<%=request.getAttribute("flag")%>';
		
initAddTeacherSelect(); //如果是先进行的设置操作，则此时可以获取到最新的数据
function initAddTeacherSelect(){
					//发送ajax请求，在servlet中进行处理，返回给当前页面，页面解析结果
					$.ajax({        
						     type : "POST", //提交方式
						     url : "${CTX_PATH}/servlet/GetDictionaryServlet",//路径
						     data : { 
						      	"flag" : 6  
						     },
						     dataType:"json", 
						     success : function(result) {//返回数据根据结果进行相应的处理
			 			      	//alert(result);      
			 			      
			 			      	$.each(result,function(index,item){  
			 			      		//alert(index+"  "+item); 
			 			      		$(".select_bjall").append("<option value='"+index+"'>"+ item.dxyname+"-"+item.dxiname+"-"+item.dzyname+"-"+item.dnjname+"-"+item.dbjname +"</option>");
			 			      	});
			 			      	
			 			      		
			 			      	$(".select_bjall").children(":first-child").attr('selected','selected');       
			 			     }
					    }); 
 
				
}
</script>
</body>
</html>