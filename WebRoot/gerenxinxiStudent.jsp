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
    	<div class="recommend" style="width:300px;">
    		<h2>每日推荐<br><small>The recommended daliy</small></h2>
    		<ul style="float:left;width:150px;">
    		<s:iterator value="listT">
    			<li style="width:150px;"><a href="jigou/<s:property value="url" />"><img src="upload/organizationlogo/<s:property value="logo" />"></a></li>
    		</s:iterator>
    		</ul>
    		<ul style="float:right;width:150px;height:470px;overflow:hidden;">
    		<s:iterator value="listT3">
    			<li style="width:150px;"><a target="_blank" href="teacher/<s:property value="url"/>"><img src="upload/teacherlogo/<s:property value="logo" />"></a></li>
    		</s:iterator>
    		<s:iterator value="listT2">
    			<li style="width:150px;"><a class="fun_opengeren" data-id="<s:property value="id"/>" href="javascript:void(0);"><img src="upload/teacherlogo/<s:property value="logo" />"></a></li>
    		</s:iterator>
    		</ul>
    		
    		
    	</div>
    	<img class="logo" style="position:absolute; top: 100px; left: -102px;width: 100px; height: 100px;" src="upload/studentlogo/<s:property value="studentUser.logo"/>">
    	<input type="button" value="点击更换头像" onclick="path.click()" style="position:absolute;top:227px;left:-92px;cursor:pointer;display:none;border:0px solid #FFF; border-left: none; border-right: none; width: 126px;  color: #FFF; font-size: 16px;;background: red; padding-top: 2px; padding-bottom: 2px; border-radius: 14px;">
    	<input type="file" name="myFile" id="path" style="display:none" onchange="upload_logo(this)">
    	<div class="gerenxinxi-div" style="padding-top:60px;width:300px;">
    		<div id="fun_gerenxinxi_div" style="height: 580px; width: 300px;; overflow:auto;">
    		<form action="shouye_updateStudentMessage" id="gerenxinxi-div-student-form">
    			<input name="id" value="<s:property value="studentUser.id"/>" type="hidden">
    			<h2>个人信息<br><small>Personal information</small></h2>
       		<fieldset>
				<label>学习类别:</label>
				<select name="categoryId" disabled="disabled">
					<option value='<s:property value="studentUser.category.id"/>'><s:property value="studentUser.category.name"/></option>
					<s:iterator value="list">
						<option value='<s:property value="id"/>'><s:property value="name"/></option>
					</s:iterator>
				</select>
			</fieldset>
    		<fieldset>
    			<label>意向科目：</label><input disabled="disabled" name="lesson" value="<s:property value="studentUser.lesson" />" type="text">
    		</fieldset>
    		<fieldset>
    			<label>课时费用：</label><input disabled="disabled" name="money" value="<s:property value="studentUser.money" />" type="text">
    		</fieldset>
    		<fieldset>
    			<label>时间安排：</label><input disabled="disabled" name="time" value="<s:property value="studentUser.time" />" type="text">
    		</fieldset>
    		<fieldset>
    			<label>姓名:</label><input disabled="disabled" name="name" value="<s:property value="studentUser.name" />" type="text">
    		</fieldset>
    		<fieldset>
    			<label>性别：</label><input disabled="disabled" value="男" name="sex" type="radio" <s:if test="asex==true">checked</s:if> />男<input disabled="disabled" value="女" name="sex" type="radio" <s:if test="asex==false">checked</s:if> />女<br>
    		</fieldset>
    		<fieldset>
    			<label>年龄：</label><input disabled="disabled" name="age" value="<s:property value="studentUser.age" />" type="text">
    		</fieldset>
    		<fieldset>
    			<label>电话:</label><input disabled="disabled" name="telphone" value="<s:property value="studentUser.telphone" />" type="text">
    		</fieldset>
    		<fieldset>
    			<label>邮箱：</label><input disabled="disabled" name="email" value="<s:property value="studentUser.email" />" type="text">
    		</fieldset>
    		<fieldset>
    			<label>学校：</label><input disabled="disabled" name="school" value="<s:property value="studentUser.school" />" type="text">
    		</fieldset>
    		<fieldset>
    			<label>是否着急：</label><input disabled="disabled" value="100" name="state" type="radio" />很急<input disabled="disabled" value="10" name="state" type="radio" checked />长期、不急<br>
    		</fieldset>
    		<fieldset>
    			<label style="top: -60px; position: relative; height: 80px; line-height: 80px;">备注：</label><textarea disabled="disabled" name="recommend"><s:property value="studentUser.recommend"/></textarea>
    		</fieldset>
    		<input type="submit" id="post-message" value="保存修改" style="cursor:pointer; display: none; border-top: 0px solid #FFF; border-bottom: 0px solid #FFF; padding-left: 10px; padding-right: 10px; padding-top: 4px; padding-bottom: 4px; background: red; border-radius: 15px; color: #FFF; font-size: 14px;" />
    		</form>
    		<input type="submit" id="open-input" style="cursor:pointer; border-top: 0px solid #FFF; border-bottom: 0px solid #FFF; padding-left: 10px; padding-right: 10px; padding-top: 4px; padding-bottom: 4px; background: red; border-radius: 15px; color: #FFF; font-size: 14px;" value="更改信息" />
    		</div>
    	</div>
    </div>
    <script src="js/ajaxfileupload.js"></script>
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script>
    $(document).ready(function(){
    	$("#fun_gerenxinxi_div").mCustomScrollbar({
            scrollButtons:{
              enable:true
            }
          });
    });
    </script>
    <script>
    $('.fun_opengeren').click(function(){
		  var id=$(this).attr('data-id');
		    $('#content').load("shouye_gerenteacher",{id: id},function() {
		    	
		    }).show(400);
		    return false;
    })
    		</script>
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
    	$.post("shouye_updateStudentMessage",$("#gerenxinxi-div-student-form").serialize(),function(data){
    		if(data=="success"){
    			alert("资料更新成功");
    			location.reload();
    		}
    	})
    	return false;
    });
    function upload_logo(a){
    	$.ajaxFileUpload({
    		url:'fileUpload_studentLogo',
    		secureuri:false,
    		fileElementId:'path',
    		
    		data:{id:'<s:property value="studentUser.id"/>',username:'<s:property value="studentUser.username"/>'},
    		beforeSend:function(){
    			
    		},
    		success: function(){
    			alert("头像上传成功");
    			location.reload() 
    		}
    	});
    	return false;
    }
    //去除链接虚框
    $('a').bind('focus',function(){if(this.blur){ this.blur();}});
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