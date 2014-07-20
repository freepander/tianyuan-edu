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
<title>学生列表</title>
<link rel="stylesheet" href="back/assets/css/bui-min.css" type="text/css"></link>
<link rel="stylesheet" href="back/assets/css/dpl-min.css" type="text/css"></link></head>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<body>
	<div class="tips tips-small tips-warning">
       <div class="tips-content"><s:property value="message"/>
       </div>
    </div>
	<table cellspacing="0" class="table table-bordered">
      <thead>
      	<tr>
      		<th colspan="5">
		        <ul class="toolbar">
		          <li><a href="back/studentUser_input" class="button button-success">添加</a></li>
		          <li><a id="fun_piliangshanchu" href="javascript:void(0);" class="button button-danger">批量删除</a></li>
		        </ul>
	    	</th>
	    </tr>
        <tr>
          <th width="15"></th>
          <th>#</th>
          <th>名称</th>
          <th>学生性别</th>
          <th>天源备注</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
      <form id="fun_table" method="post" action="back/studentUser_deletes">
      <s:iterator value="list" status="st">
        <tr>
          <td><input type="checkbox" name="idList2" value="<s:property value="id"/>"></td>
          <td><s:property value="id"/></td>
          <td><s:property value="name"/></td>
          <td><s:property value="sex"/></td>
          <td><s:property value="beizhu"/></td>
          <td>
          	<a href="back/studentUser_input?id=<s:property value="id"/>" class="button button-primary">编辑</a>
          	<a href="back/studentUser_delete?id=<s:property value="id"/>" class="button button-danger">删除</a>
          	<s:if test="newcome">
          		<a href="back/studentUser_becomeOld?id=<s:property value="id"/>" class="button button-danger">新用户，请关注</a>
          	</s:if>
          </td>
        </tr>
      </s:iterator>
      </form>
      </tbody>
    </table>
    <script>
    $('#fun_piliangshanchu').click(function(){
    	if (!confirm("确认要删除？")) {
            return false;
        }
    	var chk_value=[];
    	$('input[name="idList2"]:checked').each(function(){
    		chk_value.push($(this).val())
    	})
    	//$('#fun_table').submit();
    	//console.log(chk_value)
    	//$.get("back/studentUser_deletes",$('#fun_table').serialize(),function(){
    		
    	$.get("back/studentUser_deletes",{idList2:chk_value},function(){
    	})
    	return false;
    	
    });
    </script>
</body>
</html>