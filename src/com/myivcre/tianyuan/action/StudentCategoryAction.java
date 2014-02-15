package com.myivcre.tianyuan.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.StudentCategory;
import com.myivcre.tianyuan.model.StudentUser;

@Component("studentCategoryAction")
@Scope("prototype")
public class StudentCategoryAction extends BaseAction {
	private String name;
	private StudentCategory category;
	
	public String list(){
		this.list=this.baseService.getByHal("from studentcategory");
		return "success";
	}
	public String update(){
		this.category=(StudentCategory) this.baseService.get(StudentCategory.class, id);
		this.category.setName(name);
		return "list";
	}
	public String add(){
		this.category=new StudentCategory();
		this.category.setName(name);
		this.baseService.save(this.category);
		return "list";
	}
	public String delete(){
		List<StudentUser> studentList=this.baseService.getByHal("from studentuser");
		for(int i=0;i<studentList.size();i++){
			if(studentList.get(i).getCategory().getId()==this.id){
				this.message="该类别下有学生，请先将该类别下学生清空后在删除该类别";
				return "list";
			}
		}
		this.category=(StudentCategory) this.baseService.get(StudentCategory.class, id);
		this.baseService.delete(this.category);
		return "list";
	}
	public String input(){
		if(id!=0){
			this.category=(StudentCategory) this.baseService.get(StudentCategory.class, id);
		}
		return "success";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public StudentCategory getCategory() {
		return category;
	}
	public void setCategory(StudentCategory category) {
		this.category = category;
	}
	
}
