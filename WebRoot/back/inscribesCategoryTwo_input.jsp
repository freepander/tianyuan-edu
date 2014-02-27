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
<title>真题二级类别编辑</title>
<link rel="stylesheet" href="back/assets/css/bui-min.css" type="text/css"></link>
<link rel="stylesheet" href="back/assets/css/dpl-min.css" type="text/css"></link>
</head>
<body>
	<form action="<s:if test="id!=0">back/inscribesCategoryTwo_update</s:if><s:if test="id==0">back/inscribesCategoryTwo_add</s:if>" method="post" class="form-horizontal well">
		<input type="hidden" name="id" value="<s:property value="category.id"/>" />
		<div class="control-group">
           <label class="control-label"><s>*</s>名称：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="name" value="<s:property value="category.name"/>" ></div>
         </div>
         <div class="control-group">
	<label class="control-label"><s>*</s>所属类别</label>
	<div class="controls">
		<select name="categoryId">
			<option value="<s:property value="category.category.id"/>"><s:property value="category.category.name"/></option>
		<s:iterator value="list">
			<option value="<s:property value="id"/>"><s:property value="name"/></option>
		</s:iterator>
		</select>
	</div>
</div>
         <div class="row">
           <div class="form-actions offset3">
             <button type="submit" class="button button-primary">保存</button>
             <button type="reset" class="button">重置</button>
           </div>
         </div>
	</form>
	<script type="text/javascript" src="back/assets/js/jquery.js"></script>
</body>
</html>