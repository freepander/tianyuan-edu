package com.myivcre.tianyuan.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("searchAction")
@Scope("prototype")
public class SearchAction extends BaseAction {
	private String searchContent;
	private List studentList;
	private List teacherList2;
	public String student(){
		String hql="from studentuser where name like '%"+searchContent+"%'";
		System.out.println(hql);
		this.studentList=this.baseService.getByHal(hql);
		String hql2="from studentuser where lesson like '%"+searchContent+"%'";
		String hql3="from studentuser where time like '%"+searchContent+"%'";
		this.studentList.addAll(this.baseService.getByHal(hql2));
		this.studentList.addAll(this.baseService.getByHal(hql3));
		return "studentUserList";
	}
	public String organization(){
		String hql="from organization where name like '%"+searchContent+"%'";
		this.list=this.baseService.getByHal(hql);
		System.out.println(hql);
		return "organizationList";
	}
	public String teacher(){
		String hql="from teacheruser where name like '%"+searchContent+"%'";
		this.teacherList2=this.baseService.getByHal(hql);
		System.out.println(hql);
		return "teacherList";
	}
	public String book(){
		String hql="from book where name like '%"+searchContent+"%'";
		this.list=this.baseService.getByHal(hql);
		System.out.println(hql);
		return "bookList";
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	public List getStudentList() {
		return studentList;
	}
	public void setStudentList(List studentList) {
		this.studentList = studentList;
	}
	public List getTeacherList2() {
		return teacherList2;
	}
	public void setTeacherList2(List teacherList2) {
		this.teacherList2 = teacherList2;
	}
	

}
