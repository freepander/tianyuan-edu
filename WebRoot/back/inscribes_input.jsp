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
<title>真题编辑</title>
<link rel="stylesheet" href="back/assets/css/bui-min.css" type="text/css"></link>
<link rel="stylesheet" href="back/assets/css/dpl-min.css" type="text/css"></link>
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="ueditor/ueditor.all.js"></script>
</head>
<body>
	<form action="<s:if test="id!=0">back/inscribes_update</s:if><s:if test="id==0">back/inscribes_add</s:if>" method="post" class="form-horizontal well">
		<input type="hidden" name="id" value="<s:property value="inscribes.id"/>" />
		<div class="control-group">
           <label class="control-label"><s>*</s>名称：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="name" value="<s:property value="inscribes.name"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label"><s>*</s>图片：</label>
           <div class="controls">
           	<input id="pic" name="logo" value="<s:property value="inscribes.logo" />" class="input-normal control-text"  type="text" style="width:500px;" />
	  		<input type="button" value="点击上传" onclick="path.click()">
			<input type="file" name="uploadify" style="display:none;" id="path" onchange="upload_logo(this)">
		   </div>
         </div>
         <div class="control-group">
	<label class="control-label"><s>*</s>所属类别</label>
	<div class="controls">
		<select name="categoryId">
			<option value="<s:property value="inscribes.category.id"/>"><s:property value="inscribes.category.name"/></option>
		<s:iterator value="list">
			<option value="<s:property value="id"/>"><s:property value="category.name"/>--<s:property value="name"/></option>
		</s:iterator>
		</select>
	</div>
</div>
         <textarea name="content" id="myEditor" style="width:700px;height:700px;"><s:property value="inscribes.content"/></textarea>
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
	    //1.2.4以后可以使用一下代码实例化编辑器
	    UE.getEditor('myEditor');
	    
	    function upload_logo(a){
	    	var s_name=$(a).val();
	    	var s_names=s_name.split("\\");
	    	var s_name2=s_names[s_names.length-1];
	    	$('#pic').val(s_name2);
	    	$.ajaxFileUpload({
	    		url:'file_inscribes',
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