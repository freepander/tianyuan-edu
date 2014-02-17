package com.myivcre.tianyuan.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 * 教师评论
 * @author freepander
 *
 */
@Entity(name="review")
public class Review {
	@Id@GeneratedValue
	private long id;
	@Column(length=10000)
	private String content;
	private Date date;
	@ManyToOne
	private StudentUser student;
	@ManyToOne
	private TeacherUser teacher;
	public long getId() { 
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public StudentUser getStudent() {
		return student;
	}
	public void setStudent(StudentUser student) {
		this.student = student;
	}
	public TeacherUser getTeacher() {
		return teacher;
	}
	public void setTeacher(TeacherUser teacher) {
		this.teacher = teacher;
	}

	

}
