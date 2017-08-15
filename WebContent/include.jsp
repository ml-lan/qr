<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--这个jsp页面主要引入css、js等库文件 --%>
<%-- 当前项目上下文路径 --%>
<c:set var="CTX_PATH" value="${pageContext.request.contextPath}" scope="application"/>

<script type="text/javascript">
	var CTX_PATH = "${CTX_PATH}";
</script>
<!-- css -->
<link rel="icon" href="${CTX_PATH}/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${CTX_PATH}/favicon.ico" type="image/x-icon" />
<link rel="bookmark" href="${CTX_PATH}/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${CTX_PATH}/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${CTX_PATH}/css/dhtmlxmessage_dhx_skyblue.css"/>
<link rel="stylesheet" type="text/css" href="${CTX_PATH}/css/animate.min.css"/>
<link rel="stylesheet" type="text/css" href="${CTX_PATH}/css/style.css"/>
<!-- js-lib -->
<script type="text/javascript" src="${CTX_PATH}/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="${CTX_PATH}/js/dhtmlxmessage.js"></script>
<script type="text/javascript" src="${CTX_PATH}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${CTX_PATH}/js/public.js"></script>

