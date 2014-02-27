package com.myivcre.tianyuan.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
/**
 * 试题二级类别
 * @author freepander
 *
 */
@Entity(name="inscribescategorytwo")
public class InscribesCategoryTwo {
	@Id@GeneratedValue
	private long id;
	private String name;
	@ManyToOne
	private InscribesCategoryOne category;
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
	public InscribesCategoryOne getCategory() {
		return category;
	}
	public void setCategory(InscribesCategoryOne category) {
		this.category = category;
	}

}
