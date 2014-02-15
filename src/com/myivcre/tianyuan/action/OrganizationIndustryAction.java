package com.myivcre.tianyuan.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.Organization;
import com.myivcre.tianyuan.model.OrganizationIndustry;

@Component("organizationIndustryAction")
@Scope("prototype")
public class OrganizationIndustryAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private String name;
	private OrganizationIndustry organizationIndustry;
	
	public String add(){
		this.organizationIndustry=new OrganizationIndustry();
		this.organizationIndustry.setName(name);
		this.baseService.save(this.organizationIndustry);
		return "list";
	}
	public String list(){
		this.list=this.baseService.getByHal("from organizationindustry");
		return "success";
	}
	public String update(){
		this.organizationIndustry=(OrganizationIndustry) this.baseService.get(OrganizationIndustry.class, id);
		this.organizationIndustry.setName(name);
		this.baseService.save(this.organizationIndustry);
		return "list";
	}
	public String input(){
		this.organizationIndustry=(OrganizationIndustry) this.baseService.get(OrganizationIndustry.class, id);
		return "success";
	}
	public String delete(){
		this.organizationIndustry=(OrganizationIndustry) this.baseService.get(OrganizationIndustry.class, id);
		List<Organization> organizationList=this.baseService.getByHal("from organization");
		for(int i=0;i<organizationList.size();i++){
			if(organizationList.get(i).getIndustry().getId()==this.organizationIndustry.getId()){
				this.message="该地行业下有机构,请先讲该行业下机构移除后在删除该机构";
				return "list";
			}
		}
		this.baseService.delete(this.organizationIndustry);
		return "list";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public OrganizationIndustry getOrganizationIndustry() {
		return organizationIndustry;
	}
	public void setOrganizationIndustry(OrganizationIndustry organizationIndustry) {
		this.organizationIndustry = organizationIndustry;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
