package com.myivcre.tianyuan.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.NewsCategory;

@Component("newscategoryAction")
@Scope("prototype")
public class NewsCategoryAction extends BaseAction {
	private String name;
	private NewsCategory category;
	public String list(){
		this.list=this.baseService.getByHal("from newscategory");
		return "success";
	}
	public String input(){
		this.category=(NewsCategory) this.baseService.get(NewsCategory.class, id);
		return "success";
	}
	public String update(){
		this.category=(NewsCategory) this.baseService.get(NewsCategory.class, id);
		this.category.setName(name);
		this.baseService.save(this.category);
		return "list";
	}
	public String delete(){
		this.category=(NewsCategory) this.baseService.get(NewsCategory.class, id);
		List l=this.baseService.getByHal("from news where category.id="+category.getId()+"");
		if(l.size()>0){
			this.message="该类别下有文章存在，请清空该类别下文章之后在删除该类别";
			return "list";
		}
		this.baseService.delete(this.category);
		return "list";
	}
	public String add(){
		this.category=new NewsCategory();
		this.category.setName(name);
		this.baseService.save(this.category);
		return "list";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public NewsCategory getCategory() {
		return category;
	}
	public void setCategory(NewsCategory category) {
		this.category = category;
	}
	
}
