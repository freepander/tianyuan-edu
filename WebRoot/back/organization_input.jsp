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
<title>机构管理</title>
<link rel="stylesheet" href="back/assets/css/bui-min.css" type="text/css"></link>
<link rel="stylesheet" href="back/assets/css/dpl-min.css" type="text/css"></link></head>
<body>
	<form action="<s:if test="id!=0">back/organization_update</s:if><s:if test="id==0">back/organization_add</s:if>" method="post" class="form-horizontal well">
		<input type="hidden" name="id" value="<s:property value="organization.id"/>" />
		<div class="control-group">
           <label class="control-label">机构名称：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="name" value="<s:property value="organization.name"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">机构用户名：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="username" value="<s:property value="organization.username"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">机构密码：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="password" value="<s:property value="organization.password"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">机构链接：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="url" value="<s:property value="organization.url"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">优先级：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="priority" value="<s:property value="organization.priority"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">logo：</label>
           <div class="controls">
           	<input id="pic" name="logo" value="<s:property value="organization.logo" />" class="input-normal control-text"  type="text" style="width:500px;" />
	  		<input type="file" name="uploadify" id="logofile">
		   </div>
         </div>
         <div class="control-group">
		  <label class="control-label">所属区域：</label>
		  <div class="controls">
		  	<select name="regionalId" style="width:500px">
		  		<option value='<s:property value="organization.regional.id"/>'><s:property value="organization.regional.name"/></option>
	      	<s:iterator value="regionalList">
	      		<option value='<s:property value="id"/>'><s:property value="name"/></option>
	      	</s:iterator>
	      	</select>
		  </div>
		</div>
		<div class="control-group">
		  <label class="control-label">所属行业：</label>
		  <div class="controls">
		  	<select name="industryId" style="width:500px">
		  		<option value='<s:property value="organization.industry.id"/>'><s:property value="organization.industry.name"/></option>
	      	<s:iterator value="industryList">
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
	<script type="text/javascript" src="back/assets/js/swfobject.js"></script>
	<script type="text/javascript" src="back/assets/js/jquery.uploadify.v2.0.1.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function(){
			$("#logofile").uploadify({
				onSelect :function(event,ID,fileObj){
					$("#pic").val(fileObj.name);
				},
				'uploader'       : 'back/assets/uploadify/uploadify.swf',
				'script'         : 'file/file_organizationlogo',
				'cancelImg'      : 'back/assets/uploadify/cancel.png',
				'folder'         : '/uploads',     	
				'auto'           : true, //是否自动开始  
        		'multi'          : false, //是否支持多文件上传  
				'buttonText'     : '浏览', //按钮上的文字  
        		'simUploadLimit' : 1, //一次同步上传的文件数目  
        		'sizeLimit'      : 204800000000000, //设置单个文件大小限制，单位为byte  
        		'queueSizeLimit' : 1, //队列中同时存在的文件个数限制  
        		'fileDataName'   : 'uploadify',
        		'displayData'    : 'percentage',
        		'fileDesc'       : '请选择文件', //如果配置了以下的'fileExt'属性，那么这个属性是必须的  
        		'fileExt'        : '*.*', //允许的格式
				'height'         : 22,   //设置浏览按钮的宽度 ，默认值：110
				'width'          : 100,//设置浏览按钮的高度 ，默认值：30。  
				'simUploadLimit' : 1, //允许同时上传的个数 默认值：1 。 
				'wmode'          : 'transparent' ,  
				onComplete       : function (event, queueID, fileObj, response, data){
				},  
				onAllComplete       : function (event,data){ 
					var tips ="恭喜您，您上传了"+data.filesUploaded+",个文件，平均上传速率  "+data.speed+" kb/s";
					alert(tips);
					console.log(data);
				},      
				onError          : function(event, queueID, fileObj){ 
					alert("文件:" + fileObj.name + " 上传失败");} 
        		}
			);			
        });
    </script>
    
</body>
</html>