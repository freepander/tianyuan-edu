package com.myivcre.tianyuan.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.Activities;

@Component("activitiesAction")
@Scope("prototype")
public class ActivitiesAction extends BaseAction {
	private String date;
	private String time;
	private String address;
	private String name;
	private String logo;
	private String content;
	private Activities activities;
	public String list(){
		try {
			this.pageModel=this.baseService.getPageModel("activities", pageNum, 6, orderby, q,a);
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.pageModel.setUrl("back/activities_list?pageNum");
		return "success";
	}
	public String input(){
		if(id!=0){
			this.activities=(Activities)this.baseService.get(Activities.class, id);
		}
		return "success";
	}
	public String add(){
		this.activities=new Activities();
		this.activities.setAddress(address);
		this.activities.setDate(date);
		this.activities.setName(name);
		this.activities.setTime(time);
		this.activities.setLogo(logo);
		this.activities.setContent(content);
		this.baseService.save(this.activities);
		return "list";
	}
	public String update(){
		this.activities=(Activities)this.baseService.get(Activities.class, id);
		this.activities.setAddress(address);
		this.activities.setDate(date);
		this.activities.setName(name);
		this.activities.setTime(time);
		this.activities.setLogo(logo);
		this.activities.setContent(content);
		this.baseService.update(this.activities);
		return "list";
	}
	public String delete(){
		this.activities=(Activities)this.baseService.get(Activities.class, id);
		return "list";
	}
	public String indexList(){
		try {
			this.pageModel=this.baseService.getPageModel("activities", pageNum, 6, orderby, q,a);
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.pageModel.setUrl("back/activities_list?pageNum");
		return "indexList";
	}
	public String indexGet(){
		this.activities=(Activities)this.baseService.get(Activities.class, id);
		return null;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Activities getActivities() {
		return activities;
	}
	public void setActivities(Activities activities) {
		this.activities = activities;
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
	
	
	
}
