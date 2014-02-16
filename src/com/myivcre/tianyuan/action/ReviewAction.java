package com.myivcre.tianyuan.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.Review;

@Component("reviewAction")
@Scope("prototype")
public class ReviewAction extends BaseAction {
	private String content;
	private long teacherId;
	private long studentId;
	
	private Review review;
	public String list(){
		try {
			orderby.add("id desc");
			this.pageModel=this.baseService.getPageModel("review", pageNum, 40,orderby,q,a);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.pageModel.setUrl("back/review_list?pageNum=");
		return "success";
	}
	public String delete(){
		this.review=(Review)this.baseService.get(Review.class, id);
		this.baseService.delete(this.review);
		return "list";
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public long getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(long teacherId) {
		this.teacherId = teacherId;
	}
	public long getStudentId() {
		return studentId;
	}
	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}
	
	

}
