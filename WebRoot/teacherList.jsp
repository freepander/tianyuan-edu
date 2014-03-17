<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div id="list-border">
<ul id="top">
	<s:iterator value="teacherList">
		<li>
      <a target="_blank" href="teacher/<s:property value="url"/>">
        <img src="upload/teacherlogo/<s:property value="logo"/>" />
        <p>姓名：<s:property value="name"/><br>科目：<s:property value="lesson"/></p>
      </a>
    </li>
	</s:iterator>
</ul>
</div>
<ul id="body">
	<s:iterator value="teacherList2" status="st">
		<li class="fun_click" data-dianji="<s:property value="soucre"/>" data-liulanliang="<s:property value="dianji"/>" data-moren="<s:property value="#st.index"/>">
      <a href="javascript:void(0);" data-id="<s:property value="id"/>" >
        <img src="upload/teacherlogo/<s:property value="logo"/>">
        <p>姓名：<s:property value="name"/><br>学历：<s:property value="post"/><br>科目：<s:property value="lesson"/><br></p>
      </a>
      <s:if test="ishuiyuan"><img src="img/state.png" style="float:right; width: 20px; height: 20px; margin-top: -20px;"></s:if>
    </li>
	</s:iterator>
	
</ul>
<script>
$("#laoshi-list #body a").die('click')
$("#laoshi-list #body a").live('click',function(){
	$('.studentMessage').hide();
	var id=$(this).data('id');
	$.get("shouye_teacherLookAdd?id="+id);
    $.getJSON("index_teacherMessage",{id:id},function(json){
      var studentMessage=$("<div class='studentMessage'></div>");
      var studentClose=$("<a class='close' href='javascript:void(0)'></a>");
      var studentImg=$("<img class='logo' src='upload/teacherlogo/"+json['logo']+"' >");
      var studentP=$("<p>姓名："+json['name']+"<br/>授课科目："+json['lesson']+"<br/>费用："+json['money']+"<br/>时间安排："+json['time']+"<br/>期望课时费："+json['money']+"<br/>评分：</p>");
      var source0=$("<p>评分</p>");
      var source=$("<div class='fun_teacher_source'></div>");
      var source2=$("<p class='fun_teacher_source2'></p>")
      var yuyue=$("<button class='student-yuyue'  onclick='ib_wopen();'>预约</button><button data-id='"+id+"'  class='student-yuyue' onclick='openGerenzhuye(this)'>主页</button>")
      studentMessage.append(studentClose);
      studentMessage.append(studentImg);
      studentMessage.append(studentP);
      studentMessage.append(source);
      studentMessage.append(source2)
      studentMessage.append(yuyue);
      $("#sub-content").prepend(studentMessage);
      if(json['soucreNumber']>1){
    	  $('.fun_teacher_source2').html(json['soucre'])
      }else{
    	  $('.fun_teacher_source2').html("暂无评价");
      }
      $('.fun_teacher_source').raty({readOnly: true,score: json['soucre'],number:5,width:260});
      studentMessage.show(400);
      $(".studentMessage .close").click(function(){
  		$(this).parent().hide(400);
  	  })
    });
    return false;
  });
function openGerenzhuye(a){
	  var id=$(a).attr('data-id');
    $('#content').load("shouye_gerenteacher",{id: id},function() {
    	
    }).show(400);
}
</script>