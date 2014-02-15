package com.myivcre.tianyuan.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.Ad;

@Component("adAction")
@Scope("prototype")
public class AdAction extends BaseAction {
	private String url;
	private String pic;
	private Ad ad;
	public String list(){
		this.ad=(Ad)this.baseService.get(Ad.class, 1);
		return "success";
	}
	public String update(){
		this.ad=(Ad)this.baseService.get(Ad.class, 1);
		this.ad.setUrl(url);
		this.ad.setPic(pic);
		this.baseService.update(this.ad);
		return "list";
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public Ad getAd() {
		return ad;
	}
	public void setAd(Ad ad) {
		this.ad = ad;
	}

}
