package com.myivcre.tianyuan.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


/**
 * 学生对老师评分实体
 * 用于记录有那个学生对那个老师进行了评分
 * 放置学生重复评分
 * @author freepander
 *
 */
@Entity(name="tru")
public class TRU {
	@Id@GeneratedValue
	private int id;
	@ManyToOne
	private TeacherUser teacher;
	@ManyToOne
	private StudentUser student;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public TeacherUser getTeacher() {
		return teacher;
	}
	public void setTeacher(TeacherUser teacher) {
		this.teacher = teacher;
	}
	public StudentUser getStudent() {
		return student;
	}
	public void setStudent(StudentUser student) {
		this.student = student;
	}
	

}
