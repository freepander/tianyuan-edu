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
<title>学生列表</title>
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
		          <li><a href="back/studentUser_input" class="button button-success">添加</a></li>
		        </ul>
	    	</th>
	    </tr>
        <tr>
          <th width="15">#</th>
          <th>名称</th>
          <th>性别</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
      <s:iterator value="list">
        <tr>
          <td><s:property value="id"/></td>
          <td><s:property value="name"/></td>
          <td><s:property value="sex"/></td>
          <td>
          	<a href="back/studentUser_input?id=<s:property value="id"/>" class="button button-primary">编辑</a>
          	<a href="back/studentUser_delete?id=<s:property value="id"/>" class="button button-danger">删除</a>
          	<s:if test="newcome">
          		<a href="back/studentUser_becomeOld?id=<s:property value="id"/>" class="button button-danger">新用户，请关注</a>
          	</s:if>
          </td>
        </tr>
      </s:iterator>
      </tbody>
    </table>
    
</body>
</html>