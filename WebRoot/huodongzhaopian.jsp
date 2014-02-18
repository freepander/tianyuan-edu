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
	<a id="sub-gerenxinxi2" class="gerenxinxi" href="javascript:void(0);"> </a>
	<a id="sub-zhuxiao2" class="zhuxiao" href="javascript:void(0);"> </a>
	<%}else { %>
	<a id="sub-denglu2" href="javascript:void(0);"> </a>
	<a style="background:url(img/zhuce222.png);position:absolute;top:0px; right:243px;display:block;height:40px;width:80px;z-index:1000;" href="javascript:openZhucekuang()"> </a>
	<%} %>
	<a id="sub-yuyue2" href="javascript:void(0);" onclick="ib_wopen();"> </a>
    <a id="sub-lianxiwomen2" href="javascript:void(0);"> </a>
    <a id="gongsijianjie2" class="qiyejianjie-button" href="javascript:void(0);">公司简介</a>
    <span class="copyright2">Copyright© tianyuan.com All rights reserved.黑ICP备09094706</span>
  	<div id="sub-nav">
        <a id="sub-circle1" href="#zhuye"> </a>
        <a id="sub-circle2" href="#xuesheng"> </a>
        <a id="sub-circle3" href="#laoshi"> </a>
        <a id="sub-circle4" href="#jigou"> </a>
        <a id="sub-circle5" href="#youhui"> </a>
        <a id="sub-circle6b" href="#huodong"> </a>
        <a id="sub-circle7" href="#zaixianliuyan"> </a> 
    </div>
    <div id="sub-content">
    	<a class="fun_tanchu_zhuce" href='javascript:openZhucekuang()' style="display:block;background:url(img/zhuce22.png);width:304px; height:70px;position:absolute;top:61px; right:-270px;z-index:10000;"></a>
    	<div class="huodong-nav">
			<ul>
			<form id="search" action="search_teacher" method="post" style="float: right;margin-top:10px;margin-right: 40px; z-index: 200000; background:#FF08FC; padding-left: 10px; padding-right: 10px; border-radius: 20px;-webkit-border-radius:20px;-moz-border-radius:20px;height: 34px; line-height: 32px; width: 220px;">
	        	<input name="searchContent" type="text"style="width: 100px;margin-top:4px;float:left;background: none; border: 0px solid #FFF; background:#FFF; border-radius: 20px; color: #FF08FC; height: 24px; line-height: 18px; padding-left: 14px; padding-right: 14px;" >
	        	<input type="submit" value="搜索" style="display:block;margin-top: 4px;float:right;background: none; border: 0px solid #FFF; height: 24px; line-height:18px; color:#FFF; cursor: pointer;">
        	</form>
	          <li class="first"><a class="active" data-regionalId="0" href="javascript:void(0);">全部</a></li>
	          <s:iterator value="bookCateogryList" status="st">
	          <s:if test="#st.index==bookCateogryList.size()-1">
	          <li class="last"><a data-regionalId="<s:property value="id" />" href="javascript:void(0);"><s:property value="name" /></a></li>
	          </s:if>
	          <s:if test="#st.index!=bookCateogryList.size()-1">
	          <li><a data-regionalId="<s:property value="id" />" href="javascript:void(0);"><s:property value="name" /></a></li>
	          </s:if>
	          </s:iterator>
	        </ul>
	        <span style="color: #FFF; float: right; margin-right: 40px; margin-top: 10px;">此类书为推荐类型</span>
    	</div>
    	<div class="huodong-body">
    	<ul>
    		<s:iterator value="list">
    		<li><p><s:property value="name" /></p><img src="upload/books/<s:property value="logo" />"></li>
    		</s:iterator>
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
   	$('.huodong-nav').click(function(event) {
       	if(event.target.nodeName=="A"){
       		var trage=$(event.target);
           	trage.parent().siblings().children().removeClass("active");
           	trage.addClass("active");
           	getBook();
       	}
       });
   	function getBook(){
   		var categoryId=$('.huodong-nav ul').find(".active").first().attr("data-regionalId");
   		console.log(categoryId);
    	$.get("index_bookList",{id: categoryId},function(data) {
    		$(".huodong-body").hide().html(data).show(400,function(){
    			$(".huodong-body").mCustomScrollbar({
    		          scrollButtons:{
    		            enable:true
    		          }
    		        });
    		});
    	});
   	}
   	$("#search").submit(function(event){
   		$.post("search_book",$("#search").serialize(),function(data){
   			$(".huodong-body").hide().html(data).show(400,function(){
    			$(".huodong-body").mCustomScrollbar({
    		          scrollButtons:{
    		            enable:true
    		          }
    		        });
    		});
    	})
   		event.preventDefault();
   	});
   	</script>
  	<script type="text/javascript">
    $('#sub-circle1').click(function() {
      $('#content').hide().html("").load('index_zhuye').show(400);
      location.hash="zhuye";
      $('title').html("天源教育-主页");
      return false;
    });
    $('#sub-circle2').click(function() {
      $('#content').hide().html("").load('index_zhaoxuesheng').show(400);
      location.hash="xuesheng";
      $('title').html("天源教育-找学生");
      return false;
    });
    $('#sub-circle3').click(function() {
      $('#content').hide().html("").load('index_zhaolaoshi').show(400);
      location.hash="laoshi";
      $('title').html("天源教育-找老师");
      return false;
    });
    $('#sub-circle4').click(function() {
      $('#content').hide().html("").load('index_zhaojigou').show(400);
      location.hash="jigou";
      $('title').html("天源教育-找机构");
      return false;
    });
    $('#sub-circle5').click(function() {
      $('#content').hide().html("").load('index_zhaoyouhui').show(400);
      location.hash="youhui";
      $('title').html("天源教育-找优惠");
      return false;
    });
    $('#sub-circle6b').click(function() {
      $('#content').hide().html("").load('index_huodongzhaopian').show(400);
      location.hash="zhaopian";
      $('title').html("天源教育-精品书城");
      return false;
    });
    $('#sub-circle7').click(function() {
      $('#content').hide().html("").load('index_zaixianliuyan').show(400);
      location.hash="liuyan";
      $('title').html("天源教育-在线留言");
      return false;
    });
    </script>
    <script type="text/javascript">
  //登录按钮动作
    $('#sub-denglu2').click(function() {
        $('#denglukuangwai').show(400);
        return false;
    });
    $('#sub-lianxiwomen2').mouseover(function(){
   		$(this).stop(true,false).animate({width:0,height:0},200).attr('id','sub-lianxiwomen2-big');
   		$(this).stop(true,false).animate({width:270, height:270},400,function(){
   		 $('#sub-lianxiwomen2-big').mouseout(function() {
   	    	$(this).stop(true,false).animate({width:0,height:0},200);
   	        $(this).stop(true,false).animate({width:100, height:80},400,function(){
   	        	$(this).attr('id','sub-lianxiwomen2')
   	        });
   	     });
   		});
    });
    $('.zhuxiao').click(function(){$.cookie('userId', null,  {expires: 0 });location.href='index.jsp';});
    $(".gerenxinxi").click(function(){
    	location.hash="xinxi";
        $('#content').load("shouye_showUserMessage",{userid: '<%=userid %>'},function() {
        	
        }).show(400);
    })
    //去除链接虚框
    $('a').bind('focus',function(){if(this.blur){ this.blur();}});
    $(document).ready(function(){
    	$(".huodong-body").mCustomScrollbar({
    	       scrollButtons:{
    	         enable:true
    	       }
    	     });
    });
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