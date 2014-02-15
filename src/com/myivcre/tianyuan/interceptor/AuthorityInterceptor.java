package com.myivcre.tianyuan.interceptor;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;


public class AuthorityInterceptor extends MethodFilterInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		String username=(String) ServletActionContext.getRequest().getSession().getAttribute("username");
		if(username!=null&&!username.equals("")){
			arg0.invoke();
		}
		return "login";
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
