package com.myivcre.tianyuan.util;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.myivcre.tianyuan.model.Organization;


public class OrganizationLook extends TimerTask {
	ApplicationContext ctx = new FileSystemXmlApplicationContext("applicationContext.xml");
	SessionFactory sessionFactory=(SessionFactory) ctx.getBean("sessionFactory");
	
	
	public void run() {
		Date date=new Date();
		Calendar c=Calendar.getInstance();
		c.setTime(date);
		int day=c.get(Calendar.DAY_OF_WEEK);
		int hour=c.get(Calendar.HOUR_OF_DAY);
		if(day==1&&hour==23){
			HibernateTemplate ht=new HibernateTemplate(sessionFactory);
			List list=ht.find("from organization");
			for(int i=0;i<list.size();i++){
				Organization o=(Organization)list.get(i);
				o.setLook(0);
				ht.update(o);
			}
		}
	}

}
