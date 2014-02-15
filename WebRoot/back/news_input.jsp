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
<title>title</title>
<link rel="stylesheet" href="back/assets/css/bui-min.css" type="text/css"></link>
<link rel="stylesheet" href="back/assets/css/dpl-min.css" type="text/css"></link>
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="ueditor/ueditor.all.js"></script>
</head>
<body>
	<form action="<s:if test="id!=0">back/news_update</s:if><s:if test="id==0">back/news_add</s:if>" method="post" class="form-horizontal well">
		<input type="hidden" name="id" value="<s:property value="news.id"/>" />
		<div class="control-group">
           <label class="control-label">新闻标题：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="title" value="<s:property value="news.title"/>" ></div>
         </div>
         <div class="control-group">
           <label class="control-label">标题颜色：</label>
           <div class="controls"><input class="input-normal control-text" type="text" name="color" value="<s:property value="news.color"/>" ></div>
           <label class="control-label">例：#ffddff</label>
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
         <textarea name="content" id="myEditor" style="width:700px;height:700px;"><s:property value="news.content"/></textarea>
         <div class="row">
           <div class="form-actions offset3">
             <button type="submit" class="button button-primary">保存</button>
             <button type="reset" class="button">重置</button>
           </div>
         </div>
	</form>
	<script type="text/javascript">
	    //1.2.4以后可以使用一下代码实例化编辑器
	    UE.getEditor('myEditor');
	</script>
</body>
</html>