<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
 <head>
  <title>天源教育平台后台管理系统</title>
  <base href="<%=basePath%>">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="back/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
  <link href="back/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
  <link href="back/assets/css/main-min.css" rel="stylesheet" type="text/css" />
 </head>
 <body>
  <div class="header">
      <div class="dl-title">
          <span class="lp-title-port">天源教育平台后台管理系统</span>
      </div>
  </div>
   <div class="content">
    <div class="dl-main-nav">
      <div class="dl-inform"></div>
      <ul id="J_Nav"  class="nav-list ks-clear">
        <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">内容</div></li>
        <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">用户</div></li>
      </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
   </div>
  <script type="text/javascript" src="back/assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="back/assets/js/bui-min.js"></script>
  <script type="text/javascript" src="back/assets/js/config-min.js"></script>
  <script>
    BUI.use('common/main',function(){
      var config = [{
          id:'testA', 
          homePage : 'welcome',
          menu:[{
              text:'基本信息',
              items:[
                {id:'welcome',text:'欢迎页面',href:'back/index.jsp'}
              ]
            },{
              text:'新闻管理',
              items:[
                {id:'news',text:'文字新闻',href:'back/news_list'},
                {id:'newspic',text:'图片新闻',href:'back/newspic_list'},
                {id:'newscategory',text:'新闻类别',href:'back/newscategory_list'}
              ]
            },{
            	text:'留言管理',
                items:[
                	{id:'message_list',text:'留言列表',href:'back/message_list'}
                  ]
            },{
            	text:'图书管理',
                items:[
                	{id:'book_list',text:'图书列表',href:'back/book_list'},
                	{id:'bookCategory_list',text:'图书类别列表',href:'back/bookCategory_list'},
                  ]
            },{
            	text:'首页广告',
                items:[
                	{id:'ad_list',text:'编辑',href:'back/ad_list'},
                  ]
            },{
            	text:'活动管理',
                items:[
                	{id:'activities_list',text:'活动列表',href:'back/activities_list'},
                	{id:'activities_input',text:'添加活动',href:'back/activities_input'}
                  ]
            }]
          },{
              id:'用户管理',
              menu:[{
                  text:'教师管理',
                  items:[
                    {id:'teacher_list',text:'教师列表',href:'back/teacher_list'},
                    {id:'teacherUser_list',text:'教师用户列表',href:'back/teacherUser_list'},
                    {id:'teacherCategory_list',text:'教师类别列表',href:'back/teacherCategory_list'},
                    {id:'teacherCategory_list',text:'添加教师用户',href:'back/teacherUser_input'}
                  ]
              },{
                  text:'学生管理',
                  items:[
                    {id:'studentUser_list',text:'学生列表',href:'back/studentUser_list'},
                    {id:'studentCategory_list',text:'学生类别列表',href:'back/studentCategory_list'},
                  ]
              },{
                  text:'机构管理',
                  items:[
                    {id:'organization',text:'机构管理',href:'back/organization_list'},
                    {id:'organizationRegional',text:'机构区域',href:'back/organizationRegional_list'},
                    {id:'organizationIndustry',text:'机构行业',href:'back/organizationIndustry_list'}
                  ]
              }<s:if test='#session.username=="mabowen"'>,{
                  text:'管理员',
                  items:[
                    {id:'user',text:'管理员管理',href:'back/user_list'}
                  ]
              }</s:if>]
            }];
      new PageUtil.MainPage({
        modulesConfig : config
      });
    });
  </script>
  
 </body>
</html>
