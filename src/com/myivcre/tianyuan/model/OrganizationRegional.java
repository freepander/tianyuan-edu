package com.myivcre.tianyuan.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
/**
 * 机构区域
 * @author freepander
 *
 */
@Entity(name="organizationregional")
public class OrganizationRegional {
	@Id@GeneratedValue
	private long id;
	private String name;
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
	
	
}
