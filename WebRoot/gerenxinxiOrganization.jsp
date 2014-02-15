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
    <link href="css/style.css" rel="stylesheet" media="screen">
    <link href="css/slideshow.css" rel="stylesheet" />
    <link href="css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
    <script src="js/slideshow.js" type="text/javascript"></script>
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
    	<div class="gerenxinxi-div">
    		<div id="organization-number">
	  			<h1>本周访问量：<s:property value="organization.look"/></h1>
	  			<h1></h1>
	  		</div>
    		<form action="" id="gerenxinxi-div-student-form">
    		<input type="hidden" name="id" value="<s:property value="organization.id" />" />
    		<h2>企业信息<br><small>Organization information</small></h2>
    		<img class="logo" src="upload/organizationlogo/<s:property value="organization.logo"/>">
    		<fieldset>
    			<label>密码：</label><input disabled="disabled" name="password" value="<s:property value="organization.password" />" type="text">
    		</fieldset>
			<fieldset>
				<label>机构行业:</label>
				<select name="industryId" disabled="disabled">
					<option value='<s:property value="organization.industry.id"/>'><s:property value="organization.industry.name"/></option>
					<s:iterator value="listT">
						<option value='<s:property value="id"/>'><s:property value="name"/></option>
					</s:iterator>
				</select>
			</fieldset>
			<fieldset>
				<label>机构区域:</label>
				<select name="regionalId" disabled="disabled">
					<option value='<s:property value="organization.regional.id"/>'><s:property value="organization.regional.name"/></option>
					<s:iterator value="listT2">
						<option value='<s:property value="id"/>'><s:property value="name"/></option>
					</s:iterator>
				</select>
			</fieldset>
    		<fieldset>
    			<label>机构名称:</label><input name="name" value="<s:property value="organization.name" />" type="text">
    		</fieldset>
    		<fieldset>
    			<label>机构介绍：</label><br><textarea disabled="disabled" name="introduce"><s:property value="organization.introduce" /></textarea>
    		</fieldset>
    		</form>
    		<a href='javascript:void(0);' onclick="openInput(this)" style="display:block; margin-top: 20px; width: 60px; border-top: 0px solid #FFF; border-bottom: 0px solid #FFF; padding-left: 10px; padding-right: 10px; padding-top: 4px; padding-bottom: 4px; background: red; border-radius: 15px; color: #FFF; font-size: 14px;">点击修改</a>
    		<input style="display:none;cursor:pointer;margin-top: 20px; width: 80px; border-top: 0px solid #FFF; border-bottom: 0px solid #FFF; padding-left: 10px; padding-right: 10px; padding-top: 4px; padding-bottom: 4px; background: red; border-radius: 15px; color: #FFF; font-size: 14px;" id="savechange" type="submit" onclick="javascript:submitMessage()" value="保存修改" />
    	</div>
    	
    </div>
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript">
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
    function openInput(a){
    	$("input[type='text']").removeAttr('disabled')
    	$('select').removeAttr('disabled');
    	$('textarea').removeAttr('disabled');
    	$('#savechange').show();
    	$(a).hide();
    }
    function submitMessage(){
    	$.post("shouye_updateOrganizationMessage",$("#gerenxinxi-div-student-form").serialize(),function(data){
    		if(data=="success"){alert("资料更新成功");}
    	})
    	return false;
    }
    //去除链接虚框
    $('a').bind('focus',function(){if(this.blur){ this.blur();}});
    //
    $('#sub-circle1').click(function() {
      $('#content').hide().html("").load('index_zhuye').show(400);
      location.hash="zhuye";
      return false;
    });
    $('#sub-circle2').click(function() {
      $('#content').hide().html("").load('index_zhaoxuesheng').show(400);
      location.hash="xuesheng";
      return false;
    });
    $('#sub-circle3').click(function() {
      $('#content').hide().html("").load('index_zhaolaoshi').show(400);
      location.hash="laoshi";
      return false;
    });
    $('#sub-circle4').click(function() {
      $('#content').hide().html("").load('index_zhaojigou').show(400);
      location.hash="jigou";
      return false;
    });
    $('#sub-circle5').click(function() {
      $('#content').hide().html("").load('index_zhaoyouhui').show(400);
      location.hash="youhui";
      return false;
    });
    $('#sub-circle6').click(function() {
      $('#content').hide().html("").load('index_huodongzhaopian').show(400);
      location.hash="zhaopian";
      return false;
    });
    $('#sub-circle7').click(function() {
      $('#content').hide().html("").load('index_zaixianliuyan').show(400);
      location.hash="liuyan";
      return false;
    });
    </script>
    
  </body>
</html>