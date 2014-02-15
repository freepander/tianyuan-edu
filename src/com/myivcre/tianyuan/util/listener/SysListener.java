package com.myivcre.tianyuan.util.listener;

import java.io.IOException;
import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import com.myivcre.tianyuan.util.OrganizationLook;

public class SysListener extends HttpServlet implements ServletContextListener {

	private static final long serialVersionUID=1L;
	Timer timer=new Timer();
	public void service(ServletRequest request,ServletResponse response) throws ServletException, IOException{
		
	}
	
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("系统定时任务初始化结束....");
		timer.cancel();
	}

	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("系统定时任务初始化开始....");
		//调用任务
		//每1小时执行一次
//		timer.schedule(new OrganizationLook(),0,2*10000);
		timer.schedule(new OrganizationLook(),0,1*60*60*1000);
		
	}

}
