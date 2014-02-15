<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
		<ul>
		<s:iterator value="list">
			<li>
	            <a href="jigou/<s:property value="url"/>">
	              <img src="upload/organizationlogo/<s:property value="logo"/>" />
	              <span><s:property value="name"/></span>
	            </a>
          </li>
		</s:iterator>
        </ul>