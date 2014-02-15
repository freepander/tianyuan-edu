package com.myivcre.tianyuan.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.Teacher;
import com.myivcre.tianyuan.model.TeacherCategory;

@Component("teacherCategoryAction")
@Scope("prototype")
public class TeacherCategoryAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private String name;
	private TeacherCategory category;
	public String list(){
		this.list=this.baseService.getByHal("from teachercategory");
		return "success";
	}
	public String input(){
		if(id!=0){
			this.category=(TeacherCategory) this.baseService.get(TeacherCategory.class, id);
		}
		return "success";
	}
	public String add(){
		this.category=new TeacherCategory();
		this.category.setName(name);
		this.baseService.save(this.category);
		return "list";
	}
	public String update(){
		this.category=(TeacherCategory) this.baseService.get(TeacherCategory.class, id);
		this.category.setName(name);
		this.baseService.update(this.category);
		return "list";
	}
	public String delete(){
		this.category=(TeacherCategory) this.baseService.get(TeacherCategory.class, id);
		List<Teacher> teacherList=this.baseService.getByHal("from teacher");
		for(int i=0;i<teacherList.size();i++){
			if(teacherList.get(i).getCategory().getId()==this.category.getId()){
				this.message="该类别下有教师,请先讲该类别下教师移除后在删除该类别";
				return "list";
			}
		}
		this.baseService.delete(this.category);
		return "list";
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
