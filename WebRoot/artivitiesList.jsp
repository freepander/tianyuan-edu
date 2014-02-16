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
		<p style="line-height:20px;height:20px; width:210px; overflow:hidden; ">日期：<s:property value="date"/></p>
		<p style="line-height:20px;height:20px; width:210px; overflow:hidden; ">时间：<s:property value="time"/></p>
		<p style="line-height:16px;height:36px; width:210px; overflow:hidden; ">地点：<s:property value="address"/></p>
		<p style="line-height:16px;height:36px; width:210px; overflow:hidden; ">活动：<s:property value="name"/></p>
	</div>
</div>
</s:iterator>
<div class="pagination pull-right" style="float:right; width:100%;">
        <ul style=" text-align:right; list-style:none; display:inline-block; float:right;">
	    	<s:if test="pageNum==1">
		    </s:if>
		    <s:else>
		    	<li id="fun-new-shangyiye" style="line-height:30px;background:url(img/acti_prev.png);width:85px; height:30px;display:block;"><a style="color:#FFF;" href="<s:property value="pageModel.url" /><s:property value="pageNum-1" />">上一页</a></li>
		    </s:else>
		    <s:iterator value="pageModel.pageNumList" status="st" >
		    	<s:if test="pageNum==#st.index+1">
		    	<li style="line-height:30px;width:30px;height:30px;display:block;color:#FFF;background:url(img/acti_select.png);"> <s:property /></li>
		    	</s:if>
		    	<s:else>
		    	<li style="line-height:30px;width:30px;height:30px;display:blcok;background:url(img/acti_normal.png);"><a style="color:#FFF;" class="fun-new-ye" href="<s:property value="pageModel.url" /><s:property />"> <s:property /> </a></li>
		    	</s:else>
		    </s:iterator>
		    <s:if test="pageNum==pageModel.countPage" >
		    </s:if>
		    <s:else>
		    	<li id="fun-new-xiayiye" style="line-height:30px;width:85px; height:30px;display:blcok;background:url(img/acti_next.png);"><a style="color:#FFF;" href="<s:property value="pageModel.url" /><s:property value="pageNum+1" /> ">下一页</a></li>
		    </s:else>
	    </ul>
      </div>
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
$("#fun-new-shangyiye").click(function(event){
	$('#fun_activitiesList').load("index_artivitiesList",{id : <s:property value="id"/> , pageNum : <s:property value="pageNum-1"/>},function(){});
	return false;
});
$("#fun-new-xiayiye").click(function(event){
	$('#fun_activitiesList').load("index_artivitiesList",{id : <s:property value="id"/> , pageNum : <s:property value="pageNum+1"/>},function(){});
	return false;
});
$(".fun-new-ye").click(function(event){
	var sid=$(this).html();
	$('#fun_activitiesList').load("index_artivitiesList",{id : <s:property value="id"/> , pageNum : sid},function(){});
	return false;
});
</script>