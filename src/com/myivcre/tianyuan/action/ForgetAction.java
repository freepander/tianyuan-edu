package com.myivcre.tianyuan.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.StudentUser;
import com.myivcre.tianyuan.model.TeacherUser;

@Component("forgetAction")
@Scope("prototype")
public class ForgetAction extends BaseAction {
	private String username;
	private String email;
	private String password;
	public String student1(){
		String hql="from studentuser where username='"+username+"' and email='"+email+"'";
		System.out.println(hql);
		this.list=this.baseService.getByHal(hql);
		if(list.size()>0){
			StudentUser su=(StudentUser) this.list.get(0);
			this.id=su.getId();
			return "studentChangePassword";
		}
		return "studentChangePassword2";
	}
	public String student2(){
		StudentUser su=(StudentUser) this.baseService.get(StudentUser.class, id);
		su.setPassword(password);
		this.baseService.update(su);
		return "backindex";
	}
	public String teacher1(){
		String hql="from teacheruser where username='"+username+"' and email='"+email+"'";
		System.out.println(hql);
		this.list=this.baseService.getByHal(hql);
		if(list.size()>0){
			TeacherUser tu=(TeacherUser) this.list.get(0);
			this.id=tu.getId();
			return "teacherChangePassword";
		}
		return "teacherChangePassword2";
	}
	public String teacher2(){
		TeacherUser tu=(TeacherUser) this.baseService.get(TeacherUser.class, id);
		tu.setPassword(password);
		this.baseService.update(tu);
		return "backindex";
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
