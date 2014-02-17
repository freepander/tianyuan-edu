package com.myivcre.tianyuan.action;

import java.util.Date;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.StudentCategory;
import com.myivcre.tianyuan.model.StudentUser;

@Component("studentUserAction")
@Scope("prototype")
public class StudentUserAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private String name;
	private StudentUser studentUser;
	private String age;
	private List<StudentCategory> categoryList;
	private long categoryId;
	private String lesson;
	private String money;
	private String password;
	private String school;
	private String sex;
	private int state;
	private String telphone;
	private String time;
	private String username;
	private String logo;
	private String recommend;
	private boolean newcome;
	private Date date;
	public String list(){
		this.list = this.baseService.getByHal("from studentuser order by id desc");		
		return "success";
	}
	public String addMessage(){
		this.studentUser=(StudentUser) this.baseService.get(StudentUser.class, id);
		this.studentUser.setAge(age);
		StudentCategory category=(StudentCategory) this.baseService.get(StudentCategory.class, categoryId);
		this.studentUser.setCategory(category);
		this.studentUser.setLesson(lesson);
		this.studentUser.setMoney(money);
		this.studentUser.setName(name);
		this.studentUser.setSchool(school);
		this.studentUser.setSex(sex);
		this.studentUser.setState(state);
		this.studentUser.setTelphone(telphone);
		this.studentUser.setTime(time);
		this.studentUser.setIsvisible(true);
		this.studentUser.setLogo(logo);
		this.baseService.save(this.studentUser);		
		return "list";
	}
	public String register(){
		this.studentUser=new StudentUser();
		this.list=this.baseService.getByHal("from studentuser");
		for(int i=0;i<list.size();i++){
			if(((StudentUser)list.get(i)).getUsername().equals(username)){
				this.message="该用户名已经被注册，请更改用户名";
				return "error";
			}
		}
		this.studentUser.setUsername(username);
		this.studentUser.setPassword(password);
		return "index";
	}
	public String delete(){
		this.studentUser=(StudentUser) this.baseService.get(StudentUser.class, id);
		this.baseService.delete(this.studentUser);
		return "list";
	}
	public String introduce(){
		this.studentUser=(StudentUser) this.baseService.get(StudentUser.class, id);
		return "success";
	}
	public String add(){
		this.studentUser=new StudentUser();
		this.studentUser.setAge(age);
		StudentCategory category=(StudentCategory) this.baseService.get(StudentCategory.class, categoryId);
		this.studentUser.setCategory(category);
		this.studentUser.setLesson(lesson);
		this.studentUser.setMoney(money);
		this.studentUser.setName(name);
		this.studentUser.setSchool(school);
		this.studentUser.setSex(sex);
		this.studentUser.setState(state);
		this.studentUser.setTelphone(telphone);
		this.studentUser.setTime(time);
		this.studentUser.setIsvisible(true);
		this.studentUser.setLogo(logo);
		this.studentUser.setNewcome(true);
		this.studentUser.setDate(new Date());
		this.studentUser.setUsername(username);
		this.studentUser.setPassword(password);
		this.baseService.save(this.studentUser);
		return "list";
	}
	public String input(){
		if(id!=0){
			this.studentUser=(StudentUser) this.baseService.get(StudentUser.class, id);
		}
		this.categoryList=this.baseService.getByHal("from studentcategory");
		return "success";
	}
	public String update(){
		this.studentUser=(StudentUser) this.baseService.get(StudentUser.class, id);
		this.studentUser.setAge(age);
		StudentCategory category=(StudentCategory) this.baseService.get(StudentCategory.class, categoryId);
		this.studentUser.setCategory(category);
		this.studentUser.setLesson(lesson);
		this.studentUser.setMoney(money);
		this.studentUser.setName(name);
		this.studentUser.setSchool(school);
		this.studentUser.setSex(sex);
		this.studentUser.setState(state);
		this.studentUser.setTelphone(telphone);
		this.studentUser.setTime(time);
		this.studentUser.setIsvisible(true);
		this.studentUser.setLogo(logo);
		this.studentUser.setUsername(username);
		this.studentUser.setPassword(password);
		this.baseService.save(this.studentUser);
		return "list";
	}
	public String becomeOld(){
		this.studentUser=(StudentUser) this.baseService.get(StudentUser.class, id);
		this.studentUser.setNewcome(false);
		this.baseService.update(this.studentUser);
		return "list";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public StudentUser getStudentUser() {
		return studentUser;
	}
	public void setStudentUser(StudentUser studentUser) {
		this.studentUser = studentUser;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public List<StudentCategory> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<StudentCategory> categoryList) {
		this.categoryList = categoryList;
	}
	public long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}
	public String getLesson() {
		return lesson;
	}
	public void setLesson(String lesson) {
		this.lesson = lesson;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getPassword() {
		return password;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	
}
