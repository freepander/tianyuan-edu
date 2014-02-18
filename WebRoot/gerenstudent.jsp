<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<span class="copyright2">Copyright© tianyuan.com All rights reserved.黑ICP备09094706</span>
<a href="index.jsp"  class="left-back"> </a>
<div id="sub-nav">
	<a id="sub-circle1" href="javascript:void(0);"> </a>
	<a id="sub-circle2" href="javascript:void(0);"> </a>
	<a id="sub-circle3" href="javascript:void(0);"> </a>
	<a id="sub-circle4" href="javascript:void(0);"> </a>
	<a id="sub-circle5" href="javascript:void(0);"> </a>
	<a id="sub-circle6" href="javascript:void(0);"> </a>
	<a id="sub-circle7" href="javascript:void(0);"> </a>
</div>
<div id="sub-content" style="padding-top:60px;">
	<div style="width: 300px;  float:right;color:#FFF; height:556px; overflow:hidden;">
		<h2 style="margin-bottom:20px;">相似需求学生</h2>
		<s:iterator value="list">
		<div class="fun_opengerenxinxi" style="height:170px;overflow:hidden;" data-id="<s:property value="id"/>">
			<a href="javascript:void(0);" style="border:0;">
				<img src="upload/studentlogo/<s:property value="logo"/>" style="width:140px; height:140px;">
				<p style="color:#FFF;text-align:center; width:140px;"><s:property value="name"/></p>
			</a>
		</div>
		</s:iterator>
	</div>
	<div style="width:400px; height:540px; margin-left:-68px;">
		<div class="geren_row" style="color:#FFF;">
			<img src="upload/studentlogo/<s:property value="studentUser.logo"/>" style="position:absolute; left:-110px; top:135px;width:100px; height:100px;">
			<h2 style="margin-bottom:20px;">个人信息<br><small>Personal information</small></h2>
			<p style="margin-bottom:8px;font-size:16px;">姓名：<s:property value="studentUser.name"/></p>
			<p style="margin-bottom:8px;font-size:16px;">性别：<s:property value="studentUser.sex"/></p>
			<p style="margin-bottom:8px;font-size:16px;">课程：<s:property value="studentUser.lesson"/></p>
			<p style="margin-bottom:8px;font-size:16px;">时间安排：<s:property value="studentUser.time"/></p>
			<p style="margin-bottom:8px;font-size:16px;">预期费用：<s:property value="studentUser.money"/></p>
			<p style="margin-bottom:8px;font-size:16px;">年龄：<s:property value="studentUser.age"/></p>
			<p style="margin-bottom:8px;font-size:16px;">学校：<s:property value="studentUser.school"/></p>
			<p style="margin-bottom:8px;font-size:16px;">邮箱：<s:property value="studentUser.email"/></p>
			<p style="margin-bottom:8px;font-size:16px;">备注：<s:property value="studentUser.recommend"/></p>
		</div>
		<a href="javascript:ib_wopen();" style="border:0;background:#A628E1;color:#FFF;margin-right:10px; font-size:20px;padding-left:10px; padding-right:10px; padding-top:4px; padding-bottom:4px; border-radius:10px;cursor:pointer; top:-73px; left:-84px; position:relative;">预约</a>
	</div>
</div>
<script>
$('#sub-circle1').click(function() {
    $('#content').hide().load('index_zhuye').show(400);
    location.hash="zhuye";
    return false;
  });
  $('#sub-circle2').click(function() {
    $('#content').hide().load('index_zhaoxuesheng').show(400);
    location.hash="xuesheng";
    return false;
  });
  $('#sub-circle3').click(function() {
    $('#content').hide().load('index_zhaolaoshi').show(400);
    location.hash="laoshi";
    return false;
  });
  $('#sub-circle4').click(function() {
    $('#content').hide().load('index_zhaojigou').show(400);
    location.hash="jigou";
    return false;
  });
  $('#sub-circle5').click(function() {
    $('#content').hide().load('index_zhaoyouhui').show(400);
    location.hash="youhui";
    return false;
  });
  $('#sub-circle6').click(function() {
    $('#content').hide().load('index_huodongzhaopian').show(400);
    location.hash="zhaopian";
    return false;
  });
  $('#sub-circle7').click(function() {
    $('#content').hide().load('index_zaixianliuyan').show(400);
    location.hash="liuyan";
    return false;
  });
  $('.fun_opengerenxinxi').click(function(){
	  var id=$(this).attr('data-id');
      $('#content').load("shouye_gerenstudent",{id: id},function() {
      	
      }).show(400);
  })
	
</script>
