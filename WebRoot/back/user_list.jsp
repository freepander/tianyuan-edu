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
<title>用户管理管理</title>
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
          <th width="15">#</th>
          <th>用户名</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
      <s:iterator value="list">
        <tr>
          <td><s:property value="id"/></td>
          <td><s:property value="username"/></td>
          <td>
          	<a href="back/user_input?id=<s:property value="id"/>" class="button button-primary">更改密码</a>
          	<a href="back/user_delete?id=<s:property value="id"/>" class="button button-danger">删除</a></td>
        </tr>
      </s:iterator>
      </tbody>
    </table>
    <div class="container">
    <form action="back/user_add" method="post">
    	<legend>添加新用户</legend>
    	<div class="control-group">
    		<label class="control-label">用户名:</label>
    		<div class="controls">
    			<input type="text" name="username" />
    		</div>
    	</div>
    	<div class="control-group">
    		<label class="control-label">密码:</label>
    		<div class="controls">
    			<input type="password" name="password" />
    		</div>
    	</div>
    	<div class="row actions-bar">
    		<div class="form-actions span13 offset3">
    			<button type="submit" class="button button-primary">保存</button>
    			<button type="reset" class="button">重置</button>
    		</div>
    	</div>
    </form>
    </div>
</body>
</html>