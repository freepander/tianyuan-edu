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
    <meta name="keywords" content="教育，英语，文化课，教育机构，哈尔滨，平台，家教，名师，咨询，书城，教育新闻">
    <meta name="description" content="哈尔滨天源教育咨询平台，找家教、赵老师、招学生、找培训就上天源教育平台。">
    <link href="css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    
    <%if(isDenglu){ %>
    <span id="index-huanying">欢迎您： <%=username %> </span>
	<a id="sub-gerenxinxi1" class="gerenxinxi" href="javascript:void(0);"> </a>
	<a id="sub-zhuxiao1" class="zhuxiao" href="javascript:void(0);"> </a>
	<%}else { %>
	<a id="sub-denglu1" href="javascript:void(0);"> </a>
	<a style="background:url(img/zhuce21.png);position:absolute;top:0px; right:243px;display:block;height:40px;width:80px;z-index:1000;" href="javascript:openZhucekuang()"> </a>
	<%} %>
	<a id="sub-yuyue1" href="javascript:void(0);" onclick="ib_wopen();"> </a>
    <a id="sub-lianxiwomen1" href="javascript:void(0);"> </a>
    <a id="gongsijianjie1" class="qiyejianjie-button" href="javascript:void(0);">公司简介</a>
    <span class="copyright2">Copyright© tianyuan.com All rights reserved.黑ICP备09094706</span>
  	<div id="sub-nav">
        <a id="sub-circle1" href="javascript:void(0);"> </a>
        <a id="sub-circle2" href="javascript:void(0);"> </a>
        <a id="sub-circle3b" href="javascript:void(0);"> </a>
        <a id="sub-circle4" href="javascript:void(0);"> </a>
        <a id="sub-circle5" href="javascript:void(0);"> </a>
        <a id="sub-circle6" href="javascript:void(0);"> </a>
        <a id="sub-circle7" href="javascript:void(0);"> </a>
    </div>
    <div id="sub-content">
    	<a class="fun_tanchu_zhuce" href='javascript:openZhucekuang()' style="display:block;background:url(img/zhuce1.png);width:304px; height:70px;position:absolute;top:61px; right:-270px;z-index:10000;"></a>
      <div id="laoshi-nav">
        <ul id="top">
        	<form id="search" action="search_teacher" method="post" style="float: right;margin-top:10px;margin-right: 40px; z-index: 200000; background:#D45E04; padding-left: 10px; padding-right: 10px; border-radius: 20px;-webkit-border-radius:20px;-moz-border-radius:20px;height: 34px; line-height: 32px; width: 220px;">
	        	<input name="searchContent" type="text"style="width: 100px;margin-top:4px;float:left;background: none; border: 0px solid #FFF; background:#FFF; border-radius: 20px; color: #D45E04; height: 24px; line-height: 18px; padding-left: 14px; padding-right: 14px;" >
	        	<input type="submit" value="搜索" style="display:block;margin-top: 4px;float:right;background: none; border: 0px solid #FFF; height: 24px; line-height:18px; color:#FFF; cursor: pointer;">
        	</form>
          <li class="first"><a class="active" data-id="0" href="javascript:void(0);">全部</a></li>
          <s:iterator value="teacherCategoryList" status="st">
          	<s:if test="#st.index!=teacherCategoryList.size()-1">
          		<li><a href="javascript:void(0);" data-id="<s:property value="id" />"><s:property value="name" /></a></li>
          	</s:if>
          	<s:if test="#st.index==teacherCategoryList.size()-1">
          		<li class="last"><a href="javascript:void(0);" data-id="<s:property value="id" />"><s:property value="name" /></a></li>
          	</s:if>
          </s:iterator>
        </ul>
        <span style="display:block; width: 220px;background:#D45E04; border-radius: 20px; padding-left: 10px; padding-right: 10px;color:#FFF; margin-right: 40px; float:right; line-height: 32px; ">带有<img src="img/state.png">的用户为本站会员。</span>
      </div>
      <a href='javascript:void(0);' id="teacher-qiehuan-left" style="position:absolute; top: 180px; left: -175px; display:block; width: 40px; height: 70px; background:url(img/qiehuan_left.png); z-index: 1000;"></a>
      <a href='javascript:void(0);' id="teacher-qiehuan-right" style="position:absolute; top: 180px; left:710px; display:block; width: 40px; height: 70px; background:url(img/qiehuan_right.png); z-index: 1000;"></a>
      <div id="tishi-tanchu" style="width: 153px; height: 153px; background:url(img/tishi_laoshi.png);position:absolute; top: -14px; left: 30px;"></div>
      <!-- 
      <div style="width:60px;height:130px;position:absolute;top:341px;left:-210px;color:#FFF; text-align:right;">
      	<p style="line-height:24px;background:#D45E04;border-radio-left:15px;">默认</p>
      	<p>评分</p>
      </div>
       -->
      <div id="laoshi-list">
      	<div id="list-border">
        <ul id="top">
        	
        </ul>
        </div>
        <ul id="body">
        	
        </ul>
      </div>
    </div>
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script>
  //弹出注册按钮
    $('.fun_tanchu_zhuce').mouseover(function(){
    	$(this).animate({right:0},500)
    })
    $('.fun_tanchu_zhuce').mouseout(function(){
    	$(this).animate({right:-270},500)
    })
    $(window).ready(function(){
    	var id=$('#top').find(".active").first().attr("data-id");
    	$.get("index_teacherList",{id: id},function(data) {
    		$("#laoshi-list").hide().html(data).show(400,function(){
    			$("#laoshi-list #list-border").mCustomScrollbar({
    				horizontalScroll:true,
    				scrollButtons:{
    					enable:true
    				},
    				theme:"dark-thin"
    			});
    		    $("#laoshi-list #body").mCustomScrollbar({scrollButtons:{enable:true}});
    		});
    	});
    });
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
        	$(window).width()
        	$(window).height()
        	$('body').width($(window).width()).height($(window).height());
        	$('#content').width($(window).width()).height($(window).height());
        }
    })
    $("#laoshi-list #list-border").mCustomScrollbar({
		horizontalScroll:true,
		scrollButtons:{
			enable:true
		},
		theme:"dark-thin"
	});
    $("#laoshi-list #body").mCustomScrollbar({scrollButtons:{enable:true}});
    $('#search').submit(function(event){
    	$.post("search_teacher",$("#search").serialize(),function(data){
    		$("#laoshi-list").hide().html(data).show(400,function(){
    			$("#laoshi-list #list-border").mCustomScrollbar({
    				horizontalScroll:true,
    				scrollButtons:{
    					enable:true
    				},
    				theme:"dark-thin"
    			});
    		    $("#laoshi-list #body").mCustomScrollbar({scrollButtons:{enable:true}});
    		});
    	})
    	event.preventDefault();
    });
    setTimeout(function(){
    	$('#tishi-tanchu').hide(500);
    },3000);
    </script>
    <script type="text/javascript">
    $('#top').click(function(event) {
    	if(event.target.nodeName=="A"){
    		var trage=$(event.target);
        	trage.parent().siblings().children().removeClass("active");
        	trage.addClass("active");
        	getTeacherList();
    	}
    });
    function getTeacherList(){
    	var id=$('#top').find(".active").first().attr("data-id");
    	$.get("index_teacherList",{id: id},function(data) {
    		$("#laoshi-list").hide().html(data).show(400,function(){
    			$("#laoshi-list #list-border").mCustomScrollbar({
    				horizontalScroll:true,
    				scrollButtons:{
    					enable:true
    				},
    				theme:"dark-thin"
    			});
    		    $("#laoshi-list #body").mCustomScrollbar({scrollButtons:{enable:true}});
    		});
    	});
    }
    $("#teacher-qiehuan-left").click(function(){
    	$('#laoshi-list #list-border').mCustomScrollbar("scrollTo","left");
    });
    $("#teacher-qiehuan-right").click(function(){
    	$('#laoshi-list #list-border').mCustomScrollbar("scrollTo","right");
    });
    </script>
  	<script type="text/javascript">
  	$('#sub-circle1').click(function() {
       $('#content').hide().load('index_zhuye').show(400);
       location.hash="zhuye";
       $('title').html("天源教育-主页");
       return false;
     });
     $('#sub-circle2').click(function() {
       $('#content').hide().load('index_zhaoxuesheng').show(400);
       location.hash="xuesheng";
       $('title').html("天源教育-找学生");
       return false;
     });
     $('#sub-circle3b').click(function() {
       $('#content').hide().load('index_zhaolaoshi').show(400);
       location.hash="laoshi";
       $('title').html("天源教育-找老师");
       return false;
     });
     $('#sub-circle4').click(function() {
       $('#content').hide().load('index_zhaojigou').show(400);
       location.hash="jigou";
       $('title').html("天源教育-找机构");
       return false;
     });
     $('#sub-circle5').click(function() {
       $('#content').hide().load('index_zhaoyouhui').show(400);
       location.hash="youhui";
       $('title').html("天源教育-找优惠");
       return false;
     });
     $('#sub-circle6').click(function() {
       $('#content').hide().load('index_huodongzhaopian').show(400);
       location.hash="zhaopian";
       $('title').html("天源教育-精品书城");
       return false;
     });
     $('#sub-circle7').click(function() {
       $('#content').hide().load('index_zaixianliuyan').show(400);
       location.hash="liuyan";
       $('title').html("天源教育-在线留言");
       return false;
     });
     $('.zhuxiao').click(function(){$.cookie('userId', null,  {expires: 0 });location.href='index.jsp';});
    $('#sub-denglu1').click(function() {$('#denglukuangwai').show(400);return false;});
    $('#sub-lianxiwomen1').mouseover(function(){
   		$(this).stop(true,false).animate({width:0,height:0},200).attr('id','sub-lianxiwomen1-big');
   		$(this).stop(true,false).animate({width:270, height:270},400,function(){
   		 $('#sub-lianxiwomen1-big').mouseout(function() {
   	    	$(this).stop(true,false).animate({width:0,height:0},200);
   	        $(this).stop(true,false).animate({width:100, height:80},400,function(){
   	        	$(this).attr('id','sub-lianxiwomen1')
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