package com.myivcre.tianyuan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 * 试题
 * @author freepander
 *
 */
@Entity(name="inscribes")
public class Inscribes {
	@Id@GeneratedValue
	private long id;
	private String name;
	private String logo;
	@Column(length=10000)
	private String content;
	@ManyToOne
	private InscribesCategoryTwo category;
	//附件地址
	private String doc;
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
	public InscribesCategoryTwo getCategory() {
		return category;
	}
	public void setCategory(InscribesCategoryTwo category) {
		this.category = category;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
	
	
	
}
