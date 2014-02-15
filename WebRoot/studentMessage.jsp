<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div id="studentMessagePageForm">
<label>学习类别</label>
<select name="categoryId">
	<s:iterator value="list">
		<option value='<s:property value="id"/>'><s:property value="name"/></option>
	</s:iterator>
</select>
<label>学习科目</label><input name="lesson" type="text" value="<s:property value="studentUser.lesson" />" />
<input type="hidden" name="id" value="<s:property value="studentUser.id" />" >
<label>预期课时费用</label><input name="money" type="text" value="<s:property value="studentUser.money" />" />
<label>空余时间</label><input name="time" type="text" value="<s:property value="studentUser.time" />" />
<label>姓名：Name</label><input name="name" type="text" value="<s:property value="studentUser.name" />" />
<label>性别：Sex</label><input type="radio" value="男" name="sex" checked >男<input type="radio" value="女" name="sex" >女<br>
<label>年龄：Age</label><input name="age" type="text" value="<s:property value="studentUser.age" />" />
<label>学校：School</label><input name="school" type="text" value="<s:property value="studentUser.school" />" />
<label>邮箱：Mail</label><input name="mail" type="text" value="<s:property value="studentUser.email" />" />
<label>电话：telphone</label><input name="telphone" type="text" value="<s:property value="studentUser.telphone" />" />
<label>是否着急：</label><input id="danxuan-ji" type="radio" value="100" name="state" checked  >很急<input id="danxuan-buji" type="radio" value="10" name="state" >长期、不急<br>
<label>备注：</label><textarea id="studentMessage-recommend" name="recommend" rows="10" cols="10"></textarea>
<button style="margin-left: 130px; margin-top: 20px;" id="studentMessagePage-submit">提交</button>&nbsp;&nbsp;&nbsp;<button onclick="javascipt:location.reload()" >跳过</button>
</div>	
<script>
$("#studentMessagePage-submit").click(function(){
	var id=$("#studentMessagePageForm input[name='id']").val();
	var lesson=$("#studentMessagePageForm input[name='lesson']").val();
	var categoryId=$("#studentMessagePageForm select[name='categoryId']").val();
	var money=$("#studentMessagePageForm input[name='money']").val();
	var time=$("#studentMessagePageForm input[name='time']").val();
	var name=$("#studentMessagePageForm input[name='name']").val();
	var sex=$("#studentMessagePageForm input:radio[name='sex']:checked").val();
	var address=$("#studentMessagePageForm input[name='address']").val();
	var age=$("#studentMessagePageForm input[name='age']").val();
	var school=$("#studentMessagePageForm input[name='school']").val();
	var mail=$("#studentMessagePageForm input[name='mail']").val();
	var telphone=$("#studentMessagePageForm input[name='telphone']").val();
	var state=$("#studentMessagePageForm input:radio[name='state']:checked").val();
	var recommend=$("#studentMessage-recommend").val();
	console.log(recommend);
	$.post("shouye_updateStudentMessage",{id: id, lesson: lesson, categoryId: categoryId, money: money, time: time, name: name, sex: sex, address: address, age: age, school: school, email: mail, telphone: telphone, state: state,recommend:recommend},function(data){
		if(data=="success"){
			alert("资料更新成功！");
			location.reload();
		}else{
			alert("好像出问题了，请稍后重试。");
		}
	});
});

</script>