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
	<s:if test="list.size()!=0">
	<div style="width: 300px;  float:right;color:#FFF; height:556px; overflow:hidden;">
		<h2 style="margin-bottom:20px;">相同科目老师</h2>
		<s:iterator value="list">
		<div class="fun_opengerenxinxi" style="height:170px;overflow:hidden;" data-id="<s:property value="id"/>">
			<a href="javascript:void(0);" style="border:0;">
				<img src="upload/teacherlogo/<s:property value="logo"/>" style="width:140px; height:140px;">
				<p style="color:#FFF;text-align:center; width:140px;"><s:property value="name"/></p>
			</a>
		</div>
		</s:iterator>
	</div>
	</s:if>
	<div style="width:500px; height:540px; margin-left:-68px; color:#FFF;">
		<img src="upload/teacherlogo/<s:property value="teacherUser.logo"/>" style="position:absolute; left:-110px; top:135px;width:100px; height:100px;">
		<div style="width:400px; height:530px;overflow:auto;"  id="fun_gerenxinxis_div">
		
		<h2 style="margin-bottom:20px;">个人信息<br><small>Personal information</small></h2>
		<p style="margin-bottom:8px;font-size:16px;">姓名：<s:property value="teacherUser.name"/></p>
		<p style="margin-bottom:8px;font-size:16px;">性别：<s:property value="teacherUser.sex"/></p>
		<p style="margin-bottom:8px;font-size:16px;">讲授科目：<s:property value="teacherUser.lesson"/></p>
		<p style="margin-bottom:8px;font-size:16px;">课时费用：<s:property value="teacherUser.money"/></p>
		<p style="margin-bottom:8px;font-size:16px;">时间安排：<s:property value="teacherUser.time"/></p>
		<p style="margin-bottom:8px;font-size:16px;">学校：<s:property value="teacherUser.political"/></p>
		<p style="margin-bottom:8px;font-size:16px;">学历：<s:property value="teacherUser.post"/></p>
		<p style="margin-bottom:8px;font-size:16px;">专业：<s:property value="teacherUser.post2"/></p>
		<p style="margin-bottom:8px;font-size:16px;">邮箱：<s:property value="teacherUser.email"/></p>
		<p style="margin-bottom:8px;font-size:16px;">居住地：<s:property value="teacherUser.home"/></p>
		<p style="margin-bottom:8px;font-size:16px;">家庭住址：<s:property value="teacherUser.address"/></p>
		<p style="margin-bottom:8px;font-size:16px;">邮编：<s:property value="teacherUser.zipcode"/></p>
		<p style="margin-bottom:8px;font-size:16px;">QQ：<s:property value="teacherUser.qq"/></p>
		<p style="margin-bottom:8px;font-size:16px;">工作经历：<s:property value="teacherUser.experience"/></p>
		<p style="margin-bottom:8px;font-size:16px;">备注：<s:property value="teacherUser.recommend"/></p>
		<div class="service_rating">
		<p style="float:left;">评分：</p>
			<div style=" width:330px; float:right;">
				<div id="socure">
				</div>
			</div>
		</div>
		</div>
	</div>
	<a href="javascript:ib_wopen();" style="border:0;background:#A628E1;color:#FFF;margin-right:10px; font-size:20px;padding-left:10px; padding-right:10px; padding-top:4px; padding-bottom:4px; border-radius:10px;cursor:pointer; top:-348px; left:-84px; position:relative;">预约</a>
</div>
<script type="text/javascript">
$('#socure').raty({score: 3,number:10,width:260});
</script>
<script>

$("#fun_gerenxinxis_div").mCustomScrollbar({
	scrollButtons:{
		enable:true
	}
});
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
      $('#content').load("shouye_gerenteacher",{id: id},function() {
      	
      }).show(400);
  })
</script>
