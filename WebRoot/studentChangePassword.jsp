<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
  <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="教育，英语，文化课，教育机构，哈尔滨，平台，家教，名师，咨询，书城，教育新闻">
    <meta name="description" content="哈尔滨天源教育咨询平台，找家教、赵老师、招学生、找培训就上天源教育平台。">
    <title>天源教育平台-找回密码</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  <script type="text/javascript" src="js/jquery.js"></script></head>

  <body>

    <div class="container">
      <form id="change" class="form-signin" role="form" action="forget_student2">
        <h2 class="form-signin-heading">请输入新的密码：</h2>
        <input type="hidden" value="<s:property value="id"/>" name="id">
        <input name="password" type="password" class="form-control" placeholder="新密码" required autofocus>
        <input name="password2" type="password" class="form-control" placeholder="重复密码" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">提交</button>
      </form>
<script>
$('#change').submit(function(){
	alert("密码更改成功，请登录。");
});
</script>
    </div> <!-- /container -->

  </body>
</html>
