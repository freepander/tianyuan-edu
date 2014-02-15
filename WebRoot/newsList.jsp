<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<ul>
	<s:iterator value="pageModel.objects" status="st">
	<li class="xinwen-tanchu1" data-newsid="<s:property value="id" />"><span style="text-align:right;background:none;float:right;color:#FFF;"><s:date name="date" format="MM-dd-yyyy"/></span><a href="javascript:void(0);" style="color:<s:property value="color"/>;"><s:property value="#st.index+1"/>、&nbsp;<s:property value="title" /></a></li>
	</s:iterator>
</ul>
<div class="pagination pull-right" style="float:right;">
        <ul>
	    	<s:if test="pageNum==1">
		    	
		    </s:if>
		    <s:else>
		    	<li id="fun-new-shangyiye" style="width:50px;"><a href="<s:property value="pageModel.url" /><s:property value="pageNum-1" />">上一页</a></li>
		    </s:else>
		    <s:iterator value="pageModel.pageNumList" status="st" >
		    	<s:if test="pageNum==#st.index+1">
		    	<li style="color:#FFF; border-bottom:1px solid #FFF;"> <s:property /></li>
		    	</s:if>
		    	<s:else>
		    	<li><a class="fun-new-ye" href="<s:property value="pageModel.url" /><s:property />"> <s:property /> </a></li>
		    	</s:else>
		    	
		    </s:iterator>
		    <s:if test="pageNum==pageModel.countPage" >
		    	
		    </s:if>
		    <s:else>
		    	<li id="fun-new-xiayiye" style="width:42px;"><a href="<s:property value="pageModel.url" /><s:property value="pageNum+1" /> ">下一页</a></li>
		    </s:else>
	    </ul>
      </div>
<script>
$("#fun-new-shangyiye").click(function(event){
	$('.news-content').load("index_getNewsByCategoryId",{id : <s:property value="id"/> , pageNum : <s:property value="pageNum-1"/>},function(){});
	return false;
});
$("#fun-new-xiayiye").click(function(event){
	$('.news-content').load("index_getNewsByCategoryId",{id : <s:property value="id"/> , pageNum : <s:property value="pageNum+1"/>},function(){});
	return false;
});
$(".fun-new-ye").click(function(event){
	var sid=$(this).html();
	$('.news-content').load("index_getNewsByCategoryId",{id : <s:property value="id"/> , pageNum : sid},function(){});
	return false;
});
$('.xinwen-tanchu1').click(function(){
    var id=$(this).data("newsid");
    $.getJSON("index_getNewsById",{id:id},function(json){
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