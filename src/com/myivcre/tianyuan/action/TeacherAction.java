package com.myivcre.tianyuan.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.Teacher;
import com.myivcre.tianyuan.model.TeacherCategory;

@Component("teacherAction")
@Scope("prototype")
public class TeacherAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private String name;
	private String logo;
	private long categoryId;
	private int priority;
	private String url;
	private Teacher teacher;
	private String lesson;
	private String post;
	private List<TeacherCategory> categoryList;
	public String list(){
		this.list=this.baseService.getByHal("from teacher");
		return "success";
	}
	public String update(){
		this.teacher=(Teacher) this.baseService.get(Teacher.class, id);
		this.teacher.setLogo(logo);
		this.teacher.setName(name);
		this.teacher.setPriority(priority);
		this.teacher.setUrl(url);
		this.teacher.setPost(post);
		this.teacher.setLesson(lesson);
		TeacherCategory category =(TeacherCategory) this.baseService.get(TeacherCategory.class, categoryId);
		this.teacher.setCategory(category);
		this.baseService.update(this.teacher);
		return "list";
	}
	public String add(){
		this.teacher=new Teacher();
		this.teacher.setLogo(logo);
		this.teacher.setName(name);
		this.teacher.setPriority(priority);
		this.teacher.setUrl(url);
		this.teacher.setPost(post);
		this.teacher.setLesson(lesson);
		TeacherCategory category =(TeacherCategory) this.baseService.get(TeacherCategory.class, categoryId);
		this.teacher.setCategory(category);
		this.baseService.save(this.teacher);
		return "list";
	}
	public String delete(){
		this.teacher=(Teacher) this.baseService.get(Teacher.class, id);
		this.baseService.delete(this.teacher);
		return "list";
	}
	public String input(){
		this.categoryList=this.baseService.getByHal("from teachercategory");
		if(id!=0){
			this.teacher=(Teacher) this.baseService.get(Teacher.class, id);
		}
		return "success";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	public long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
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
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getLesson() {
		return lesson;
	}
	public void setLesson(String lesson) {
		this.lesson = lesson;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public List<TeacherCategory> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<TeacherCategory> categoryList) {
		this.categoryList = categoryList;
	}
	

}
