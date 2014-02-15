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
<title>图书管理</title>
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
		          <li><a href="back/book_input" class="button button-success">添加</a></li>
		        </ul>
	    	</th>
	    </tr>
        <tr>
          <th width="15">#</th>
          <th>名称</th>
          <th>图片</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
      <s:iterator value="pageModel.objects">
        <tr>
          <td><s:property value="id"/></td>
          <td><s:property value="name"/></td>
          <td><a href="upload/books/<s:property value="logo"/>"><s:property value="logo"/></a></td>
          <td><a href="back/book_input?id=<s:property value="id"/>" class="button button-primary">编辑</a><a href="back/book_delete?id=<s:property value="id"/>" class="button button-danger">删除</a></td>
        </tr>
      </s:iterator>
      </tbody>
    </table>
    <div>
      <div class="pagination pull-right">
        <ul>
	    	<s:if test="pageNum==1">
	    		<li class="disabled"><a >首页</a></li>
		    	<li class="disabled"><a >上一页</a></li>
		    </s:if>
		    <s:else>
		    	<li><a href="<s:property value="pageModel.url" />1">首页</a></li>
		    	<li><a href="<s:property value="pageModel.url" /><s:property value="pageNum-1" />">上一页</a></li>
		    </s:else>
		    <s:iterator value="pageModel.pageNumList" >
		    	<li><a href="<s:property value="pageModel.url" /><s:property />"> <s:property /> </a></li>
		    </s:iterator>
		    <s:if test="pageNum==pageModel.countPage" >
		    	<li class="disabled"><a >下一页</a></li>
		    	<li class="disabled"><a >尾页</a></li>
		    </s:if>
		    <s:else>
		    	<li><a href="<s:property value="pageModel.url" /><s:property value="pageNum+1" /> ">下一页</a></li>
		    	<li><a href="<s:property value="pageModel.url" /><s:property value="pageModel.countPage" /> ">尾页</a></li>
		    </s:else>
	    </ul>
      </div>
    </div>
</body>
</html>