package com.myivcre.tianyuan.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.User;

@Component("userAction")
@Scope("prototype")
public class UserAction extends BaseAction{
	public String name;
	private String username;
	private String password;
	private User user;
	public String add(){
		this.user=new User();
		this.list=this.baseService.getByHal("from user");
		for(int i=0;i<list.size();i++){
			User u=(User) this.list.get(i);
				if(u.getUsername().equals(username)){
					this.message="用户名已经存在，请更换用户名。";
					return "list";
				}
		}
		this.user.setName(name);
		this.user.setUsername(username);
		this.user.setPassword(password);
		this.baseService.save(this.user);
		return "list";
	}
	public String delete(){
		this.user=(User) this.baseService.get(User.class, id);
		this.baseService.delete(this.user);
		return "list";
	}
	public String update(){
		this.user=(User) this.baseService.get(User.class, id);
		this.user.setPassword(password);
		this.baseService.save(this.user);
		return "list";
	}
	public String list(){
		this.list=this.baseService.getByHal("from user");
		return "success";
	}
	public String input(){
		this.user=(User) this.baseService.get(User.class, id);
		return "success";
	}
	public String login(){
		this.list=this.baseService.getByHal("from user");
		for(int i=0;i<list.size();i++){
			User u=(User) this.list.get(i);
			if(u.getUsername().equals(username)&&u.getPassword().equals(password)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session=request.getSession();
				session.setAttribute("username", username);
				System.out.println(session.getAttribute("username"));
				return "success";
			}
		}
		return "error";
		
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
