<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<s:iterator value="pageModel.objects">
<div class="fun_tanchu_artivities" data-id="<s:property value="id"/>" style="float:left;width:400px;margin-right:10px; height:140px; margin-bottom:16px; cursor: pointer;">
	<img src="upload/artivitiespic/<s:property value="logo"/>" style="float:left; margin-right:10px;width:160px; height:110px;" >
	<div style="height:110px;">
		<p style="line-height:16px;height:16px; width:210px; overflow:hidden; ">日期：<s:property value="date"/></p>
		<p style="line-height:16px;height:16px; width:210px; overflow:hidden; ">时间：<s:property value="time"/></p>
		<p style="line-height:16px;height:34px; width:210px; overflow:hidden; ">地点：<s:property value="address"/></p>
		<p style="line-height:16px;height:16px; width:210px; overflow:hidden; ">活动：<s:property value="name"/></p>
	</div>
</div>
</s:iterator>
<script>
$('.fun_tanchu_artivities').click(function(){
	var id=$(this).attr("data-id");
    $.getJSON("index_getArtivitiesById",{id:id},function(json){
      $("#xinwen-content").html(json['content']);
      $("#xinwen-content").mCustomScrollbar({
        scrollButtons:{
          enable:true
        }
      });
    })
    $("#xinwen-bg").show(400);
    return false;
})
$('#xinwen-close').click(function(){
      $("#xinwen-bg").hide(400);
    })
</script>