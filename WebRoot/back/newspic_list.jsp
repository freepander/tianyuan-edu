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
<title>title</title>
<link rel="stylesheet" href="back/assets/css/bui-min.css" type="text/css"></link>
<link rel="stylesheet" href="back/assets/css/dpl-min.css" type="text/css"></link></head>
<body>
	<table cellspacing="0" class="table table-bordered">
      <thead>
        <tr><th colspan="5">
        <ul class="toolbar">
          <li><a href="back/newspic_input" class="button button-success">添加</a></li>
        </ul>
        </th></tr>
        <tr>
          <th width="15">#</th>
          <th>标题</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
      <s:iterator value="list">
        <tr>
          <td><s:property value="id"/></td>
          <td><s:property value="title"/></td>
          <td><a href="back/newspic_input?id=<s:property value="id"/>" class="button button-primary">编辑</a><a href="back/newspic_delete?id=<s:property value="id"/>" class="button button-danger">删除</a></td>
        </tr>
      </s:iterator>
      </tbody>
    </table>
</body>
</html>