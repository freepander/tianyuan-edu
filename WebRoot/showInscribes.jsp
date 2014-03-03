<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
  <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="教育，英语，文化课，教育机构，哈尔滨，平台，家教，名师，咨询，书城，教育新闻">
    <meta name="description" content="哈尔滨天源教育咨询平台，找家教、赵老师、招学生、找培训就上天源教育平台。">
    <title>天源教育平台-历年真题</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">
    <div class="row">
    	<ol class="breadcrumb">
		  <li><a href="http://www.tianyuan-edu.com">天源教育平台</a></li>
		  <li><a href="http://www.tianyuan-edu.com/#zhaopian">历年真题</a></li>
		  <li class="active"><s:property value="inscribes.name"/> </li>
		  <s:if test='!inscribes.doc==""'>
		  <li style="float:right"><a href="http://www.tianyuan-edu.com/upload/<s:property value="inscribes.doc"/>">点击下载</a></li>
		  </s:if>
		  
		</ol>
    </div>
    <div class="row" style="max-width:1000px;word-break: break-all; work-wrap: break-word;">
    	${inscribes.content }
    </div>

      
    </div> <!-- /container -->
<div style="display:none;">
    <script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Faec411cb4885624a34c7f9b3fa55c0a2' type='text/javascript'%3E%3C/script%3E"));
</script>
    </div>
    
  </body>
</html>
