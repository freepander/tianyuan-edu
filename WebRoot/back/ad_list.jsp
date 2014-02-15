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
<title>首页广告管理</title>
<link rel="stylesheet" href="back/assets/css/bui-min.css" type="text/css"></link>
<link rel="stylesheet" href="back/assets/css/dpl-min.css" type="text/css"></link></head>
<body>
	<form action="back/ad_update" method="post" class="form-horizontal well">
		<div class="control-group">
           <label class="control-label">广告链接</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="url" value="<s:property value="ad.url"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">图片：</label>
           <div class="controls">
           	<input id="pic" name="pic" value="<s:property value="ad.pic" />" class="input-normal control-text"  type="text" style="width:500px;" />
	  		<input type="button" value="点击上传" onclick="path.click()">
			<input type="file" name="uploadify" style="display:none;" id="path" onchange="upload_logo(this)">
		   </div>
		   <label class="control-label">图片大小：750px*144px</label>
         </div>
         <div class="row">
           <div class="form-actions offset3">
             <button type="submit" class="button button-primary">保存</button>
           </div>
         </div>
	</form>
	<script type="text/javascript" src="back/assets/js/jquery.js"></script>
	<script src="js/ajaxfileupload.js"></script>
	<script type="text/javascript">
	function upload_logo(a){
		var timestamp=new Date().getTime()
    	var s_name=$(a).val();
    	var s_names=s_name.split("\\");
    	var s_name2=s_names[s_names.length-1];
    	$('#pic').val(s_name2);
    	$.ajaxFileUpload({
    		url:'file_booklogo',
    		secureuri:false,
    		fileElementId:'path',
    		data:{uploadifyFileName: s_name2},
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