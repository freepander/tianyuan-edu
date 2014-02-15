package com.myivcre.tianyuan.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.Organization;
import com.myivcre.tianyuan.model.OrganizationRegional;

@Component("organizationRegionalAction")
@Scope("prototype")
public class OrganizationRegionalAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private String name;
	private OrganizationRegional organizationRegional;
	
	public String add(){
		this.organizationRegional=new OrganizationRegional();
		this.organizationRegional.setName(name);
		this.baseService.save(this.organizationRegional);
		return "list";
	}
	public String list(){
		this.list=this.baseService.getByHal("from organizationregional");
		return "success";
	}
	public String update(){
		this.organizationRegional=(OrganizationRegional) this.baseService.get(OrganizationRegional.class, id);
		this.organizationRegional.setName(name);
		this.baseService.save(this.organizationRegional);
		return "list";
	}
	public String input(){
		this.organizationRegional=(OrganizationRegional) this.baseService.get(OrganizationRegional.class, id);
		return "success";
	}
	public String delete(){
		this.organizationRegional=(OrganizationRegional) this.baseService.get(OrganizationRegional.class, id);
		List<Organization> organizationList=this.baseService.getByHal("from organization");
		for(int i=0;i<organizationList.size();i++){
			if(organizationList.get(i).getRegional().getId()==this.organizationRegional.getId()){
				this.message="该区域下存在机构，请先将该机构下机构移除在删除该机构";
				return "list";
			}
		}
		this.baseService.delete(this.organizationRegional);
		return "list";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public OrganizationRegional getOrganizationRegional() {
		return organizationRegional;
	}
	public void setOrganizationRegional(OrganizationRegional organizationRegional) {
		this.organizationRegional = organizationRegional;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
