package com.myivcre.tianyuan.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.InscribesCategoryOne;
import com.myivcre.tianyuan.model.InscribesCategoryTwo;

@Component("inscribesCategoryTwoAction")
@Scope("prototype")
public class InscribesCategoryTwoAction extends BaseAction {
	private String name;
	private long categoryId;
	private InscribesCategoryTwo category;
	
	public String add(){
		this.category=new InscribesCategoryTwo();
		InscribesCategoryOne one=(InscribesCategoryOne)this.baseService.get(InscribesCategoryOne.class, categoryId);
		this.category.setCategory(one);
		this.category.setName(name);
		this.baseService.save(this.category);
		return "list";
	}
	public String list(){
		this.list=this.baseService.getByHal("from inscribescategorytwo");
		return "success";
	}
	public String update(){
		this.category=(InscribesCategoryTwo)this.baseService.get(InscribesCategoryTwo.class, id);
		InscribesCategoryOne one=(InscribesCategoryOne)this.baseService.get(InscribesCategoryOne.class, categoryId);
		this.category.setCategory(one);
		this.category.setName(name);
		this.baseService.update(this.category);
		return "list";
	}
	public String delete(){
		try{
		this.category=(InscribesCategoryTwo)this.baseService.get(InscribesCategoryTwo.class, id);
		this.baseService.delete(this.category);
		}catch(Exception e){
			this.message="该类别下有试题，请先删除试题后在删除该类别。";
		}
		return "list";
	}
	public String input(){
		if(id!=0){
			this.category=(InscribesCategoryTwo)this.baseService.get(InscribesCategoryTwo.class, id);
		}
		this.list=this.baseService.getByHal("from inscribescategoryone");
		return "success";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}
	public InscribesCategoryTwo getCategory() {
		return category;
	}
	public void setCategory(InscribesCategoryTwo category) {
		this.category = category;
	}
	
}
