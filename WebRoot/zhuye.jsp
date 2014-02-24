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
    <link href="css/slideshow.css" rel="stylesheet" />
    <link href="css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
    <script src="js/slideshow.js" type="text/javascript"></script>
  </head>
  <body>
    
    <%if(isDenglu){ %>
    <span id="index-huanying">欢迎您： <%=username %> </span>
	<a id="sub-gerenxinxi3" class="gerenxinxi" href="javascript:void(0);"> </a>
	<a id="sub-zhuxiao3" class="zhuxiao" href="javascript:void(0);"> </a>
	<%}else { %>
	<a id="sub-denglu3" href="javascript:void(0);"> </a>
	<a style="background:url(img/zhuce23.png);position:absolute;top:0px; right:243px;display:block;height:40px;width:80px;z-index:1000;" href="javascript:openZhucekuang()"> </a>
	<%} %>
	<a id="sub-yuyue3" href="javascript:void(0);" onclick="ib_wopen();"> </a>
    <a id="sub-lianxiwomen3" href="javascript:void(0);"> </a>
    <a id="gongsijianjie3" class="qiyejianjie-button" href="javascript:void(0);">公司简介</a>
    <span class="copyright2">Copyright© tianyuan.com All rights reserved.黑ICP备09094706</span>
  	<div id="sub-nav">
        <a id="sub-circle1b" href="#zhuye"> </a>
        <a id="sub-circle2" href="#xuesheng"> </a>
        <a id="sub-circle3" href="#laoshi"> </a>
        <a id="sub-circle4" href="#jigou"> </a>
        <a id="sub-circle5" href="#youhui"> </a>
        <a id="sub-circle6" href="#huodong"> </a>
        <a id="sub-circle7" href="#zaixianliuyan"> </a> 
    </div>
    <div id="sub-content">
    	<s:if test='ad.pic!=""'>
    	<div id="" style="width:460px; height: 144px;position:absolute;top:60px; left:-69px;">
	    	<a href="javascript:openZhucekuang()" style="border:0;">
	    		<img src="upload/books/<s:property value="ad.pic"/>" width="100%" height="100%">
	    	</a>
    	</div>
    	</s:if>
    	<a href='javascript:openZhucekuang()' style="display:block;background:url(img/zhuce3.png);width:304px; height:70px;position:absolute;top:61px; right:0px;"></a>
    	
    	<div id="news-list">
    		<span> </span>
   			<div class="news-title-div" id="news">
   				<span class="news-tit active" data-categoryId="0"><a href='javascript:void(0);'>全部</a></span>
   				<s:iterator value="newsCategoryList">
   				<span class="news-tit" data-categoryId="<s:property value="id"/>"><a href='javascript:void(0);'><s:property value="name"/></a></span>
   				</s:iterator> 
			</div>
			<div class="news-content">
				
			</div>
		</div>
		<div id="news-lunbo">
			<div style="position: relative;">
				<div class="comiis_wrapad" id="slideContainer">
					<div id="frameHlicAe" class="frame cl">
						<div class="temp"></div>
						<div class="block">
							<div class="cl">
								<ul class="slideshow" id="slidesImgs">
									<s:iterator value="newspicList">
									<li class="xinwen-tanchu2" data-newsid="<s:property value="id" />"><a href="javascript:void(0);">
									<img src="upload/newspic/<s:property value="pic" />" width="414" height="240" alt="" /></a><span class="title"><s:property value="title" /></span></li>
									</s:iterator>
								</ul>
							</div>
							<div class="slidebar" id="slideBar">
							<ul>
                        		<s:iterator value="newspicList" status="st">
                        		<s:if test="#st.index==0"><li class="on"><s:property value="#st.index+1"/></li></s:if>
                        		<s:if test="#st.index!=0"><li><s:property value="#st.index+1"/></li></s:if>
                        		</s:iterator>
                        	</ul>
                    		</div>
                		</div>
            		</div>
        		</div>
      		</div>
      </div>
    </div>
    <div id="xinwen-bg">
      <div id="xinwen">
        <a id="xinwen-close" href="javascript:void(0);"></a>
        <div id="xinwen-content">
        <!-- 新闻内容 -->
        </div>
        <div id="xinwen-qiehuan" style="display:none">
          <a id="right" href="javascript:void(0);">下一条</a>
          <a id="left" href="javascript:void(0);">上一条</a>
        </div>
      </div>
    </div>
    <script type="text/javascript">
        SlideShow(5000);
    </script>
    <script type="text/javascript">
    $("#news span").click(function(event){
    	$(this).parent().children().removeClass('active');
    	$(this).addClass('active');
    	var ids=$(this).attr("data-categoryId");
    	$('.news-content').load("index_getNewsByCategoryId",{id : ids},function(){});
    });
    $(window).ready(function(){
    	$('.news-content').load("index_getNewsByCategoryId",{},function(){});
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
    //打开新闻详情
    
    $('.xinwen-tanchu2').click(function(){
        var id=$(this).data("newsid");
        $.getJSON("index_getNewspicById",{id:id},function(json){
          $("#xinwen-content").html(json['content']);
          $("#xinwen-content").mCustomScrollbar({
            scrollButtons:{
              enable:true
            }
          });
        })
        $("#xinwen-bg").show(400);
        return false;
      });
    </script>
  	<script type="text/javascript">
    $('#sub-circle1b').click(function() {
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
    $('#sub-circle6').click(function() {
      $('#content').hide().html("").load('index_huodongzhaopian').show(400);
      location.hash="zhaopian";
      $('title').html("天源教育-在线留言");
      return false;
    });
    $('#sub-circle7').click(function() {
      $('#content').hide().html("").load('index_zaixianliuyan').show(400);
      location.hash="liuyan";
      return false;
    });
    //新闻内容关闭
    $('#xinwen-close').click(function(){
      $("#xinwen-bg").hide(400);
    })
    </script>
    <script type="text/javascript">
    $('#sub-denglu3').click(function() {
        $('#denglukuangwai').show(400);
        return false;
    });
    $('#sub-lianxiwomen3').mouseover(function(){
   		$(this).stop(true,false).animate({width:0,height:0},200).attr('id','sub-lianxiwomen3-big');
   		$(this).stop(true,false).animate({width:270, height:270},400,function(){
   		 $('#sub-lianxiwomen3-big').mouseout(function() {
   	    	$(this).stop(true,false).animate({width:0,height:0},200);
   	        $(this).stop(true,false).animate({width:100, height:80},400,function(){
   	        	$(this).attr('id','sub-lianxiwomen3')
   	        });
   	     });
   		});
    });
    $('.zhuxiao').click(function(){$.cookie('userId', null,  {expires: 0 });location.href='index.jsp';});
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