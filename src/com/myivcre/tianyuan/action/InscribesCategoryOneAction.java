package com.myivcre.tianyuan.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.InscribesCategoryOne;

@Component("inscribesCategoryOneAction")
@Scope("prototype")
public class InscribesCategoryOneAction extends BaseAction {
	private String name;
	private InscribesCategoryOne category;
	public String add(){
		this.category=new InscribesCategoryOne();
		this.category.setName(name);
		this.baseService.save(this.category);
		return "list";
	}
	public String list(){
		this.list=this.baseService.getByHal("from inscribescategoryone");
		return "success";
	}
	public String input(){
		if(id!=0){
			this.category=(InscribesCategoryOne)this.baseService.get(InscribesCategoryOne.class, id);
		}
		return "success";
	}
	public String update(){
		this.category=(InscribesCategoryOne)this.baseService.get(InscribesCategoryOne.class, id);
		this.category.setName(name);
		this.baseService.update(this.category);
		return "list";
	}
	public String delete(){
		try{
			this.category=(InscribesCategoryOne)this.baseService.get(InscribesCategoryOne.class, id);
			this.baseService.delete(this.category);
		}catch(Exception e){
			this.message="该类别写有字类别，请先删除字类别在删除该类别。";
		}
		return "list";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public InscribesCategoryOne getCategory() {
		return category;
	}
	public void setCategory(InscribesCategoryOne category) {
		this.category = category;
	}
	
}
