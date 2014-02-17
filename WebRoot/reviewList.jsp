<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<p style="float:left;">添加评论：</p>
<div>
	<form id="fun_addReview_form">
	<input type="hidden" name="id" value="<s:property value="id"/>">
	<textarea id="fun_addReview_content" name="content" style="background:none; border:#FFF solid 1px;width:307px; height:100px;color:#FFF;"  rows="10" cols="10"></textarea>
	<button id="fun_addReview" style="float:right;background:#A628E1;border:0; border-radius:15px; font-size:16px;color:#FFF;padding-top:6px;padding-bottom:6px;padding-left:14px;padding-right:14px;margin-top:4px;">发表</button>
	</form>
	<div style="clear:both;"></div>
</div>
<p>评论列表：</p>
<hr style="margin-bottom:14px; margin-top:6px; color:#FFF;">
<s:iterator value="list">
<div style="width:100%;color:#FFF; font-size:14px;margin-bottom:20px;">
	<div style="width:80px;height:100%;float:left;margin-right:10px;">
		<img src="upload/studentlogo/<s:property value="student.logo"/>" style="width:80px; height:80px;">
	</div>
	<div style="width:300px;float:right;">
		<h3 style="font-size:18px;"><s:property value="student.name"/></h3>
		<p><s:property value="date"/></p>
		<p style="font-size:16px;"><s:property value="content"/></p>
	</div>
	<div style="clear:both;"></div>
</div>
</s:iterator>
<script>
$('#fun_addReview').click(function(){
	if($('#fun_addReview_content').val()==""){
		alert("请填写评价。");
		return false;
	}
	$.post("shouye_addReview",$('#fun_addReview_form').serialize(),function(data){
		alert(data);
		$('#fun_review').load('shouye_getReviews',{id:<s:property value="id"/>},function(){
		});
	})
	return false;
});
</script>
