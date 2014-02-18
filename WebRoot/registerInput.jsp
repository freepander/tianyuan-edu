<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


		<div style="width:100%;height:100%;position:relative;padding-top:100px;">
			<div style="width:600px;height:480px;margin-left:auto;margin-right:auto;background:url(img/bg11.png);color:#FFF;position:relative;">
				<div style="width:400px; height:100%;float:right;" >
					<form id="fun_zhuce_student" style="padding-top:10px;line-height:26px;">
						<p>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：<input type="text" name="email"></p>
						<p>用&nbsp;户&nbsp;名：<input type="text" name="username"></p>
						<p>密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password"></p>
						<p>学习类别：<select name="categoryId">
						<s:iterator value="listT">
							<option value='<s:property value="id"/>'><s:property value="name"/></option>
						</s:iterator>
						</select></p>
						<p>意向科目：<input type="text" name="lesson"></p>
						<p>预期费用：<input type="text" name="money">元/课时</p>
						<p>时间安排：<input type="text" name="time"></p>
						<p>姓&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" name="name"></p>
						<p>性&nbsp;&nbsp;&nbsp;&nbsp;别：<input value="男" name="sex" type="radio" checked>男<input value="女" name="sex" type="radio" >女</p>
						<p>年&nbsp;&nbsp;&nbsp;&nbsp;龄：<input type="text" name="age"></p>
						<p>电&nbsp;&nbsp;&nbsp;&nbsp;话：<input type="text" name="telphone"></p>
						<p>学&nbsp;&nbsp;&nbsp;&nbsp;校：<input type="text" name="school"></p>
						<p>是否着急：<input value="100" name="state" type="radio" />很急<input value="10" name="state" type="radio" checked />长期、不急</p>
						<p>备&nbsp;&nbsp;&nbsp;&nbsp;注：<textarea style="width:152px;height:60px;" name="recommend"></textarea></p>
						<input type="submit" value="提交" style="margin-left:187px;margin-top:10px;padding-top:4px;padding-bottom:4px;padding-left:10px;padding-right:10px;background:#FFF;color:#000;border:0;border-radius:15px;">
					</form>
					<form id="fun_zhuce_teacher" style="display:none;padding-top:10px;line-height:26px;">
						<p>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：<input type="text" name="email"></p>
						<p>用&nbsp;户&nbsp;名：<input type="text" name="username"></p>
						<p>密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password"></p>
						<p>讲授类别：<select name="categoryId">
						<s:iterator value="listT2">
							<option value='<s:property value="id"/>'><s:property value="name"/></option>
						</s:iterator>
						</select></p>
						<p>讲授科目：<input type="text" name="lesson"></p>
						<p>预期费用：<input type="text" name="money">元/课时</p>
						<p>时间安排：<input type="text" name="time"></p>
						<p>姓&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" name="name"></p>
						<p>性&nbsp;&nbsp;&nbsp;&nbsp;别：<input value="男" name="sex" type="radio" checked>男<input value="女" name="sex" type="radio" >女</p>
						<p>电&nbsp;&nbsp;&nbsp;&nbsp;话：<input type="text" name="telphone"></p>
						<p>学&nbsp;&nbsp;&nbsp;&nbsp;历：<input type="text" name="post"></p>
						<p>学&nbsp;&nbsp;&nbsp;&nbsp;校：<input type="text" name="political"></p>
						<p>专&nbsp;&nbsp;&nbsp;&nbsp;业：<input type="text" name="post2"></p>
						<p style="margin-top:2px;">备&nbsp;&nbsp;&nbsp;&nbsp;注：<textarea style="width:152px;height:60px;" name="recommend"></textarea></p>
						<input type="submit" value="提交" style="margin-left:187px;margin-top:10px;padding-top:4px;padding-bottom:4px;padding-left:10px;padding-right:10px;background:#FFF;color:#000;border:0;border-radius:15px;">
					</form>
				</div>
				<h2 style="margin-left:40px; padding-top:10px;width:100px;">注册</h2>
				<select id="fun_select_shenfen" style="margin-left:40px; margin-top:20px; ">
					<option value="1">我是学生</option>
					<option value="2">我是老师</option>
				</select>
				<a id="fun_close_register" style="color:#FFF;position:absolute;right:10px;bottom:10px;" href="javascript:void(0);">关闭</a>
			</div>
		</div>
<script>
$('#fun_zhuce_student').submit(function(){
	var email=$("#fun_zhuce_student input[name='email']").val();
	var username=$("#fun_zhuce_student input[name='username']").val();
	var password=$("#fun_zhuce_student input[name='password']").val();
	if(username==""){alert("用户名不能为空");return false;}
	if(password==""){alert("密码不能为空");return false;}
	if(email==""){alert("邮箱不能为空");return false;}
	var reg=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	if(!reg.test(email)){alert("请输入正确的邮箱");return false;}
	var reg2=/^[a-zA-Z0-9_]{1,}$/;
	if(!reg2.test(username)){alert("用户名只能由字母和数字组成，请更换。");return false;}
	if(username.length<5){alert("用户名长度不能小于5位");return false;}
	$.post("shouye_studentRegister2",$('#fun_zhuce_student').serialize(),function(data){
		if(data=="success"){alert("注册成功！");location.href="index.jsp";
		}else if(data=="error1"){alert("改用户名或邮箱已被占用，请更换后重试。");}
	})
	return false;
})
$('#fun_zhuce_teacher').submit(function(){
	var email=$("#fun_zhuce_teacher input[name='email']").val();
	var username=$("#fun_zhuce_teacher input[name='username']").val();
	var password=$("#fun_zhuce_teacher input[name='password']").val();
	if(username==""){alert("用户名不能为空");return false;}
	if(password==""){alert("密码不能为空");return false;}
	if(email==""){alert("邮箱不能为空");return false;}
	var reg=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	if(!reg.test(email)){alert("请输入正确的邮箱");return false;}
	var reg2=/^[a-zA-Z0-9_]{1,}$/;
	if(!reg2.test(username)){alert("用户名只能由字母和数字组成，请更换。");return false;}
	if(username.length<5){alert("用户名长度不能小于5位");return false;}
	$.post("shouye_teacherRegister2",$('#fun_zhuce_teacher').serialize(),function(data){
		if(data=="error"){alert("改用户名或邮箱已被占用，请更换后重试。");
		}else{alert("注册成功！");location.href="index.jsp";}
	})
	return false;
})
$('#fun_select_shenfen').change(function(){
	if($(this).val()==1){
		$('#fun_zhuce_student').show();
		$('#fun_zhuce_teacher').hide();
	}else{
		$('#fun_zhuce_student').hide();
		$('#fun_zhuce_teacher').show();
	}
});
$('#fun_close_register').click(function(){
	$('#fun_zhucekuangwai').hide();
})
</script>