<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<ul>
<s:iterator value="list">
	<li><p><s:property value="name" /></p><img src="upload/books/<s:property value="logo" />"></li>
</s:iterator>
</ul>