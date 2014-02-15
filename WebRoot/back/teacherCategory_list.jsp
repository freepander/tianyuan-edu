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
<title>老师类别管理</title>
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
          <th>名称</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
      <s:iterator value="list">
        <tr>
          <td><s:property value="id"/></td>
          <td><s:property value="name"/></td>
          <td><a href="back/teacherCategory_input?id=<s:property value="id"/>" class="button button-primary">编辑</a><a href="back/teacherCategory_delete?id=<s:property value="id"/>" class="button button-danger">删除</a></td>
        </tr>
      </s:iterator>
      </tbody>
    </table>
    <form action="back/teacherCategory_add" method="post">
    	<legend>添加老师类别</legend>
    	<div class="control-group">
    		<label class="control-label">名称:</label>
    		<div class="controls">
    			<input type="text" name="name" />
    		</div>
    	</div>
    	<div class="row actions-bar">
    		<div class="form-actions span13 offset3">
    			<button type="submit" class="button button-primary">保存</button>
    			<button type="reset" class="button">重置</button>
    		</div>
    	</div>
    </form>
</body>
</html>