package com.myivcre.tianyuan.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
/**
 * 图片新闻
 * @author freepander
 *
 */
@Entity(name="newspicture")
public class NewsPicture {
	@Id@GeneratedValue
	private long id;
	//新闻标题
	private String title;
	//新闻内容
	@Column(length=1024000)
	private String content;
	//发布时间
	private Date date;
	//图片地址
	private String pic;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
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
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	
}
