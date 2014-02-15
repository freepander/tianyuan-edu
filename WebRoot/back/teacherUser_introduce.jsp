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
<title>教师详情</title>
<link rel="stylesheet" href="back/assets/css/bui-min.css" type="text/css"></link>
<link rel="stylesheet" href="back/assets/css/dpl-min.css" type="text/css"></link>
<style>
p{margin-left: 60px;}
</style>
</head>

<body>
<div class="container">
<h1>姓名：<s:property value="teacherUser.name" /></h1>
<hr>
<h3>电话：<s:property value="teacherUser.telphone"/></h3>
<h3>qq:<s:property value="teacherUser.qq"/></h3>
<span>用户名：</span><p><s:property value="teacherUser.username"/></p>
<span>性别：</span><p><s:property value="teacherUser.sex"/></p>
<span>授课类别:</span><p><s:property value="teacherUser.category.name"/></p>
<span>讲授科目:</span><p><s:property value="teacherUser.lesson"/></p>
<span>课时费用:</span><p><s:property value="teacherUser.money"/></p>
<span>时间安排:</span><p><s:property value="teacherUser.time"/></p>
<span>学历:</span><p><s:property value="teacherUser.post"/></p>
<span>专业:</span><p><s:property value="teacherUser.post2"/></p>
<span>学校:</span><p><s:property value="teacherUser.political"/></p>
<span>邮箱:</span><p><s:property value="teacherUser.email"/></p>
<span>居住地:</span><p><s:property value="teacherUser.home"/></p>
<span>邮编:</span><p><s:property value="teacherUser.zipcode"/></p>
<span>家庭住址:</span><p><s:property value="teacherUser.address"/></p>
<span>备注：</span><p><s:property value="teacherUser.recommend"/></p>
<span>本周点击量：</span><p><s:property value="teacherUser.dianji"/></p>
</div>
</body>
</html>