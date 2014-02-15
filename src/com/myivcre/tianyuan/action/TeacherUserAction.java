package com.myivcre.tianyuan.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.TeacherCategory;
import com.myivcre.tianyuan.model.TeacherUser;

@Component("teacherUserAction")
@Scope("prototype")
public class TeacherUserAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	private String address;
	private String birthday;
	private TeacherCategory category;
	private String description;
	private String email;
	private String experience;
	private String home;
	private String lesson;
	private String money;
	private String name;
	private String password;
	private String political;
	private String post;
	private String priority;
	private String qq;
	private String telphone;
	private String time;
	private String username;
	private String zipcode;
	private long categoryId;
	private String recommend;
	private String post2;
	private String logo;
	private String sex;

	private TeacherUser teacherUser;
	private List categoryList;
	public String list(){
		this.list=this.baseService.getByHal("from teacheruser");
		return "success";
	}
	public String introduce(){
		this.teacherUser=(TeacherUser)this.baseService.get(TeacherUser.class, id);
		return "success";
	}
	public String delete(){
		this.teacherUser=(TeacherUser)this.baseService.get(TeacherUser.class, id);
		this.baseService.delete(this.teacherUser);
		return "list";
	}
	public String input(){
		this.teacherUser=(TeacherUser)this.baseService.get(TeacherUser.class, id);
		this.categoryList=this.baseService.getByHal("from teachercategory");
		return "success";
	}
	public String update(){
		this.teacherUser=(TeacherUser)this.baseService.get(TeacherUser.class, id);
		this.teacherUser.setAddress(address);
		TeacherCategory category=(TeacherCategory)this.baseService.get(TeacherCategory.class, categoryId);
		this.teacherUser.setCategory(category);
		this.teacherUser.setEmail(email);
		this.teacherUser.setExperience(experience);
		this.teacherUser.setLesson(lesson);
		this.teacherUser.setMoney(money);
		this.teacherUser.setName(name);
		this.teacherUser.setPolitical(political);
		this.teacherUser.setPost(post);
		this.teacherUser.setPriority(1);
		this.teacherUser.setQq(qq);
		this.teacherUser.setHome(home);
		this.teacherUser.setSex(sex);
		this.teacherUser.setZipcode(zipcode);
		this.teacherUser.setTelphone(telphone);
		this.teacherUser.setTime(time);
		this.teacherUser.setRecommend(recommend);
		this.teacherUser.setPost2(post2);
		this.teacherUser.setAddress(address);
		this.teacherUser.setLogo(logo);
		this.baseService.update(this.teacherUser);
		return "list";
	}
	public String add(){
		this.teacherUser=new TeacherUser();
		this.teacherUser.setAddress(address);
		TeacherCategory category=(TeacherCategory)this.baseService.get(TeacherCategory.class, categoryId);
		this.teacherUser.setCategory(category);
		this.teacherUser.setEmail(email);
		this.teacherUser.setExperience(experience);
		this.teacherUser.setLesson(lesson);
		this.teacherUser.setMoney(money);
		this.teacherUser.setName(name);
		this.teacherUser.setPolitical(political);
		this.teacherUser.setPost(post);
		this.teacherUser.setPriority(1);
		this.teacherUser.setQq(qq);
		this.teacherUser.setHome(home);
		this.teacherUser.setSex(sex);
		this.teacherUser.setZipcode(zipcode);
		this.teacherUser.setTelphone(telphone);
		this.teacherUser.setTime(time);
		this.teacherUser.setRecommend(recommend);
		this.teacherUser.setPost2(post2);
		this.teacherUser.setAddress(address);
		this.teacherUser.setLogo(logo);
		this.baseService.save(this.teacherUser);
		return "list";
	}
	public String setHuiyuan(){
		this.teacherUser=(TeacherUser)this.baseService.get(TeacherUser.class, id);
		this.teacherUser.setIshuiyuan(true);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyMMddHHmmss");
		String huiyuannumber=sdf.format(new Date());
		int a=(int) (Math.random()*10);
		this.teacherUser.setHuiyuannumber(huiyuannumber+String.valueOf(a));
		this.baseService.save(this.teacherUser);
		return "list";
	}
	public String setHuiyuan2(){
		this.teacherUser=(TeacherUser)this.baseService.get(TeacherUser.class, id);
		this.teacherUser.setIshuiyuan(false);
		this.baseService.save(this.teacherUser);
		return "list";
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public TeacherCategory getCategory() {
		return category;
	}
	public void setCategory(TeacherCategory category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPolitical() {
		return political;
	}
	public void setPolitical(String political) {
		this.political = political;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
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
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}
	public TeacherUser getTeacherUser() {
		return teacherUser;
	}
	public void setTeacherUser(TeacherUser teacherUser) {
		this.teacherUser = teacherUser;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public String getPost2() {
		return post2;
	}
	public void setPost2(String post2) {
		this.post2 = post2;
	}
	public List getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List categoryList) {
		this.categoryList = categoryList;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
}
