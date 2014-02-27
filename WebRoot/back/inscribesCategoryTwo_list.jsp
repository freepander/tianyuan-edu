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
<title>真题二级类别管理</title>
<link rel="stylesheet" href="back/assets/css/bui-min.css" type="text/css"></link>
<link rel="stylesheet" href="back/assets/css/dpl-min.css" type="text/css"></link></head>
<body>
	<div class="tips tips-small tips-warning">
       <div class="tips-content"><s:property value="message"/>
       </div>
    </div>
	<table cellspacing="0" class="table table-bordered">
      <thead>
      	<tr>
      		<th colspan="4">
		        <ul class="toolbar">
		          <li><a href="back/inscribesCategoryTwo_input" class="button button-success">添加</a></li>
		        </ul>
	    	</th>
	    </tr>
        <tr>
          <th width="15">#</th>
          <th>父类别</th>
          <th>名称</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
      <s:iterator value="list">
        <tr>
          <td><s:property value="id"/></td>
          <td><s:property value="category.name"/></td>
          <td><s:property value="name"/></td>
          <td>
          	<a href="back/inscribesCategoryTwo_input?id=<s:property value="id"/>" class="button button-primary">编辑</a>
          	<a href="back/inscribesCategoryTwo_delete?id=<s:property value="id"/>" class="button button-danger">删除</a></td>
        </tr>
      </s:iterator>
      </tbody>
    </table>
    
</body>
</html>