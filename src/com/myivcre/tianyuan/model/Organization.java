package com.myivcre.tianyuan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
/**
 * 机构
 * @author freepander
 *
 */
@Entity(name="organization")
public class Organization {
	@Id@GeneratedValue
	private long id;
	private String name;
	//优先级
	private int priority;
	//介绍链接
	private String url;
	//机构logo
	private String logo;
	//机构行业
	@ManyToOne
	private OrganizationIndustry industry;
	//机构区域
	@ManyToOne
	private OrganizationRegional regional;
	//机构介绍
	@Column(length=102400)
	private String introduce;
	private String username;
	private String password;
	private long look;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public OrganizationIndustry getIndustry() {
		return industry;
	}
	public void setIndustry(OrganizationIndustry industry) {
		this.industry = industry;
	}
	public OrganizationRegional getRegional() {
		return regional;
	}
	public void setRegional(OrganizationRegional regional) {
		this.regional = regional;
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
	public long getLook() {
		return look;
	}
	public void setLook(long look) {
		this.look = look;
	}
	
}
