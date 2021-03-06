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
<title>教师信息输入</title>
<link rel="stylesheet" href="back/assets/css/bui-min.css" type="text/css"></link>
<link rel="stylesheet" href="back/assets/css/dpl-min.css" type="text/css"></link></head>
<body>
	<form action="<s:if test="id!=0">back/teacher_update</s:if><s:if test="id==0">back/teacher_add</s:if>" method="post" class="form-horizontal well">
		<input type="hidden" name="id" value="<s:property value="teacher.id"/>" />
		<div class="control-group">
           <label class="control-label">教师名称：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="name" value="<s:property value="teacher.name"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">教师介绍链接：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="url" value="<s:property value="teacher.url"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">教师职务：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="post" value="<s:property value="teacher.post"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">教师意向课程：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="lesson" value="<s:property value="teacher.lesson"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">优先级：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="priority" value="<s:property value="teacher.priority"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">头像：</label>
           <div class="controls">
           	<input id="pic" name="logo" value="<s:property value="teacher.logo" />" class="input-normal control-text"  type="text" style="width:500px;" />
	  		<input type="button" value="点击上传" onclick="path.click()">
			<input type="file" name="uploadify" style="display:none;" id="path" onchange="upload_logo(this)">
		   </div>
         </div>
         <div class="control-group">
		  <label class="control-label">所属类别：</label>
		  <div class="controls">
		  	<select name="categoryId" style="width:500px">
	      	<s:iterator value="categoryList">
	      		<option value='<s:property value="id"/>'><s:property value="name"/></option>
	      	</s:iterator>
	      	</select>
		  </div>
		</div>
         <div class="row">
           <div class="form-actions offset3">
             <button type="submit" class="button button-primary">保存</button>
             <button type="reset" class="button">重置</button>
           </div>
         </div>
	</form>
	<script type="text/javascript" src="back/assets/js/jquery.js"></script>
	<script src="js/ajaxfileupload.js"></script>
	<script type="text/javascript">
	function upload_logo(a){
    	var s_name=$(a).val();
    	var s_names=s_name.split("\\");
    	var s_name2=s_names[s_names.length-1];
    	$('#pic').val(s_name2);
    	$.ajaxFileUpload({
    		url:'file_teacherLogo',
    		secureuri:false,
    		fileElementId:'path',
    		data:{uploadifyFileName:s_name2},
    		beforeSend:function(){
    		},
    		success: function(){
    			alert("上传成功"); 
    		}
    	});
    	return false;
    }
		
    </script>
</body>
</html>