package com.myivcre.tianyuan.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 * 文字新闻
 * @author freepander
 *
 */
@Entity(name="news")
public class News {
	@Id@GeneratedValue
	private long id;
	//新闻标题
	private String title;
	//新闻内容
	@Column(length=1024000)
	private String content;
	//创建时间
	private Date date;
	//标题颜色
	private String color;
	@ManyToOne
	private NewsCategory category;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public NewsCategory getCategory() {
		return category;
	}
	public void setCategory(NewsCategory category) {
		this.category = category;
	}
	

}
