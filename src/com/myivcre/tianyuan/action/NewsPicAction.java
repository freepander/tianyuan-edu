package com.myivcre.tianyuan.action;

import java.util.Date;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.NewsPicture;

@Component("newspicAction")
@Scope("prototype")
public class NewsPicAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private String title;
	private String content;
	private String pic;
	private NewsPicture newspic;
	public String list(){
		this.list=this.baseService.getByHal("from newspicture order by id desc");
		return "success";
	}
	public String add(){
		this.newspic=new NewsPicture();
		this.newspic.setTitle(title);
		this.newspic.setContent(content);
		this.newspic.setDate(new Date());
		this.newspic.setPic(pic);
		this.baseService.save(this.newspic);
		return "list";
	}
	public String input(){
		if(id!=0){
			this.newspic=(NewsPicture) this.baseService.get(NewsPicture.class, id);
		}
		return "success";
	}
	public String update(){
		this.newspic=(NewsPicture) this.baseService.get(NewsPicture.class, id);
		this.newspic.setContent(content);
		this.newspic.setPic(pic);
		this.newspic.setTitle(title);
		this.baseService.update(this.newspic);
		return "list";
	}
	public String delete(){
		this.newspic=(NewsPicture) this.baseService.get(NewsPicture.class, id);
		this.baseService.delete(this.newspic);
		return "list";
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
	public NewsPicture getNewspic() {
		return newspic;
	}
	public void setNewspic(NewsPicture newspic) {
		this.newspic = newspic;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	
	
}
