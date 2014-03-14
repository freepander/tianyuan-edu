<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <title>天源教育网</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="教育，英语，文化课，教育机构，哈尔滨，平台，家教，名师，咨询，书城，教育新闻">
    <meta name="description" content="哈尔滨天源教育咨询平台，找家教、赵老师、招学生、找培训就上天源教育平台。">
  </head>
  <body>
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
    <div id="sub-content">
    	<div class="recommend" style="color:#FFF; float:right;">
    		<h1 style="margin-bottom: 20px;">本周访问量：<s:property value="teacherUser.dianji"/></h1>
    		
    		<s:if test="teacherUser.ishuiyuan">
    			<img src="img/teachervip.png">
    			会员编号：<s:property value="teacherUser.huiyuannumber"/><br>剩余<s:property value="teacherUser.huiYuanDay"/>天到期。
    		</s:if>
    	</div>
    	<div class="gerenxinxi-div" style="width:300px;margin-left:70px;">
    		<input type="button" value="点击更换头像" onclick="path.click()" style="display:none;cursor:pointer; border:0px solid #FFF; border-left: none; border-right: none; width: 126px;  color: #FFF; font-size: 16px;;background:none; background: red; border-radius: 12px; padding-top: 2px; padding-bottom: 2px; font-weight: bold;position:absolute;top:230px; left:-108px;">
    		<input type="file" name="myFile" id="path" style="display:none" onchange="upload_logo(this)">
    		<img style="position:absolute;top:100px;left:-108px;" class="logo" src="upload/teacherlogo/<s:property value="teacherUser.logo"/>">
    		<div style="width: 300px;height:550px;overflow:auto;padding-top:60px;" id="fun_gerenxinxi_div">
    		<form action="" id="gerenxinxi-div-student-form">
    			<h2>个人信息<br><small>Personal information</small></h2>
    			<input type="hidden" name="id" value="<s:property value="teacherUser.id" />" />
	       		<fieldset>
					<label>授课类别:</label>
					<select disabled="disabled" name="categoryId">
							<option value='<s:property value="teacherUser.category.id"/>'><s:property value="teacherUser.category.name"/></option>
						<s:iterator value="list">
							<option value='<s:property value="id"/>'><s:property value="name"/></option>
						</s:iterator>
					</select>
				</fieldset>
	    		<fieldset>
	    			<label>讲授科目：</label><input disabled="disabled" name="lesson" value="<s:property value="teacherUser.lesson" />" type="text">
	    		</fieldset>
	    		<fieldset>
	    			<label>课时费用：</label><input disabled="disabled" name="money" value="<s:property value="teacherUser.money" />" type="text">
	    		</fieldset>
	    		<fieldset>
	    			<label>时间安排：</label><input disabled="disabled" name="time" value="<s:property value="teacherUser.time" />" type="text">
	    		</fieldset>
	    		<fieldset>
	    			<label>姓名:</label><input disabled="disabled" name="name" value="<s:property value="teacherUser.name" />" type="text">
	    		</fieldset>
	    		<fieldset>
	    			<label>性别：</label><input disabled="disabled" value="男" name="sex" type="radio" <s:if test="asex==true">checked</s:if> />男<input disabled="disabled" value="女" name="sex" type="radio" <s:if test="asex==false">checked</s:if> />女<br>
	    		</fieldset>
	    		<fieldset>
	    			<label>学历：</label><input disabled="disabled" name="post" value="<s:property value="teacherUser.post" />" type="text">
	    		</fieldset>
	    		<fieldset>
	    			<label>专业：</label><input disabled="disabled" name="post2" value="<s:property value="teacherUser.post2" />" type="text">
	    		</fieldset>
	    		<fieldset>
	    			<label>学校：</label><input disabled="disabled" name="political" value="<s:property value="teacherUser.political" />" type="text">
	    		</fieldset>
	    		<fieldset>
	    			<label>邮箱：</label><input disabled="disabled" name="email" value="<s:property value="teacherUser.email" />" type="text">
	    		</fieldset>
	    		<fieldset>
	    			<label>居住地：</label><input disabled="disabled" name="home" value="<s:property value="teacherUser.home" />" type="text">
	    		</fieldset>
	    		<fieldset>
	    			<label>家庭住址：</label><input disabled="disabled" name="address" value="<s:property value="teacherUser.address" />" type="text">
	    		</fieldset>
	    		<fieldset>
	    			<label>邮编：</label><input disabled="disabled" name="zipcode" value="<s:property value="teacherUser.zipcode" />" type="text">
	    		</fieldset>
	    		<fieldset>
	    			<label>电话：</label><input disabled="disabled" name="telphone" value="<s:property value="teacherUser.telphone" />" type="text">
	    		</fieldset>
	    		<fieldset>
	    			<label>QQ：</label><input disabled="disabled" name="qq" value="<s:property value="teacherUser.qq" />" type="text">
	    		</fieldset>
	    		<fieldset>
	    			<label>工作经历：</label><input disabled="disabled" name="experience" value="<s:property value="teacherUser.experience" />" type="text">
	    		</fieldset>
	    		<fieldset>
    				<label style="top: -60px; position: relative; height: 80px;">备注：</label><textarea disabled="disabled" name="recommend"><s:property value="teacherUser.recommend"/></textarea>
    			</fieldset>
	    		<input type="submit" id="post-message" value="保存修改" style="cursor:pointer;margin-top: 30px; display: none; border-top: 0px solid #FFF; border-bottom: 0px solid #FFF; padding-left: 10px; padding-right: 10px; padding-top: 4px; padding-bottom: 4px;  background: red; border-radius: 15px; color: #FFF; font-size: 14px; font-weight: bold;" />
	    		<input type="submit" id="open-input" style="cursor:pointer;margin-top: 30px; border-top: 0px solid #FFF; border-bottom: 0px solid #FFF; padding-left: 10px; padding-right: 10px; padding-top: 4px; padding-bottom: 4px; background: red; border-radius: 15px; color: #FFF; font-size: 14px; font-weight: bold;" value="更改信息" />
    		</form>
    		</div>
    		
    	</div>
    	
    </div>
    <script src="js/ajaxfileupload.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	$("#fun_gerenxinxi_div").mCustomScrollbar({
            scrollButtons:{
              enable:true
            }
          });
    });
    var freepander_width=$(window).width();
    if(freepander_width<1360){
    	$('body').css('overflow','scroll');
    	$('#content').width(1366).height(630);
    	$('body').width(1366).height(630);
    }
    $(window).resize(function(){
    	var freepander_width=$(window).width();
        if(freepander_width<1360){
        	$('body').css('overflow','scroll');
        	$('#content').width(1366).height(630);
        	$('body').width(1366).height(630);
        }else{
        	$('body').css('overflow','hidden');
        	$(window).width()
        	$(window).height()
        	$('body').width($(window).width()).height($(window).height());
        	$('#content').width($(window).width()).height($(window).height());
        }
    })
    $('#open-input').click(function(){
    	$("input[type='text']").removeAttr('disabled').css('border','1px solid #FFF');
    	$('select').removeAttr('disabled');
    	$('textarea').removeAttr('disabled');
    	$("input").removeAttr('disabled');
    	$("input[type='button']").show();
    	$('#btn_upload_logo').hide();
    	$(this).hide();
    	$('#post-message').show();
    	return false;
    })
    $('#post-message').click(function(){
    	$.post("shouye_updateTeacherMessage",$("#gerenxinxi-div-student-form").serialize(),function(data){
    		if(data=="success"){
    			alert("资料更新成功");
    			location.reload();
    		}
    	})
    	return false;
    });
    function upload_logo(form){
    	$.ajaxFileUpload({
  		  url:'fileUpload_teacherLogo',
  		  secureuri:false,
  		  fileElementId:'path',
  		  data:{id:'<s:property value="teacherUser.id"/>',username:'<s:property value="teacherUser.username"/>'},
  		  beforeSend:function(){
  		  },
  		  success: function (data, status){
  			  alert("头像更改成功。");
  			  location.reload();		  	    
  		  }
  		});
  	
  	return false;
    }
    //去除链接虚框
    $('a').bind('focus',function(){if(this.blur){ this.blur();}});
    //
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
    </script>
    
  </body>
</html>