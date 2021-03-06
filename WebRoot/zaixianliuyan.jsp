<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <%
  boolean isDenglu=false;
  String userid="";
  String username="";
  Cookie[] cookies=request.getCookies();
  if(cookies!=null){
	  for(int i=0;i<cookies.length;i++){
	  		if(cookies[i].getName().equals("userId")){
	  			isDenglu=true;
	  			userid=cookies[i].getValue();
	  		}else if(cookies[i].getName().equals("username")){
	  			username=cookies[i].getValue();
	  		}
	  	}  
  }
  %>
<!DOCTYPE html>
<html>
  <head>
    <title>天源教育网</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/style.css" rel="stylesheet" media="screen">
    <link href="css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
    <meta name="keywords" content="教育，英语，文化课，教育机构，哈尔滨，平台，家教，名师，咨询，书城，教育新闻">
    <meta name="description" content="哈尔滨天源教育咨询平台，找家教、赵老师、招学生、找培训就上天源教育平台。">
  </head>
  <body>
    <%if(isDenglu){ %>
    <span id="index-huanying">欢迎您： <%=username %> </span>
	<a id="sub-gerenxinxi7" class="gerenxinxi" href="javascript:void(0);"> </a>
	<a id="sub-zhuxiao7" class="zhuxiao" href="javascript:void(0);"> </a>
	<%}else { %>
	<a id="sub-denglu7" href="javascript:void(0);"> </a>
	<a style="background:url(img/zhuce27.png);position:absolute;top:0px; right:243px;display:block;height:40px;width:80px;z-index:1000;" href="javascript:openZhucekuang()"> </a>
	<%} %>
	<a id="sub-yuyue7" href="javascript:void(0);" onclick="ib_wopen();"> </a>
    <a id="sub-lianxiwomen7" href="javascript:void(0);"> </a>
    <a id="gongsijianjie7" class="qiyejianjie-button" href="javascript:void(0);">公司简介</a>
    <span class="copyright2">Copyright© tianyuan.com All rights reserved.黑ICP备09094706</span>
  	<div id="sub-nav">
        <a id="sub-circle1" href="javascript:void(0);"> </a>
        <a id="sub-circle2" href="javascript:void(0);"> </a>
        <a id="sub-circle3" href="javascript:void(0);"> </a>
        <a id="sub-circle4" href="javascript:void(0);"> </a>
        <a id="sub-circle5" href="javascript:void(0);"> </a>
        <a id="sub-circle6" href="javascript:void(0);"> </a>
        <a id="sub-circle7b" href="javascript:void(0);"> </a>
    </div>
    <div id="sub-content">
    	<a href='javascript:openZhucekuang()' style="display:block;background:url(img/zhuce7.png);width:304px; height:70px;position:absolute;top:61px; right:0px;z-index:10000;"></a>
      <form id="zaixianliuyan" action="index_addMessage" method="post" >
      	<h2>在线留言<br><small>Message online</small></h2>
      	<label>姓名：</label><input name="name" type="text" />
      	<label>电话：</label><input name="telphone" type="text" />
      	<label>QQ：</label><input name="QQ" type="text" />
      	<label>留言内容：</label><textarea name="content"></textarea>
      	<input id="zaixianliuyan_submit" type="submit" value="提交">
      </form>
      
    </div>
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript">
  //弹出注册按钮
    $('.fun_tanchu_zhuce').mouseover(function(){
    	$(this).animate({right:0},1000)
    })
    $('.fun_tanchu_zhuce').mouseout(function(){
    	$(this).animate({right:-270},1000)
    })
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
    $("#zaixianliuyan_submit").click(function(){
    	if($("#zaixianliuyan input[name='name']").val()==""){alert("请填写姓名"); return false;}
    	if($("#zaixianliuyan input[name='telphone']").val()==""){alert("请填写联系电话"); return false;}
    	if($("#zaixianliuyan input[name='QQ']").val()==""){alert("请填写QQ"); return false;}
    	if($("#zaixianliuyan textarea").val()==""){alert("请填写留言内容"); return false;}
    	alert("我们已经收到了您的留言，工作人员会尽快与您取得联系。");
    });
    </script>
  	<script type="text/javascript">
    $('#sub-circle1').click(function() {
      $('#content').hide().load('index_zhuye').show(400);
      location.hash="zhuye";
      $('title').html("天源教育-主页");$.getScript("http://c.ibangkf.com/i/c-tianyuantest.js",function(){})
      return false;
    });
    $('#sub-circle2').click(function() {
      $('#content').hide().load('index_zhaoxuesheng').show(400);
      location.hash="xuesheng";
      $('title').html("天源教育-找学生");$.getScript("http://c.ibangkf.com/i/c-tianyuantest.js",function(){})
      return false;
    });
    $('#sub-circle3').click(function() {
      $('#content').hide().load('index_zhaolaoshi').show(400);
      location.hash="laoshi";
      $('title').html("天源教育-找老师");$.getScript("http://c.ibangkf.com/i/c-tianyuantest.js",function(){})
      return false;
    });
    $('#sub-circle4').click(function() {
      $('#content').hide().load('index_zhaojigou').show(400);
      location.hash="jigou";
      $('title').html("天源教育-找机构");$.getScript("http://c.ibangkf.com/i/c-tianyuantest.js",function(){})
      return false;
    });
    $('#sub-circle5').click(function() {
      $('#content').hide().load('index_zhaoyouhui').show(400);
      location.hash="youhui";
      $('title').html("天源教育-找优惠");$.getScript("http://c.ibangkf.com/i/c-tianyuantest.js",function(){})
      return false;
    });
    $('#sub-circle6').click(function() {
      $('#content').hide().load('index_huodongzhaopian').show(400);
      location.hash="zhaopian";
      $('title').html("天源教育-历年真题");$.getScript("http://c.ibangkf.com/i/c-tianyuantest.js",function(){})
      return false;
    });
    $('#sub-circle7b').click(function() {
      $('#content').hide().load('index_zaixianliuyan').show(400);
      location.hash="liuyan";
      $('title').html("天源教育-在线留言");$.getScript("http://c.ibangkf.com/i/c-tianyuantest.js",function(){})
      return false;
    });
    $('.zhuxiao').click(function(){$.cookie('userId', null,  {expires: 0 });location.href='index.jsp';});
    $('#sub-denglu7').click(function() {
        $('#denglukuangwai').show(400);
    });
    $('#sub-lianxiwomen7').mouseover(function(){
   		$(this).stop(true,false).animate({width:0,height:0},200).attr('id','sub-lianxiwomen7-big');
   		$(this).stop(true,false).animate({width:270, height:270},400,function(){
   		 $('#sub-lianxiwomen7-big').mouseout(function() {
   	    	$(this).stop(true,false).animate({width:0,height:0},200);
   	        $(this).stop(true,false).animate({width:100, height:80},400,function(){
   	        	$(this).attr('id','sub-lianxiwomen7')
   	        });
   	     });
   		});
    });
    //去除链接虚框
    $('a').bind('focus',function(){if(this.blur){ this.blur();}});
    $(".gerenxinxi").click(function(){
    	location.hash="xinxi";
        $('#content').load("shouye_showUserMessage",{userid: '<%=userid %>'},function() {
        	
        }).show(400);
    })
    $('.qiyejianjie-button').click(function(){
    	$('.qiyexinxi').show().animate({'width':455},400,function(){
    		$(this).animate({'height': 455});
    	});
    });
    $('.qiyexinxi p').mouseout(function(){
    	$('.qiyexinxi').animate({'height':24},400,function(){
    		$(this).animate({'width': 1},200,function(){
    			$(this).hide()
    		});
    	})
    });
    </script>
    
  </body>
</html>