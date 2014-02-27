package com.myivcre.tianyuan.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.Inscribes;
import com.myivcre.tianyuan.model.InscribesCategoryTwo;

@Component("inscribesAction")
@Scope("prototype")
public class InscribesAction extends BaseAction {
	private String name;
	private String logo;
	private String content;
	private Inscribes inscribes;
	private long categoryId;
	
	
	
	public String list(){
		try {
			orderby.add("id desc");
			this.pageModel = this.baseService.getPageModel("inscribes", pageNum, 20,orderby,q,a);
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.pageModel.setUrl("back/inscribes_list?pageNum=");
		return "success";
	}
	public String input(){
		if(id!=0){
			this.inscribes=(Inscribes) this.baseService.get(Inscribes.class, id);
		}
		this.list=this.baseService.getByHal("from inscribescategorytwo");
		return "success";
	}
	public String update(){
		this.inscribes=(Inscribes) this.baseService.get(Inscribes.class, id);
		InscribesCategoryTwo two=(InscribesCategoryTwo) this.baseService.get(InscribesCategoryTwo.class, categoryId);
		this.inscribes.setName(name);
		this.inscribes.setContent(content);
		this.inscribes.setLogo(logo);
		this.inscribes.setCategory(two);
		this.baseService.update(this.inscribes);
		return "list";
	}
	public String delete(){
		this.inscribes=(Inscribes) this.baseService.get(Inscribes.class, id);
		this.baseService.delete(inscribes);
		return "list";
	}
	public String add(){
		this.inscribes=new Inscribes();
		InscribesCategoryTwo two=(InscribesCategoryTwo) this.baseService.get(InscribesCategoryTwo.class, categoryId);
		this.inscribes.setName(name);
		this.inscribes.setContent(content);
		this.inscribes.setLogo(logo);
		this.inscribes.setCategory(two);
		this.baseService.save(this.inscribes);
		return "list";
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Inscribes getInscribes() {
		return inscribes;
	}
	public void setInscribes(Inscribes inscribes) {
		this.inscribes = inscribes;
	}
	public long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}


}
