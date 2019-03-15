<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>二维码签到系统教师端</title>

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
							<a href="javascript:void(0)" id="adoOut"><span class="glyphicon glyphicon-log-out"> </span> 安全退出</a>
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
<div class="container" style="margin-bottom:25px">
			
		<div class="col-lg-3" >
				<div class="list-group">
					 <a href="#" class="list-group-item  disabled">班级管理</a>
					 <a href="#" id="a_set" class="list-group-item active">设置</a>
 				</div>
		</div>
		<div class="col-lg-9" id="teacher_con">
			
			<div id="div_set" >
					<table class="table">
						
						<tr>
							<td>上课时间</td>
							<td>
								<input type="radio" name="startTime" id="" value="09:00:00" checked="checked"/>&nbsp&nbsp8:00&nbsp&nbsp 
								<input type="radio" name="startTime" id="" value="13:00:00" />&nbsp&nbsp10:00&nbsp&nbsp 
								<input type="radio" name="startTime" id="" value="09:00:00" />&nbsp&nbsp14:00&nbsp&nbsp  
								<input type="radio" name="startTime" id="" value="13:00:00" />&nbsp&nbsp16:00&nbsp&nbsp  
								<input type="radio" name="startTime" id="" value="09:00:00" />&nbsp&nbsp19:00&nbsp&nbsp  
						
							</td>
							<td></td>
						</tr>
						<tr>
							<td>服务器地址</td>
							<td><input type="text"  class="form-control"  name="" id="txtVal" value="http://127.0.0.1:8080/qr_check/servlet/StuQDServlet"/></td>
							<td></td>
						</tr>
						<tr>
							<td>二维码接口地址</td>
							<td><input type="text"  class="form-control"  name="" id="txtCode" value="http://qr.topscan.com/api.php?text="/></td>
							<td></td>
						</tr>
						
				</table>
				
				
				<div id="form_modify_passwd">
					<table  class="table" style="display:none">
						<tr>
							<td>
								<label>修改密码：</label><input type="password" name="spass1">
							</td>
						</tr>
						<tr>
							<td>
								<label>重复密码：</label><input type="password" name="spass2">
							</td>
						</tr>
					
							
					</table>
				<button  type="button" class="btn btn-danger" id="modify_passwd_submit" style="display:none">确认修改</button>
						
				</div>
				<button  type="button" class="btn btn-warning" id="modify_passwd">修改密码</button>
				<br>
				<br>
			</div> 
			
				
            <div id="div_qd" style="display: none;">
 					 
					  <ul class="nav nav-tabs" role="tablist">
					    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">考勤</a></li>
					    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><span onclick="getClassQDRecord()">出勤记录</span></a></li>
					    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" onclick="getClassMessage()" data-toggle="tab">消息</a></li>
 					  </ul>
					
					  <!-- Tab panes -->
					  <div class="tab-content">
					    <div role="tabpanel" class="tab-pane active" id="home" align="center">
					    	
					    	<img style="height: 500px; width: 500px;"  id="erweiCode"/>
					    	<div class="alert alert-info" role="alert" align="left" style="text-align: left;">
								<h4>应签到<span id="yqdSpan"></span>人,实际签到<span id="sjqdSpan"> </span>人</h4>
							</div>
					    	
					    </div>
					    <div role="tabpanel" class="tab-pane" id="profile">
					    	 <div class="col-lg-12">
					    	 	
					    	 	<table class="table">
						    	 	<tr>
						    	 		<td>开始日期</td>
						    	 		<td><input type="text" class="form-control" name=""  id="stime" value="" /></td>
						    	 		<td>结束日期</td>
						    	 		<td><input type="text" class="form-control" name="" id="etime" value="" /></td>
						    	 		<td>
						    				<input type="button" name="" id="" onclick="getClassQDRecord()" value="搜索" class="btn btn-primary" />
						    				
						    	 		</td>
						    	 		
						    	 	</tr>
						    	 	<tr>
							    	 	<td>
							    	 		<button type="button"  id="btn-click-excel" >Excel导出</button>  
							    	 	</td>
						    	 	</tr>
						    	 </table>
					    	 	
					    	 </div>
					    	 <div class="col-lg-12">
					    	 	<table id="classqdrecodeTable" class="table table-striped table-hover table-bordered">
						    	 	<tr id="table_classqd_data">
						    	 		<td>姓名</td>
						    	 		<td>性别</td>
						    	 		<td>电话</td>
						    	 		<td>考勤时间</td>
						    	 		<td>考勤状态</td>
						    	 	</tr>
						    	 
						    	 </table>
					    	 </div>
					    </div>
					    <div role="tabpanel" class="tab-pane" id="messages">
					    	
					    	<table id="classQJMessage" class="table table-striped table-hover table-bordered">
					    		<tr id="table_classqj_data">
					    			<td>发送人</td>  
					    			<td>日期</td>
					    			
					    			<td>类型</td>
					    			<td>内容</td>
					    			<td>操作</td>
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

//老师退出
    
$("#adoOut").click(function(){		  	
		  	if(confirm('请确认当前授课班级编号:'+did+",上课时间为:"+stime)){
		  		window.location.href="../index.jsp";   
		  	}
});

var did; //课程编号
var stime="";  //签到时间
var teacherId='<%=request.getAttribute("teacherId")%>';	//登录的老师的ID


//当网页dom结构加载完毕之后
$(function(){

	//excel函数
	var idTmr;
	function  getExplorer() {
	    var explorer = window.navigator.userAgent ;
	    //ie
	    if (explorer.indexOf("MSIE") >= 0) {
	        return 'ie';
	    }
	    //firefox
	    else if (explorer.indexOf("Firefox") >= 0) {
	        return 'Firefox';
	    }
	    //Chrome
	    else if(explorer.indexOf("Chrome") >= 0){
	        return 'Chrome';
	    }
	    //Opera
	    else if(explorer.indexOf("Opera") >= 0){
	        return 'Opera';
	    }
	    //Safari
	    else if(explorer.indexOf("Safari") >= 0){
	        return 'Safari';
	    }
	}
	function method1(tableid) {//整个表格拷贝到EXCEL中
	    if(getExplorer()=='ie')
	    {
	        var curTbl = document.getElementById(tableid);
	        var oXL = new ActiveXObject("Excel.Application");
	         
	        //创建AX对象excel
	        var oWB = oXL.Workbooks.Add();
	        //获取workbook对象
	        var xlsheet = oWB.Worksheets(1);
	        //激活当前sheet
	        var sel = document.body.createTextRange();
	        sel.moveToElementText(curTbl);
	        //把表格中的内容移到TextRange中
	        sel.select();
	        //全选TextRange中内容
	        sel.execCommand("Copy");
	        //复制TextRange中内容 
	        xlsheet.Paste();
	        //粘贴到活动的EXCEL中      
	        oXL.Visible = true;
	        //设置excel可见属性

	        try {
	            var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
	        } catch (e) {
	            print("Nested catch caught " + e);
	        } finally {
	            oWB.SaveAs(fname);

	            oWB.Close(savechanges = false);
	            //xls.visible = false;
	            oXL.Quit();
	            oXL = null;
	            //结束excel进程，退出完成
	            //window.setInterval("Cleanup();",1);
	            idTmr = window.setInterval("Cleanup();", 1);

	        }
	    }
	    else
	    {
	        tableToExcel(tableid)
	    }
	}
	function Cleanup() {
	    window.clearInterval(idTmr);
	    CollectGarbage();
	}
	var tableToExcel = (function() {
	      var uri = 'data:application/vnd.ms-excel;base64,',
	      template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><meta http-equiv="Content-Type" charset=utf-8"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
	        base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
	        format = function(s, c) {
	            return s.replace(/{(\w+)}/g,
	            function(m, p) { return c[p]; }) }
	        return function(table, name) {
	        if (!table.nodeType) table = document.getElementById(table)
	        var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
	        window.location.href = uri + base64(format(template, ctx))
	      }
	    })()
	
	//时间函数
	startTime();
	getTeacherClass(teacherId);//填充老师带班信息

	$("#btn-click-excel").click(function(){
		method1('classqdrecodeTable');
	})
	var $goTop = $('<div id="goTop" style="border:1px solid #337AB7;background:#337AB7;color:#fff;text-align:center;padding:10px 13px 7px 13px;position:fixed;bottom:10px;right:10px;cursor:pointer;display:none;font-family:verdana;font-size:18px;">^</div>').appendTo('body');

	  $(window).scroll(function() {
	    if ($(this).scrollTop() != 0) {
	      $goTop.fadeIn();
	    } else {
	      $goTop.fadeOut();
	    }
	  });

	  $goTop.click(function() {
	    $('body, html').animate({
	      scrollTop: 0
	    }, 800);
	  });
	
}); 

//老师自身修改密码
$("#modify_passwd").click(function(){

	$(this).css({
		"display":"none"
	});
	$("#modify_passwd_submit").css({
		"display":"block"
	})
	$("#form_modify_passwd").find("table").css({
		"display":"table"
	})

})
$("#modify_passwd_submit").click(function(){

	$(this).css({
		"display":"none"
	});
	$("#form_modify_passwd").find("table").css({
		"display":"none"
	})
	$("#modify_passwd").css({
		"display":"block"
	})
	
	var spass1=$("#form_modify_passwd").find("input[name='spass1']").val();
	var spass2=$("#form_modify_passwd").find("input[name='spass2']").val();
	if(spass1!=spass2){
	
		dhtmlx.message({
			text: "两次密码应一致！！！",   
			expire: 3000
		});
		$("#form_modify_passwd").find("input[name='spass1']").val("");
		$("#form_modify_passwd").find("input[name='spass2']").val("");
	}
	else{
		$.ajax({
			 type : "POST", //提交方式
			 url : "${CTX_PATH}/servlet/ModifyTeacherPasswd",//路径
			 data:{
				 "teacherId":teacherId,
				 "ModifyPasswd":spass1
		   	 },
			 success : function(result) {
				 if(result=1)
					 {
						 dhtmlx.message({
								text: "修改密码成功",   
								expire: 3000
							});
					 }
				 else{
					 dhtmlx.message({
							text: "修改密码失败",   
							expire: 3000
						});
				 }
			 }
				 
			
		})
	}
	
})

//左侧菜单点击事件
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
		 
//发送ajax请求获取数据 
//ajax默认是异步请求的
//就是说 发送了请求之后，不需要等待服务器的返回就可以执行其他的代码
function getTeacherClass(teacherId){
	$.ajax({      
			 type : "POST", //提交方式
			 url : "${CTX_PATH}/servlet/GetTeacherClassServlet",//路径
			 data:{
				 "teacherId":teacherId
		   	 },
			 dataType:"json",
			 success : function(result) {//返回数据根据结果进行相应的处理
				 
	 			 $.each(result,function(index,item)
	 			 {
	 			      	 	  
	 			     $(" <a href='#' id='"+item.did+"' class='list-group-item a_kq'>"+item.dnjname+item.dzyname+item.dbjname+"<span class='badge'>0</span></a>").insertBefore("#a_set");
	 			 });
 			      	 
 			     classClick(); 
 			     
 			  //当 老师 带班信息加载完毕之后需要查询 这个班级中的消息条目
			      	 
			      getClassQJData();
 			 }
		   }); 
}



//得到老师带班 的请假信息
function getClassQJData(){
	 $.each($(".a_kq"),function(index,val){
	 		var aobj=$(this);
	 	
	 	   var  classno=$(this).attr("id");
	 		//循环的向后台发送请求，以用于获取 消息的条目
	 			$.ajax({        
				     type : "POST", //提交方式
				     url : "${CTX_PATH}/servlet/GetClassQJRecordServlet",//路径
				     data:{
				     	 "cno":classno//在此处需要注意当前台没有传递某个参数的时候，后台获取这个参数 拿到的值就是null 不会报错
				     	 
 				     },
				     dataType:"json",    
				     success : function(result) {//返回数据根据结果进行相应的处理  
				        //alert(classno+"==="+result.length);
				        aobj.find("span").text(result.length);
		 			     }  
			  });     
	 		
	 });
}


//为班级考勤和设置链接增加点击事件的处理   
function classClick(){ 
		$(".a_kq").click(function(){
		//字典的编号，一条字典数据就是一个班级的完整信息
		did=$(this).attr("id");  
			
		//先去处已经获得焦点的标签的样式
		//$(".active")表示获取拥有active样式的元素对象
		//removeclass意思是移除这个对象的active样式
		//先粗后细    
		//意思就是先获取一个大的区域，再在这个区域中进行筛选和过滤    
		$(".col-lg-3").find(".active").removeClass("active");
		
		$(this).addClass("active");
		//获取老师选择的上课时间
			
		var cks=document.getElementsByName("startTime");//通过元素的name属性值获取一组 html标签 这是一个数组
		for(var i=0;i<cks.length;i++)
		{
 			if(cks[i].checked==true)
 			{ 
			stime=cks[i].value; 
			break;  
			}  
		}   
				
		$("#div_set").fadeOut(500,function(){
			//为图片赋一个地址
			
			//二维码的地址，我们让后台帮助前台生成【计算】
			//前台只用调用即可
			//这样做的好处是在后台可以轻松的操作session
 			//调用设置二维码地址方法					
			setEWImage();
			
			$("#div_qd").fadeIn(500,function(){
						
			});
		});
				
				
		//根据字典id查找 班级有多少个人。   
				
		getqdfunction();       
				
				
	});
}

//设置二维码的地址
function setEWImage(){
	//alert(11);
	 //$("#erweiCode").fadeOut(5); 

	var path=$("#txtCode").val()+$("#txtVal").val()+"?did="+did+","+stime;
	
	$.ajax({        
		     type : "POST", //提交方式      
		     url : "${CTX_PATH}/servlet/EWImagePathServlet",//路径
		     data:{
		     	 "path":path     
			     },
			     success : function(result) {//返回数据根据结果进行相应的处理 
			      	 $("#erweiCode").attr("src",result).load(function(){    
			      	 	 	//$("#erweiCode").fadeIn(5);
			      		 setTimeout(setEWImage,60000);     
			      	 	 	 
			      	 });     
			      	
     
			      	
			     }    
	  });     
	
	 
	
}
						
function getqdfunction(){
		$.ajax({        
				  type : "POST", //提交方式
				  url : "${CTX_PATH}/servlet/GetQDDataServlet",//路径
				  data:{
				     	 "classno":did,    
						 "time":stime
				   },
				  dataType:"json", 
				  success : function(result) {//返回数据根据结果进行相应的处理 
	 			      	$.each(result,function(index,item){ 
 	 			      		if(index==0){
 	 			      			$("#yqdSpan").text(item);
	 			      		}else{
								$("#sjqdSpan").text(item);	 			         	
							}
	 			      		  
	 			      	});
	 			     }
			});   
			  
	setTimeout(getqdfunction,60000);//过上一秒钟，让程序再次调用  getqdfunction 这个函数
}
	


//ajax获取 本班级签到数据
function getClassQDRecord(){
		dhtmlx.message({
			text:'数据努力加载中...',    
			expire: 3000
		}); 

  
	
			$.ajax({        
		     type : "POST", //提交方式
		     url : "${CTX_PATH}/servlet/GetClassQDRecordServlet",//路径
		     data:{
		     	 "classno":did,//在此处需要注意当前台没有传递某个参数的时候，后台获取这个参数 拿到的值就是null 不会报错
		     	  "sday":$("#stime").val(),
		     	   "eday":$("#etime").val()    
			     },
		     dataType:"json",    
		     success : function(result) {//返回数据根据结果进行相应的处理  
		       
		     
		     	//alert("数据已经获取到了  ");
		     		//alert( $("#classqdrecodeTable").find("tbody").children(":gt(0)").length );   
			       		//$("#table_classqd_data").next().remove();
			       		 
			       		$("#classqdrecodeTable").find("tbody").children(":gt(0)").remove(); 
			       		     
			       		$.each(result,function(indx,d){ 
			       		
			       			  var newTime = new Date(d[3]); //就得到普通的时间了
	 			      		  var n=	newTime.getFullYear()+"-";
	 			      		  var y=	newTime.getMonth()+1+"-";   
	 			      		  var r=	newTime.getDate();   
	 			      		 var zt;
		 			       		
	 			       		  zt= (d[4]>0 ?"迟到":"正常" );
	 			       		   
	 			       		  
	 			       		 if( d[5]==1){
	 			       		  	zt='缺勤'; 
	 			       		  }

	 			       		var rowdata="<tr>"+
								    	 		"<td>"+d[0]+"</td>"+
								    	 		"<td>"+(d[1]==0?"女":"男")+"</td>"+
								    	 		"<td>"+d[2]+"</td>"+ 
								    	 		"<td>"+(n+y+r)+"</td>"+   
								    	 		"<td>"+zt+"</td>"+  
						    				"</tr>";
				    				
				    	$("#table_classqd_data").after(rowdata);		 	  
			       		});
			       		
			       		//$(".dhtmlx_message_area").fadeOut(500); 
			       			$(".dhtmlx_message_area").empty();//清空     
			       		
			     }
	  });     
}



//获取学生发送给自己【老师】的消息
function getClassMessage(){
		
				dhtmlx.message({
					text:'数据努力加载中...',    
					expire: -1
				}); 
		
		
				//应该是要调用后台 根据老师编号 和 班级编号查询 未读的消息记录
	 
				$.ajax({        
				     type : "POST", //提交方式
				     url : "${CTX_PATH}/servlet/GetClassQJRecordServlet",//路径
				     data:{
				     	 "cno":did,	//在此处需要注意当前台没有传递某个参数的时候，后台获取这个参数 拿到的值就是null 不会报错
				     	 "teacherId":teacherId
				     },
				     dataType:"json",    
				     success : function(result) {//返回数据根据结果进行相应的处理  
				       
				     
				     		//alert(result);  
				     		//alert( $("#classqdrecodeTable").find("tbody").children(":gt(0)").length );   
	 			       		$("#table_classqd_data").next().remove();
	 			       		
	 			       		 $("#classQJMessage").find("tbody").children(":gt(0)").remove(); 
	 			       		     
	 			       		$.each(result,function(indx,d){ 
	 			       		
	 			       		
					    			
	 			       			   var newTime = new Date(d[3]); //就得到普通的时间了
	 	 			      		  var n=	newTime.getFullYear()+"-";
	 	 			      		  var y=	newTime.getMonth()+1+"-";   
	 	 			      		  var r=	newTime.getDate();   
	 			       		  
	 			       			var rowdata="<tr>"+    
								    	 		"<td>"+d[1]+"</td>"+  
								    	 		"<td>"+(n+y+r)+"</td>"+
								    	 		"<td>"+d[2]+"</td>"+ 
								    	 		"<td>"+d[4]+"</td>"+   
								    	 		"<td>"+ 
								    				"<input type='button' value='同意' onclick='btnQJClick("+d[5]+",0)' class='btn btn-success' style='margin-right:20px'/>"+ 
								    				"<input type='button' value='不同意'  onclick='btnQJClick("+d[5]+",1)' class='btn btn-danger' />"+ 
								    			"</td>"+   
						    				"</tr>";
						    				   
						    	$("#table_classqj_data").after(rowdata);		 	  
	 			       		}); 
	 			       		
	 			       		//$(".dhtmlx_message_area").fadeOut(500); 
	 			       		$(".dhtmlx_message_area").empty();//清空     
	 			       		
	 			     } 
			  });     
		}	
		


///servlet/UpdateQJStateServlet
		 
function btnQJClick(qjid,val){
		 		$.ajax({        
				     type : "POST", //提交方式
				     url : "${CTX_PATH}/servlet/UpdateQJStateServlet",//路径
				     data:{
				     	 
				     	 "qjid": qjid,
				     	 "state":val
				     },
				       
				     success : function(result) {
				    	 
				    	 //返回数据根据结果进行相应的处理  
				    	 
				    	 alert(result);
				       	dhtmlx.message({
							text:result,    
							expire: 3000
						}); 
		
						getClassMessage();    //当处理了消息之后，将数据的消息重新查询一次
				      
	 			     } 
			  });     
		 
}

</script>
</body>
</html>