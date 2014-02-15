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
<title>教师用户信息输入</title>
<link rel="stylesheet" href="back/assets/css/bui-min.css" type="text/css"></link>
<link rel="stylesheet" href="back/assets/css/dpl-min.css" type="text/css"></link></head>
<body>
	<form action="<s:if test="id!=0">back/teacherUser_update</s:if><s:if test="id==0">back/teacherUser_add</s:if>" method="post" class="form-horizontal well">
		<input type="hidden" name="id" value="<s:property value="teacherUser.id"/>" />
		<div class="control-group">
           <label class="control-label">教师姓名：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="name" value="<s:property value="teacherUser.name"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">性别：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="sex" value="<s:property value="teacherUser.sex"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">电话：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="telphone" value="<s:property value="teacherUser.telphone"/>" ></div>
         </div>
         <div class="control-group">
          <label class="control-label">QQ：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="qq" value="<s:property value="teacherUser.qq"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">用户名：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="username" value="<s:property value="teacherUser.username"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">密码：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="password" value="<s:property value="teacherUser.password"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">科目：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="lesson" value="<s:property value="teacherUser.lesson"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">课时费用：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="money" value="<s:property value="teacherUser.money"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">时间安排：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="time" value="<s:property value="teacherUser.time"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">学历：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="post" value="<s:property value="teacherUser.post"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">专业：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="post2" value="<s:property value="teacherUser.post2"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">学校：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="political" value="<s:property value="teacherUser.political"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">邮箱：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="email" value="<s:property value="teacherUser.email"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">居住地：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="address" value="<s:property value="teacherUser.address"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">邮编：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="zipcode" value="<s:property value="teacherUser.zipcode"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">家庭住址：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="home" value="<s:property value="teacherUser.home"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">备注：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="recommend" value="<s:property value="teacherUser.recommend"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">本周点击量：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="dianji" value="<s:property value="teacherUser.dianji"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">教师头像：</label>
           <div class="controls">
           	<input id="pic" name="logo" value="<s:property value="teacherUser.logo" />" class="input-normal control-text"  type="text" style="width:500px;" />
	  		<input type="button" value="点击上传" onclick="path.click()">
			<input type="file" name="uploadify" style="display:none;" id="path" onchange="upload_logo(this)">
		   </div>
         </div>
         <div class="control-group">
		  <label class="control-label">所属类别：</label>
		  <div class="controls">
		  	<select name="categoryId" style="width:500px">
		  		<option value='<s:property value="teacherUser.category.id"/>'><s:property value="teacherUser.category.name"/></option>
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