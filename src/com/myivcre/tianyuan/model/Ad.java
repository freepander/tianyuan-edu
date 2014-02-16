package com.myivcre.tianyuan.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * 首页广告
 * @author freepander
 *
 */
@Entity(name="ad")
public class Ad {
	@Id@GeneratedValue
	private int id;
	private String url;
	private String pic;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	

}
