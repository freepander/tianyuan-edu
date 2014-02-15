<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<form id="teacherusermessageform" method="post">
<input type="hidden" name="id" value="<s:property value="teacherUser.id" />">
<label>科目类别</label>
<select name="categoryId">
	<s:iterator value="list">
		<option value='<s:property value="id"/>'><s:property value="name"/></option>
	</s:iterator>
</select>
<label>讲授科目</label><input name="lesson" type="text" value="<s:property value="teacherUser.lesson" />" />
<label>课时费用</label><input name="money" type="text" value="<s:property value="teacherUser.money" />" />
<label>授课时间</label><input name="time" type="text" value="<s:property value="teacherUser.time" />" />
<label>姓名：</label><input name="name" type="text" value="<s:property value="teacherUser.name" />" />
<label>学历：</label><input name="post" type="text" value="<s:property value="teacherUser.post" />" />
<label>专业：</label><input name="post2" type="text" value="<s:property value="teacherUser.post2" />" />
<label>邮编：</label><input name="experience" type="text" value="<s:property value="teacherUser.experience" />" />
<label>居住地：</label><input name="address" type="text" value="<s:property value="teacherUser.address" />" />
<label>年龄：</label><input name="age" type="text" value="<s:property value="" />" />
<label>邮箱：</label><input name="email" type="text" value="<s:property value="teacherUser.email" />" />
<label>电话：</label><input name="telphone" type="text" value="<s:property value="teacherUser.telphone" />" />
<label>QQ：</label><input name="qq" type="text" value="<s:property value="teacherUser.qq" />" />
</form>
<button style="margin-left: 122px; margin-right: 30px;" id="teacherMessageSubmit" >提交</button><button onclick="javascipt:location.reload()">跳过</button>
<script>
$("#teacherMessageSubmit").click(function() {
	var id=$("#teacherusermessageform input[name='id']").val();
	var lesson=$("#teacherusermessageform input[name='lesson']").val();
	var categoryId=$("#teacherusermessageform select[name='categoryId']").val();
	var money=$("#teacherusermessageform input[name='money']").val();
	var time=$("#teacherusermessageform input[name='time']").val();
	var name=$("#teacherusermessageform input[name='name']").val();
	var post=$("#teacherusermessageform input[name='post']").val();
	var political=$("#teacherusermessageform input[name='political']").val();
	var experience=$("#teacherusermessageform input[name='experience']").val();
	var address=$("#teacherusermessageform input[name='address']").val();
	var age=$("#teacherusermessageform input[name='age']").val();
	var email=$("#teacherusermessageform input[name='email']").val();
	var telphone=$("#teacherusermessageform input[name='telphone']").val();
	var qq=$("#teacherusermessageform input[name='qq']").val();
	var post2=$("#teacherusermessageform input[name='post2']").val();
	$.post("shouye_updateTeacherMessage",{id: id, lesson: lesson, categoryId: categoryId, money: money, time: time, name: name, post: post, political: political, experience: experience, address: address, email: email, telphone: telphone, qq: qq,post2: post2},function(data){
		if(data=='success'){
			alert("资料更新成功！");
			location.reload();
		} else {
			alert("好像出问题了，请稍后在式。");
		}
	});
})
</script>