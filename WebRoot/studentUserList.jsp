<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<ul>
<s:iterator value="studentList">
  <li>
    <a href="javascript:void(0);" data-id="<s:property value="id"/>">
      <img src="upload/studentlogo/<s:property value="logo"/>" />
      <p>姓名:<s:property value="name"/><br />需求学科：<s:property value="lesson"/><br />学校：<s:property value="school"/></p>
    </a>
    <s:if test="state>=100"><img src="img/state.png" class="state"></s:if>
  </li>
</s:iterator>
</ul>
<script>

$("#xuesheng-list a").click(function(){
	$('.studentMessage').hide();
    var id=$(this).data('id');
    $.getJSON("index_studentMessage",{id:id},function(json){
      var studentMessage=$("<div class='studentMessage'></div>");
      var studentClose=$("<a class='close' href='javascript:void(0)'></a>");
      var studentImg=$("<img class='logo' src='upload/studentlogo/"+json['logo']+"' >");
      var studentP=$("<p>姓名："+json['name']+"<br/>性别："+json['sex']+"<br/>年龄："+json['age']+"<br/>电话："+json['telphone']+"<br/>意向科目："+json['lesson']+"<br/>空闲时间："+json['time']+"<br/>期望课时费："+json['money']+"<br/></p>");
      var yuyue=$("<button class='student-yuyue'  onclick='ib_wopen();'>预约</button><button data-id='"+id+"' class='student-yuyue' onclick='openGerenzhuye(this)'>主页</button>")
      studentMessage.append(studentClose);
      studentMessage.append(studentImg);
      studentMessage.append(studentP);
      studentMessage.append(yuyue);
      $("#sub-content").prepend(studentMessage);
      studentMessage.show(400);
      $(".studentMessage .close").click(function(){
  		$(this).parent().hide(400);
  	})
    });
    return false;
  });
  function openGerenzhuye(a){
	  var id=$(a).attr('data-id');
      $('#content').load("shouye_gerenstudent",{id: id},function() {
      	
      }).show(400);
  }
</script>