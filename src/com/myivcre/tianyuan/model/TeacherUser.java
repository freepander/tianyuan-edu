package com.myivcre.tianyuan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 * 教师用户
 * @author freepander
 *
 */
@Entity(name="teacheruser")
public class TeacherUser {
	@Id@GeneratedValue
	private long id;
	//姓名
	private String name;
	//学历
	private String post;
	//专业
	private String post2;
	//电话
	private String telphone;
	//qq
	private String qq;
	//描述 and 备注
	@Column(length=1024000)
	private String description;
	//优先级
	private long priority;
	//所属类别
	@ManyToOne
	private TeacherCategory category;
	//用户名
	private String username;
	private String password;
	//居住地
	private String home;
	//家庭住址
	private String address;
	//出生日期
	private String birthday;
	//学校
	private String political;
	//邮箱
	private String email;
	//邮编
	private String zipcode;
	//工作经历
	private String experience;
	//授课科目
	private String lesson;
	//课时费用
	private String money;
	//时间安排
	private String time;
	//头像
	private String logo;
	//备注
	private String recommend;
	//是否是会员
	private boolean ishuiyuan;
	//本周点击量
	private int dianji;
	//会员编号
	private String huiyuannumber;
	//性别
	private String sex;
	//评分
	private double soucre;
	//评分人数
	private int soucreNumber;
	//是否是新会员
	private boolean newHuiYuan;
	//剩余会员天数
	private int huiYuanDay;
	//2014.04.17 隐藏属性，只提供后台查看
	private String hiddenString;
	public double getSoucre() {
		return soucre;
	}
	public void setSoucre(double soucre) {
		this.soucre = soucre;
	}
	public int getSoucreNumber() {
		return soucreNumber;
	}
	public void setSoucreNumber(int soucreNumber) {
		this.soucreNumber = soucreNumber;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public long getPriority() {
		return priority;
	}
	public void setPriority(long priority) {
		this.priority = priority;
	}
	public TeacherCategory getCategory() {
		return category;
	}
	public void setCategory(TeacherCategory category) {
		this.category = category;
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
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
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
	public String getPolitical() {
		return political;
	}
	public void setPolitical(String political) {
		this.political = political;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
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
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
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
	public boolean isIshuiyuan() {
		return ishuiyuan;
	}
	public void setIshuiyuan(boolean ishuiyuan) {
		this.ishuiyuan = ishuiyuan;
	}
	public int getDianji() {
		return dianji;
	}
	public void setDianji(int dianji) {
		this.dianji = dianji;
	}
	public String getHuiyuannumber() {
		return huiyuannumber;
	}
	public void setHuiyuannumber(String huiyuannumber) {
		this.huiyuannumber = huiyuannumber;
	}
	public boolean isNewHuiYuan() {
		return newHuiYuan;
	}
	public void setNewHuiYuan(boolean newHuiYuan) {
		this.newHuiYuan = newHuiYuan;
	}
	public int getHuiYuanDay() {
		return huiYuanDay;
	}
	public void setHuiYuanDay(int huiYuanDay) {
		this.huiYuanDay = huiYuanDay;
	}
	public String getHiddenString() {
		return hiddenString;
	}
	public void setHiddenString(String hiddenString) {
		this.hiddenString = hiddenString;
	}
	
	
	

}
