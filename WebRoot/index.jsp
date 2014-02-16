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
    <title>天源教育网-首页</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="教育|英语|文化课|教育机构|哈尔滨|平台|家教|名师|咨询|书城|教育新闻">
    <meta name="description" content="哈尔滨天源教育咨询平台，找家教、赵老师、招学生、找培训就上天源教育平台。">
    
    <link href="css/style.css" rel="stylesheet" media="screen">
    <link href="css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/jRating.jquery.css" type="text/css"></link>
  </head>
  <body>
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
  	<a id="ibangkf" href="#">客服系统</a>
  	<img id="index-background" src="img/background/1.jpg" />
  	<a id="index-logo" href="http://www.tianyuan-edu.com"> </a>
  	<div id="index">
  		<a id="index-lianxiwomen" href="javascript:void(0);"> </a>
  		<%if(isDenglu){ %>
  		<span id="index-huanying">欢迎您： <%=username %> </span>
  		<a id="index-gerenxinxi" class="gerenxinxi" href="javascript:void(0);"> </a>
  		<a id="index-zhuxiao" class="zhuxiao" href="javascript:void(0);"> </a>
  		<%}else { %>
  		<a id="index-denglu" href="javascript:void(0);"> </a>
  		<%} %>
  		<a id="index-yuyue" href="javascript:void(0);" onclick="ib_wopen();"> </a>
  		
  		<a id="left-back" href="javascript:void(0);"></a>
  		<a id="right-back" href="javascript:void(0);"></a>
		<div style="position:relative;margin-left: auto;margin-right:auto; width: 600px; height: 500px;">
			<a id="index-circle1" href="#zhuye"><img src="img/circle1.png" /></a>
			<a id="index-circle2" href="#xuesheng"><img src="img/circle2.png" /></a>
			<a id="index-circle3" href="#laoshi"><img src="img/circle3.png" /></a>
			<a id="index-circle4" href="#jigou"><img src="img/circle4.png" /></a>
			<a id="index-circle5" href="#youhui"><img src="img/circle5.png" /></a>
		</div>
		<span class="copyright">Copyright© tianyuan.com All rights reserved.黑ICP备09094706</span>
  	</div>
  	<!--  子页锚点  -->
	<div id="content">
	</div>
    <!--  登录框   -->
    <div id="denglukuangwai">
    	<div class="fxui-tab">
		  <div class="fxui-tab-hand">
		  	<span class="active fxui-tab-tit"><a class="denglukuang-a" href="javascript:void(0);">企业登录</a></span> 
		  	<span class="fxui-tab-tit"><a class="denglukuang-a" href="javascript:void(0);">学生登录</a></span> 
		  	<span class="fxui-tab-tit"><a class="denglukuang-a" href="javascript:void(0);">老师登录</a></span>
		  </div>
		  <div class="fxui-tab-nav">
		  <a href="javascript:$('#denglukuangwai').hide(400);" style="position:absolute;bottom:-6px;right:10px;color:#FFF;">关闭</a>
		  	<form id="organizationLoginForm" action="post" method="post" class="login-organization" >
		  		<label class="title">登录 Login</label>
		  		<label>用户名 Username</label>
		  		<input type="text" name="username" />
		  		<label>密码 Password</label>
		  		<input type="password" name="password" />
		  		<!-- <label>验证码 Identifying code</label>
		  		<input class="identiffying" type="text" name="code" /><img src="img/yanzhengma.png"> -->
		  		<input type="submit" id="organizationLogin" value="登录 Sing In!" />
		  	</form>
		  </div>
		  <div class="fxui-tab-nav">
		  	<a href="javascript:$('#denglukuangwai').hide(400);" style="position:absolute;bottom:-6px;right:10px;color:#FFF;">关闭</a>
		  	<form id="studentLoginForm" action="index/shouYe_studentRegister" method="post" class="login">
		  		<label class="title">登录 Login</label>
		  		<label>用户名 Username</label>
		  		<input type="text" name="username" />
		  		<label>密码 Password</label>
		  		<input type="password" name="password" />
		  		<!--<label>验证码 Identifying code</label> 
		  		<input class="identiffying" type="text" name="code" /><img src="img/yanzhengma.png"> -->
		  		<a target="_blank" href="forgetPasswordStudent1.jsp" style="float:right;color:#FFF; line-height: 40px;">忘记密码？</a>
		  		<input id="studentLogin" type="submit" value="登录 Sing In!" />
		  	</form>
		  	<form id="studentRegisterForm" action="index/shouye_studentRegister" method="post" class="register">
		  		<label class="title">注册 Register</label>
		  		<label>用户名 Username</label>
		  		<input type="text" name="username" />
		  		<label>密码 Password</label>
		  		<input type="password" name="password" />
		  		<label>确认密码 Confirm Password</label>
		  		<input type="password" name="password2" />
		  		<label>邮箱 E-mail</label>
		  		<input type="text" name="email" />
		  		<!-- <input class="identiffying" type="text" name="code" /><img src="img/yanzhengma.png"><br> -->
		  		<input checked="checked" type="radio" name="tongyi" /><span><a style="color:#FFF;" href="other/xieyi.html" target="_blank">我已读完并接受《天源教育咨询平台协议》</a></span>
		  		<input  id="studentRegister" type="submit" style="cursor:pointer;" value="提交 Okay, Done!" />
		  		
		  	</form>
		  	<span style="position: absolute; bottom: 74px; right: 20px; font-size: 20px; color: red;">学生专用</span>
		  </div>
		  <div class="fxui-tab-nav">
		  	<a href="javascript:$('#denglukuangwai').hide(400);" style="position:absolute;bottom:-6px;right:10px;color:#FFF;">关闭</a>
		  	<form id="teacherLoginForm" action="post" method="post" class="login">
		  		<label class="title">登录 Login</label>
		  		<label>用户名 Username</label>
		  		<input type="text" name="username" />
		  		<label>密码 Password</label>
		  		<input type="password" name="password" />
		  		<!-- <label>验证码 Identifying code</label>
		  		<input class="identiffying" type="text" name="code" /><img src="img/yanzhengma.png"> -->
		  		<a target="_blank" href="forgetPasswordTeacher1.jsp" style="float:right;color:#FFF; line-height: 40px;">忘记密码？</a>
		  		<input id="teacherLogin" type="submit" value="登录 Sing In!" style="cursor:pointer;" />
		  	</form>
		  	<form id="teacherRegisterForm" action="post" method="post" class="register">
		  		<label class="title">注册 Register</label>
		  		<label>用户名 Username</label>
		  		<input type="text" name="username" />
		  		<label>密码 Password</label>
		  		<input type="password" name="password" />
		  		<label>确认密码 Confirm Password</label>
		  		<input type="password" name="password2" />
		  		<label>邮箱 E-mail</label>
		  		<input type="text" name="email" />
		  		<!-- <input class="identiffying" type="text" name="code" /><img src="img/yanzhengma.png"><br> -->
		  		<input checked="checked" type="radio" name="tongyi" /><span><a style="color:#FFF;" href="other/xieyi.html" target="_blank">我已读完并接受《天源教育咨询平台协议》</a></span>
		  		<input id="teacherRegister" type="submit" value="提交 Okay, Done!" style="cursor:pointer;" />
		  	</form>
		  	<span style="position: absolute; bottom: 74px; right: 20px; font-size: 20px; color: red;">老师专用</span>
		  </div>
		</div>
    </div>
    <div id="gerenTablewai">
    	<div id="gerenTable">
    		<div class="head">
    			<span class="title">个人资料完善 </span><h2> 个人信息<small>Personal information</small></h2>
    		</div>
    		<div class="body">
    		
    		</div>
    	</div>
    </div>
    <div class="qiyexinxi">
    <p>    哈尔滨天源自动化控制技术有限责任公司成立于1996年，其下属部门天源教育咨询平台始创于2013年10月14日，该平台创始时定位于一家服务黑龙江各大教育培训机构、学员以及教师三方面供需平衡的第三方资讯平台，网站自创始之初不断的更新完善，本着在做好服务并不断创新的宗旨下，网站逐渐成为一家更人性化、更科学、更优质的咨询平台，秉着诚实客观的原则，创新求发展、稳步快发展、诚信助发展的三大经营宗旨，对各教育机构以及教师的评价做到客观、公正，将各教育机构最真实地评价传达给各位咨询者使该机构深受学员及家长好评，并因此建立良好的品牌形象及信誉度，平台利用最先进的互联网技术，加强人与人之间信息的交流和共享以及创新的理念实现“教育的跨时代”。</p>
    </div>

  	<!--  	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>-->
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  	<script type="text/javascript" src="http://c.ibangkf.com/i/c-tianyuantest.js"></script>
  	<script type="text/javascript" src="js/jquery.fxTab.js"></script>
  	<script type="text/javascript" src="js/jquery.cookie.js"></script>
  	<script type="text/javascript" src="js/jquery.mCustomScrollbar.concat.min.js"></script>
  	<script type="text/javascript" src="js/jquery.raty.min.js"></script>
  	
  	<script type="text/javascript">
  	$("#organizationLogin").click(function(){
  		var username=$("#organizationLoginForm input[name='username']").val();
  		var password=$("#organizationLoginForm input[name='password']").val();
  		if(username==""){alert("用户名不能为空");return false;}
		if(password==""){alert("密码不能为空");return false;}
		$.post("shouye_organizationLogin",{username: username, password: password},function(data){
			if(data=="success"){alert("登录成功");location.href="index.jsp";
			}else if(data=="error"){alert("用户名或密码不正确");}
		})
		return false;
  	});
	$("#studentRegister").click(function(){
		var username=$("#studentRegisterForm input[name='username']").val();
		var password=$("#studentRegisterForm input[name='password']").val();
		var password2=$("#studentRegisterForm input[name='password2']").val();
		var email=$("#studentRegisterForm input[name='email']").val();
		if(username==""){alert("用户名不能为空");return false;}
		if(password==""){alert("密码不能为空");return false;}
		if(email==""){alert("邮箱不能为空");return false;}
		if(password!=password2){alert("两次密码不一致");return false;}
		var reg=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		if(!reg.test(email)){alert("请输入正确的邮箱");return false;}
		var reg2=/^[a-zA-Z0-9_]{1,}$/;
		if(!reg2.test(username)){alert("用户名只能由字母和数字组成，请更换。");return false;}
		if(username.length<5){alert("用户名长度不能小于5位");return false;}
		$.post("shouye_studentRegister",{username: username, password: password, email: email},function(data){
			if(data=="error"){alert("注册失败，该用户名已被占用，请更换用户名后重试");}else{alert("注册成功,请完善个人信息。");
				$('#denglukuangwai').hide(400);
				$("#gerenTablewai").show(200);
		    	$("#gerenTable .body").load("shouye_getUserMessage",{userid: "student"+data},function(){});
			}
		});
		return false;
	});
	$("#studentLogin").click(function(){
		var username=$("#studentLoginForm input[name='username']").val();
		var password=$("#studentLoginForm input[name='password']").val();
		if(username==""){alert("用户名不能为空");return false;}
		if(password==""){alert("密码不能为空");return false;}
		$.post("shouye_studentLogin",{username: username, password: password},function(data){
			if(data=="success"){alert("登录成功");location.href="index.jsp";
			}else if(data=="error"){alert("用户名或密码不正确");}
		})
		return false;
	});
	$("#teacherRegister").click(function(){
		var username=$("#teacherRegisterForm input[name='username']").val();
		var password=$("#teacherRegisterForm input[name='password']").val();
		var password2=$("#teacherRegisterForm input[name='password2']").val();
		var email=$("#teacherRegisterForm input[name='email']").val();
		if(username==""){alert("用户名不能为空");return false;}
		if(password==""){alert("密码不能为空");return false;}
		if(email==""){alert("邮箱不能为空");return false;}
		if(password!=password2){alert("两次密码不一致");return false;}
		var reg=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		if(!reg.test(email)){alert("请输入正确的邮箱");return false;}
		var reg2=/^[a-zA-Z0-9_]{1,}$/;
		if(!reg2.test(username)){alert("用户名只能由字母和数字组成，请更换。");return false;}
		if(username.length<5){alert("用户名长度不能小于5位");return false;}
		$.post("shouye_teacherRegister",{username: username, password: password, email: email},function(data){
			if(data=="error"){alert("注册失败，该用户名已被占用，请更换用户名后重试");
			}else{
				alert("注册成功,请完善个人信息。");
				$('#denglukuangwai').hide(400);
				$("#gerenTablewai").show(200);
		    	$("#gerenTable .body").load("shouye_getUserMessage",{userid: "teacher"+data},function(){});
			}
		});
		return false;
	});
	$("#teacherLogin").click(function(){
		var username=$("#teacherLoginForm input[name='username']").val();
		var password=$("#teacherLoginForm input[name='password']").val();
		if(username==""){alert("用户名不能为空");return false;}
		if(password==""){alert("密码不能为空");return false;}
		$.post("shouye_teacherLogin",{username: username, password: password},function(data){
			if(data=="success"){alert("登录成功");location.href="index.jsp";
			}else if(data=="error"){alert("用户名或密码不正确");}
		})
		return false;
	});
	</script>
  	<script type="text/javascript">
  //后退部分  自动加载
    (function(){
        if(window.location.hash=='#jigou'){
            $('#index').hide();
            $('#index-background').hide();
            $('#content').load('index_zhaojigou').show();
            $('title').html("天源教育-找机构");
        }else if(window.location.hash=='#zhuye') {
        	$('#index').hide();
            $('#index-background').hide();
            $('#content').load('index_zhuye').show();
            $('title').html("天源教育-主页");
        }else if(window.location.hash=='#huodong'){
        	$('#index').hide();
            $('#index-background').hide();
            $('#content').load('index_huodongzhaopian').show();
            $('title').html("天源教育-活动");
        }else if(window.location.hash=='#liuyan'){
        	$('#index').hide();
            $('#index-background').hide();
            $('#content').load('index_zaixianliuyan').show();
            $('title').html("天源教育-在线留言");
        }else if(window.location.hash=='#laoshi'){
        	$('#index').hide();
            $('#index-background').hide();
            $('#content').load('index_zhaolaoshi').show();
            $('title').html("天源教育-找老师");
        }else if(window.location.hash=='#xuesheng'){
        	$('#index').hide();
            $('#index-background').hide();
            $('#content').load('index_zhaoxuesheng').show();
            $('title').html("天源教育-找学生");
        }else if(window.location.hash=='#youhui'){
        	$('#index').hide();
            $('#index-background').hide();
            $('#content').load('index_zhaoyouhui').show();
            $('title').html("天源教育-找优惠");
        }else if(window.location.hash=='#zhaopian'){
        	$('#index').hide();
            $('#index-background').hide();
            $('#content').load('index_huodongzhaopian').show();
            $('title').html("天源教育-精品书城");
        }else if(window.location.hash=='#xinxi'){
        	$('#index').hide();
        	$('#index-background').hide();
        	$('#content').load("shouye_showUserMessage",{userid: '<%=userid %>'},function() {}).show();
        	$('title').html("天源教育-个人中心");
        }
        
    })();
  	</script>
    <script type="text/javascript">
    //设置页面宽度
    //$('body').width(1366);$('body').height(642);
    $('body').width($(window).width());$('body').height($(window).height());
    var t={};t.width1=$(window).width();t.height1=$(window).height();t.width2=t.width1/2;
    t.height2=t.height1/2;t.lianxiwomen=0;t.lianxiwomen1=0;t.lianxiwomen2=0;t.lianxiwomen3=0;
    t.lianxiwomen4=0;t.lianxiwomen5=0;t.lianxiwomen6=0;t.lianxiwomen7=0;
    //鼠标移动时各球的运动
    function bodyMouseMove(){
        $('body').mousemove(function(event){
            var x=event.pageX-t.width2;
            var y=event.pageY-t.height2;
            var x1=parseInt($('#index-circle1').css('left'));
            var y1=parseInt($('#index-circle1').css('top'));
            $('#index-circle1').css({left:0-x*0.1,top:200-y*0.1});
            $('#index-circle2').css({left:184-x*0.06,top:178-y*0.06});
            $('#index-circle3').css({left:350-x*0.1,top:230-y*0.1});
            $('#index-circle4').css({left:0-x*0.08,top:380-y*0.08});
            $('#index-circle5').css({left:280-x*0.08,top:380-y*0.08});
        });   
    }
    bodyMouseMove();
    //阻止事件冒泡
	$("#index-circle1").mousemove(function(event){event.stopPropagation();});
    $("#index-circle2").mousemove(function(event){event.stopPropagation();});
    $("#index-circle3").mousemove(function(event){event.stopPropagation();});
    $("#index-circle4").mousemove(function(event){event.stopPropagation();});
    $("#index-circle5").mousemove(function(event){event.stopPropagation();});
    //鼠标放在球上时个球动作
    $('#index-circle1').mouseover(function(){
    	$(this).children().attr('src','img/circle1_b.png');
    	$('#index-circle1').stop(true,false).animate({
    		width:230,
    		height:240
    	},400);
    	$('#index-circle2').stop(true,false).animate({
    		width:110,
    		left:parseInt($('#index-circle2').css('left'))+50,
    		top:parseInt($('#index-circle2').css('top'))+10
    	});
    	$('#index-circle3').stop(true,false).animate({
    		width:210,
    		left:parseInt($('#index-circle3').css('left'))+70
    	});
    	$('#index-circle4').stop(true,false).animate({
    		width:220,
    		top:parseInt($('#index-circle4').css('top'))+40
    	});
    	$('#index-circle5').stop(true,false).animate({
    		width:210,
    		left:parseInt($('#index-circle5').css('left'))+50,
    		top:parseInt($('#index-circle5').css('top'))+60
    	});
    })
    $('#index-circle2').mouseover(function(){
    	$(this).children().attr('src','img/circle2_b.png');
    	$('#index-circle2').stop(true,false).animate({
    		width:177,
    		height:203
    	},400);
    	$('#index-circle1').stop(true,false).animate({
    		width:150,
    		left:parseInt($('#index-circle1').css('left'))-30
    	});
    	$('#index-circle3').stop(true,false).animate({
    		width:210,
    		left:parseInt($('#index-circle3').css('left'))+70
    	});
    	$('#index-circle4').stop(true,false).animate({
    		width:220,
    		top:parseInt($('#index-circle4').css('top'))+40
    	});
    	$('#index-circle5').stop(true,false).animate({
    		width:210,
    		left:parseInt($('#index-circle5').css('left'))+50,
    		top:parseInt($('#index-circle5').css('top'))+60
    	});
    })
    $('#index-circle3').mouseover(function(){
    	$(this).children().attr('src','img/circle3_b.png');
    	$('#index-circle3').stop(true,false).animate({
    		width:263,
    		height:215
    	},400);
    	$('#index-circle1').stop(true,false).animate({
    		width:150,
    		left:parseInt($('#index-circle1').css('left'))-90
    	});
    	$('#index-circle2').stop(true,false).animate({
    		width:110,
    		left:parseInt($('#index-circle2').css('left'))-30
    	});
    	$('#index-circle4').stop(true,false).animate({
    		width:220,
    		top:parseInt($('#index-circle4').css('top'))+40,
    		left:parseInt($('#index-circle4').css('left'))-40
    	});
    	$('#index-circle5').stop(true,false).animate({
    		width:210,
    		top:parseInt($('#index-circle5').css('top'))+60
    	});
    })
    $('#index-circle4').mouseover(function(){
    	$(this).children().attr('src','img/circle4_b.png');
    	$('#index-circle4').stop(true,false).animate({
    		width:254,
    		height:187
    	},400);
    	$('#index-circle1').stop(true,false).animate({
    		width:150,
    		top:parseInt($('#index-circle1').css('top'))-40
    	});
    	$('#index-circle2').stop(true,false).animate({
    		width:110,
    		left:parseInt($('#index-circle2').css('left'))+40,
    		top:parseInt($('#index-circle2').css('top'))-40
    	});
    	$('#index-circle3').stop(true,false).animate({
    		width:210,
    		left:parseInt($('#index-circle3').css('left'))-40
    	});
    	$('#index-circle5').stop(true,false).animate({
    		width:210,
    		left:parseInt($('#index-circle5').css('left'))+60
    	});
    })
    $('#index-circle5').mouseover(function(){
    	$(this).children().attr('src','img/circle5_b.png');
    	$('#index-circle5').stop(true,false).animate({
    		width:309,
    		height:210
    	},400);
    	$('#index-circle1').stop(true,false).animate({
    		width:150,
    		top:parseInt($('#index-circle1').css('top'))-40,
    		left:parseInt($('#index-circle1').css('left'))-40
    	});
    	$('#index-circle2').stop(true,false).animate({
    		width:110,
    		top:parseInt($('#index-circle2').css('top'))-40
    	});
    	$('#index-circle3').stop(true,false).animate({
    		width:210,
    		top:parseInt($('#index-circle3').css('top'))-40
    	});
    	$('#index-circle4').stop(true,false).animate({
    		width:220,
    		left:parseInt($('#index-circle4').css('left'))-60
    	});
    })
    function toBegin() {
    	$('#index-circle1').stop(true,false).animate({width:183,top:200,left:0},400);
    	$('#index-circle2').stop(true,false).animate({width:130,top:178,left:184});
    	$('#index-circle3').stop(true,false).animate({width:223,top:230,left:350});
    	$('#index-circle4').stop(true,false).animate({width:241,top:380,left:0});
    	$('#index-circle5').stop(true,false).animate({width:253,top:380,left:280});	
    }
    $('#index-circle1').mouseout(function(){
        $('body').unbind("mousemove");
    	toBegin();
    	$(this).children().attr('src','img/circle1.png');
        setTimeout(bodyMouseMove,1000);
    })
    $('#index-circle2').mouseout(function(){
        $('body').unbind("mousemove");
    	toBegin();
    	$(this).children().attr('src','img/circle2.png');
        setTimeout(bodyMouseMove,1000);
    })
    $('#index-circle3').mouseout(function(){
        $('body').unbind("mousemove");
    	toBegin();
    	$(this).children().attr('src','img/circle3.png');
        setTimeout(bodyMouseMove,1000);
    })
    $('#index-circle4').mouseout(function(){
        $('body').unbind("mousemove");
    	toBegin();
    	$(this).children().attr('src','img/circle4.png');
        setTimeout(bodyMouseMove,1000);
    })
    $('#index-circle5').mouseout(function(){
        $('body').unbind("mousemove");
    	toBegin();
    	$(this).children().attr('src','img/circle5.png');
        setTimeout(bodyMouseMove,1000);
    })
    //更换背景
    $(function(){
    	setInterval(function(){$("#left-back").trigger("click")},3000);
    })
    	
    $('#left-back').click(function(){
    	var src=$('#index-background').attr('src');
      	var a=parseInt(src.charAt(15))-1;
      	if(a<0) {$('#index-background').attr('src','img/background/'+4+'.jpg')
      	}else {$('#index-background').attr('src','img/background/'+a+'.jpg')}
        return false;
    });
    $('#right-back').click(function(){
    	var src=$('#index-background').attr('src');
      	var a=parseInt(src.charAt(15))+1;
      	if(a>4) {$('#index-background').attr('src','img/background/'+0+'.jpg');
      	}else {$('#index-background').attr('src','img/background/'+a+'.jpg');}
        return false;
    });
    //点击圆球时的动作
    $('#index-circle1').click(function() {
    	$(this).css('z-index',200);
    	$(this).stop(true,true).animate({
    		width:$(this).width()*6,
    		height:$(this).height()*6},100,function() {
		    	$('#index').hide();
                $('#index-background').hide();
			}
		);
        $('#content').show(400).load('index_zhuye');
        location.hash="zhuye";
        $('title').html("天源教育-主页");
        return false;
    });
    $('#index-circle2').click(function() {
    	$(this).css('z-index',200);
    	$(this).stop(true,true).animate({
    		width:$(this).width()*6,
    		height:$(this).height()*6},100,function() {
		    	$('#index').hide();
                $('#index-background').hide();
			}
		);
        $('#content').show(400).load('index_zhaoxuesheng');
        location.hash="xuesheng";
        $('title').html("天源教育-主页");
        return false;
    });
    $('#index-circle3').click(function() {
        $(this).css('z-index',200);
        $(this).stop(true,true).animate({
            width:$(this).width()*6,
            height:$(this).height()*6},100,function() {
                $('#index').hide();
                $('#index-background').hide();
            }
        );
        $('#content').show(400).load('index_zhaolaoshi');
        location.hash="laoshi";
        $('title').html("天源教育-找老师");
        return false;
    });
    $('#index-circle4').click(function() {
        $(this).css('z-index',200);
        $(this).stop(true,true).animate({
            width:$(this).width()*6,
            height:$(this).height()*6},100,function() {
                $('#index').hide();
                $('#index-background').hide();
            }
        );
        $('#content').show(400).load('index_zhaojigou');
        location.hash="jigou";
        $('title').html("天源教育-找机构");
        return false;
    });
    $('#index-circle5').click(function() {
        $(this).css('z-index',200);
        $(this).stop(true,true).animate({
            width:$(this).width()*6,
            height:$(this).height()*6},100,function() {
                $('#index').hide();
                $('#index-background').hide();
            }
        );
        $('#content').show(400).load('index_zhaoyouhui');
        location.hash="youhui";
        $('title').html("天源教育-找优惠");
        return false;
    });
    $(".gerenxinxi").click(function(){
    	$('#index').hide();
        $('#index-background').hide();
        location.hash="xinxi";
        $('#content').load("shouye_showUserMessage",{userid: '<%=userid %>'},function() {
        	
        }).show(400);
        $('title').html("天源教育-个人中心");
    })
    </script>
    <script type="text/javascript">
    //联系我们动作
    $('#index-lianxiwomen').mouseover(function(){
   		$(this).stop(true,false).animate({width:0,height:0},200).attr('id','index-lianxiwomen-big');
   		$(this).stop(true,false).animate({width:270, height:270},400,function(){
   		 $('#index-lianxiwomen-big').mouseout(function() {
   	    	$(this).stop(true,false).animate({width:0,height:0},200);
   	        $(this).stop(true,false).animate({width:100, height:80},400,function(){
   	        	$(this).attr('id','index-lianxiwomen')
   	        });
   	    });
   		});
    });
    //去除链接虚框
    $('a').bind('focus',function(){if(this.blur){ this.blur();}});
    </script>
    <script type="text/javascript">
  	//登录按钮动作
    $('#index-denglu').click(function() {$('#denglukuangwai').show(400);return false;});
    $('.fxui-tab').click(function(event){event.stopPropagation();});
    $('#denglutop').click(function(event){event.stopPropagation();})
    $('#denglukuangwai').click(function() {$('#denglukuangwai').hide(400);})
    $('.fxui-tab-tit').click(function() {$(this).addClass("active");$(this).siblings().removeClass("active");});
    $('.fxui-tab').fxuiTab();
    $('.zhuxiao').click(function(){$.cookie('userId', null,  {expires: 0 });location.href='index.jsp';});
    </script>
    <script>
    //预约函数
    function my_ib_wopen(){ib_wopen()}
    </script>
    <div style="display:none;">
    <script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Faec411cb4885624a34c7f9b3fa55c0a2' type='text/javascript'%3E%3C/script%3E"));
</script>
    </div>
    
  </body>
</html>