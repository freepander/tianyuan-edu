<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  <link rel="stylesheet" href="css/style.css" type="text/css"></link></head>
  
  <body>
  
	<a href="javascript:void(0);" onclick="ib_wopen();">在线客服</a>
	<script type="text/javascript" src="js/jquery.fxTab.js"></script>
	<div class="fxui-new">
	  <div class="fxui-tab-hand" id="news">
	  	<span class="fxui-tab-tit news-tit">标签一</span> 
	  	<span class="fxui-tab-tit news-tit">标签二</span> 
	  	<span class="fxui-tab-tit news-tit">标签三</span>
	  </div>
	  <div class="fxui-tab-nav news-content">内容一</div>
	  <div class="fxui-tab-nav news-content">内容二</div>
	  <div class="fxui-tab-nav news-content">内容三</div>
	</div>
	<script type="text/javascript">
	$('.fxui-new').fxuiTab();
	</script>

  </body>
</html>
