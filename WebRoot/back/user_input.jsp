<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>添加用户</title>
<link rel="stylesheet" href="back/assets/css/bui-min.css" type="text/css"></link>
<link rel="stylesheet" href="back/assets/css/dpl-min.css" type="text/css"></link>
</head>
<body>
	<form action="<s:if test="id!=0">back/user_update</s:if><s:if test="id==0">back/user_add</s:if>" method="post" class="form-horizontal well">
		<input type="hidden" name="id" value="<s:property value="user.id"/>" />
		<div class="control-group">
           <label class="control-label">用户名：</label>
           <div class="controls">
             <input class="input-normal control-text" <s:if test="id!=0">disabled="disabled"</s:if> type="text" name="user.username" value="<s:property value="user.username"/>" >
           </div>
         </div>
         <div class="control-group">
           <label class="control-label">密码：</label>
           <div class="controls">
             <input class="input-normal control-text" type="text" name="password" value="<s:property value="user.password"/>" >
           </div>
         </div>
         <div class="row">
           <div class="form-actions offset3">
             <button type="submit" class="button button-primary">保存</button>
             <button type="reset" class="button">重置</button>
           </div>
         </div>
	</form>
</body>
</html>