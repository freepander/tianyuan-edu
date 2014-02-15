package com.myivcre.tianyuan.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.Organization;
import com.myivcre.tianyuan.model.OrganizationIndustry;
import com.myivcre.tianyuan.model.OrganizationRegional;

@Component("organizationAction")
@Scope("prototype")
public class OrganizationAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private String name;
	private String logo;
	private String url;
	private String priority;
	private String industryId;
	private String regionalId;
	private String username;
	private String password;
	private String introduce;
	private boolean change;
	private Organization organization;
	private List<OrganizationRegional> regionalList;
	private List<OrganizationIndustry> industryList;
	public String list(){
		try {
			this.orderby.add("priority desc ");
			this.pageModel = this.baseService.getPageModel("organization", pageNum, 20,orderby,q,a);
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.pageModel.setUrl("back/organization_list?pageNum=");
		return "success";
	}
	public String add(){
		this.organization=new Organization();
		this.organization.setUsername(username);
		this.organization.setPassword(password);
		this.organization.setName(name);
		this.organization.setLogo(logo);
		this.organization.setUrl(url);
		this.organization.setLook(0);
		try{
			this.organization.setPriority(Integer.parseInt(priority));
		}catch(Exception e){
			this.organization.setPriority(1);
		}
		System.out.println(this.organization.getPriority());
		OrganizationIndustry industry=(OrganizationIndustry) this.baseService.get(OrganizationIndustry.class, Long.parseLong(industryId));
		OrganizationRegional regional=(OrganizationRegional) this.baseService.get(OrganizationRegional.class, Long.parseLong(regionalId));
		this.organization.setIndustry(industry);
		this.organization.setRegional(regional);
		this.baseService.save(this.organization);
		return "list";
	}
	public String input(){
		if(this.id!=0){
			this.organization=(Organization) this.baseService.get(Organization.class, id);
		}
		this.industryList=this.baseService.getByHal("from organizationindustry");
		this.regionalList=this.baseService.getByHal("from organizationregional");
		return "success";
	}
	public String update(){
		this.organization=(Organization) this.baseService.get(Organization.class, id);
		this.organization.setName(name);
		this.organization.setLogo(logo);
		this.organization.setUrl(url);
		this.organization.setUsername(username);
		this.organization.setPassword(password);
		this.organization.setLook(0);
		try{
			this.organization.setPriority(Integer.parseInt(priority));
		}catch(Exception e){
			this.organization.setPriority(1);
		}
		OrganizationIndustry industry=(OrganizationIndustry) this.baseService.get(OrganizationIndustry.class, Long.parseLong(industryId));
		OrganizationRegional regional=(OrganizationRegional) this.baseService.get(OrganizationRegional.class, Long.parseLong(regionalId));
		this.organization.setIndustry(industry);
		this.organization.setRegional(regional);
		this.baseService.save(this.organization);
		return "list";
	}
	public String delete(){
		this.organization=(Organization) this.baseService.get(Organization.class, id);
		this.baseService.delete(this.organization);
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public Organization getOrganization() {
		return organization;
	}
	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	public List<OrganizationRegional> getRegionalList() {
		return regionalList;
	}
	public void setRegionalList(List<OrganizationRegional> regionalList) {
		this.regionalList = regionalList;
	}
	public List<OrganizationIndustry> getIndustryList() {
		return industryList;
	}
	public void setIndustryList(List<OrganizationIndustry> industryList) {
		this.industryList = industryList;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getIndustryId() {
		return industryId;
	}
	public void setIndustryId(String industryId) {
		this.industryId = industryId;
	}
	public String getRegionalId() {
		return regionalId;
	}
	public void setRegionalId(String regionalId) {
		this.regionalId = regionalId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public boolean isChange() {
		return change;
	}
	public void setChange(boolean change) {
		this.change = change;
	}
	
	
	
}
