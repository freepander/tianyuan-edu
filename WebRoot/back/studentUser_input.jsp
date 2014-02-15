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
<title>学生信息输入</title>
<link rel="stylesheet" href="back/assets/css/bui-min.css" type="text/css"></link>
<link rel="stylesheet" href="back/assets/css/dpl-min.css" type="text/css"></link></head>
<body>
	<form action="<s:if test="id!=0">back/studentUser_update</s:if><s:if test="id==0">back/studentUser_add</s:if>" method="post" class="form-horizontal well">
		<input name="id" type="hidden" value="<s:property value="studentUser.id" />">
		<div class="control-group">
           <label class="control-label">姓名：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="name" value="<s:property value="studentUser.name"/>" ></div>
        </div>
        <div class="control-group">
           <label class="control-label">性别：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="sex" value="<s:property value="studentUser.sex"/>" ></div>
        </div>
        <div class="control-group">
           <label class="control-label">年龄：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="age" value="<s:property value="studentUser.age"/>" ></div>
        </div>
        <div class="control-group">
           <label class="control-label">课程：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="lesson" value="<s:property value="studentUser.lesson"/>" ></div>
        </div>
        <div class="control-group">
           <label class="control-label">学校：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="school" value="<s:property value="studentUser.school"/>" ></div>
        </div>
        <div class="control-group">
           <label class="control-label">优先级：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="state" value="<s:property value="studentUser.state"/>" ></div>
        </div>
        <div class="control-group">
           <label class="control-label">电话：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="telphone" value="<s:property value="studentUser.telphone"/>" ></div>
        </div>
        <div class="control-group">
           <label class="control-label">时间：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="time" value="<s:property value="studentUser.time"/>" ></div>
        </div>
        <div class="control-group">
           <label class="control-label">价格：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="money" value="<s:property value="studentUser.money"/>" ></div>
        </div>
        
         <div class="control-group">
           <label class="control-label">logo：</label>
           <div class="controls">
           	<input id="pic" name="logo" value="<s:property value="studentUser.logo" />" class="input-normal control-text"  type="text" style="width:500px;" />
	  		<input type="button" value="点击上传" onclick="path.click()">
			<input type="file" name="uploadify" style="display:none;" id="path" onchange="upload_logo(this)">
		   </div>
         </div>
         <div class="control-group">
		  <label class="control-label">所属类别：</label>
		  <div class="controls">
		  	<select name="categoryId" style="width:500px">
		  		<option value='<s:property value="studentUser.category.id"/>'><s:property value="studentUser.category.name"/></option>
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
    		url:'file_studentLogo',
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