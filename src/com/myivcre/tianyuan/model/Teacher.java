package com.myivcre.tianyuan.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity(name="teacher")
public class Teacher {
	@Id@GeneratedValue
	private long id;
	private String name;
	@ManyToOne
	private TeacherCategory category;
	//优先级
	private int priority;
	//介绍链接
	private String url;
	//人物头像
	private String logo;
	private String post;
	private String lesson;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public TeacherCategory getCategory() {
		return category;
	}
	public void setCategory(TeacherCategory category) {
		this.category = category;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getLesson() {
		return lesson;
	}
	public void setLesson(String lesson) {
		this.lesson = lesson;
	}

}
