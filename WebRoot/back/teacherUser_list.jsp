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
<title>老师用户列表</title>
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
          <th>职位</th>
          <th>科目</th>
          <th>是否是会员/会员编号</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
      <s:iterator value="list">
        <tr>
          <td><s:property value="id"/></td>
          <td><s:property value="name"/></td>
          <td><s:property value="post"/></td>
          <td><s:property value="lesson"/></td>
          <td><s:if test="ishuiyuan"><s:property value="huiyuannumber"/></s:if><s:if test="!ishuiyuan">否</s:if></td>
          <td>
          	<a href="back/teacherUser_introduce?id=<s:property value="id"/>" class="button button-primary">详细信息</a>
          	<a href="back/teacherUser_delete?id=<s:property value="id"/>" class="button button-danger">删除</a>
          	<s:if test="ishuiyuan">
          		<a href="back/teacherUser_setHuiyuan2?id=<s:property value="id"/>" class="button button-danger">取消会员</a>
          	</s:if>
          	<s:if test="!ishuiyuan">
          		<a href="back/teacherUser_setHuiyuan?id=<s:property value="id"/>" class="button button-normal">设置为会员</a>
          	</s:if>
          	<a href="back/teacherUser_input?id=<s:property value="id"/>" class="button button-primary">更改信息</a>
          	</td>
        </tr>
      </s:iterator>
      </tbody>
    </table>
    <div>
      
    </div>
</body>
</html>