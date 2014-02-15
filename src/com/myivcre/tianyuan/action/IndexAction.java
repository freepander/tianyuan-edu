package com.myivcre.tianyuan.action;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.myivcre.tianyuan.model.Ad;
import com.myivcre.tianyuan.model.BookCategory;
import com.myivcre.tianyuan.model.Message;
import com.myivcre.tianyuan.model.News;
import com.myivcre.tianyuan.model.NewsPicture;
import com.myivcre.tianyuan.model.OrganizationIndustry;
import com.myivcre.tianyuan.model.OrganizationRegional;
import com.myivcre.tianyuan.model.StudentCategory;
import com.myivcre.tianyuan.model.StudentUser;
import com.myivcre.tianyuan.model.Teacher;
import com.myivcre.tianyuan.model.TeacherCategory;
import com.myivcre.tianyuan.model.TeacherUser;

@Component("indexAction")
@Scope("prototype")
public class IndexAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	//zhu ye 
	private List newsList1;
	private List newspicList;
	private int regionalId;
	private int industryId;
	private List<OrganizationIndustry> industryList;
	private List<OrganizationRegional> regionalList;
	private String name;
	private String telphone;
	private String QQ;
	private String content;
	private Message messages;
	private List newsCategoryList;
	private Ad ad;
	//zhao lao shi 
	private List<TeacherCategory> teacherCategoryList;
	private List<Teacher> teacherList;
	private List<TeacherUser> teacherList2;
	//zhao xue sheng
	private List<StudentCategory> studentCategoryList;
	private List<StudentUser> studentList;
	//shucheng
	private List<BookCategory> bookCateogryList;
	//book
	private long categoryId;
	public String zhuye(){
		this.newsCategoryList=this.baseService.getByHal("from newscategory");
		this.ad=(Ad)this.baseService.get(Ad.class, 1);
		this.newspicList=this.baseService.getByHal("from newspicture");
		return "success";
	}
	public String getNewsByCategoryId(){
		if(id!=0){
			try {
				q.add("category.id=?");
				a.add(id);
				orderby.add("date desc");
				this.pageModel=this.baseService.getPageModel("news", pageNum, 7,orderby,q,a);
				this.pageModel.setUrl("index_getNewsByCategoryId");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			try {
				orderby.add("date desc");
				this.pageModel=this.baseService.getPageModel("news", pageNum, 7,orderby,q,a);
				this.pageModel.setUrl("index_getNewsByCategoryId");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "newsList";
	}
	public String getNewsById(){
		News news=(News) this.baseService.get(News.class, id);
		String json=JSON.toJSONString(news, true);
		try {
			json=new String(json.getBytes("utf-8"),"utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		HttpServletResponse response=ServletActionContext.getResponse();
		try {
			response.setCharacterEncoding("utf-8");
			OutputStream out=response.getOutputStream();
			out.write(json.getBytes("utf-8"));
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String getNewspicById(){
		NewsPicture news=(NewsPicture) this.baseService.get(NewsPicture.class, id);
		String json=JSON.toJSONString(news, true);
		System.out.println(json);
		try {
			json=new String(json.getBytes("utf-8"),"utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		HttpServletResponse response=ServletActionContext.getResponse();
		try {
			response.setCharacterEncoding("utf-8");
			OutputStream out=response.getOutputStream();
			out.write(json.getBytes("utf-8"));
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String organizationList(){
		String hql="";
		if(industryId==0){
			if(regionalId==0){
				hql="from organization";
			}else{
				hql="from organization where regional.id="+regionalId+"";
			}
		}else {
			if(regionalId==0){
				hql="from organization where industry.id="+industryId+"";
			}else{
				hql="from organization where industry.id="+industryId+" and regional.id="+regionalId+"";
			}
		}
		this.list=this.baseService.getByHal(hql);
		return "success";
	}
	public String zhaojigou(){
		this.industryList=this.baseService.getByHal("from organizationindustry");
		this.regionalList=this.baseService.getByHal("from organizationregional");
		try {
			this.orderby.add("priority desc ");
			this.pageModel = this.baseService.getPageModel("organization", pageNum, 20,orderby,q,a);
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.pageModel.setUrl("back/organization_list?pageNum=");
		
		return "success";
	}
	public String teacherMessage(){
		TeacherUser t=(TeacherUser) this.baseService.get(TeacherUser.class, id);
		String json=JSON.toJSONString(t, true);
		try {
			json=new String(json.getBytes("utf-8"),"utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		HttpServletResponse response=ServletActionContext.getResponse();
		try {
			response.setCharacterEncoding("utf-8");
			OutputStream out=response.getOutputStream();
			out.write(json.getBytes("utf-8"));
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String addMessage(){
		this.messages=new Message();
		this.messages.setName(name);
		this.messages.setTelphone(telphone);
		this.messages.setContent(content);
		this.messages.setQQ(QQ);
		this.messages.setVisible(false);
		this.baseService.save(this.messages);
		return "index";
	}
	public String zhaolaoshi(){
		this.teacherCategoryList=this.baseService.getByHal("from teachercategory");
		this.teacherList=this.baseService.getByHal("from teacher");
		this.teacherList2=this.baseService.getByHal("from teacheruser t where t.category!=null");
		return "success";
	}
	public String teacherList(){
		if(id==0){
			this.teacherList=this.baseService.getByHal("from teacher");
			this.teacherList2=this.baseService.getByHal("from teacheruser t where t.category!=null");
			return "success";
		}
		this.teacherList=this.baseService.getByHal("from teacher t where t.category.id= "+id);
		this.teacherList2=this.baseService.getByHal("from teacheruser t where t.category.id="+id);
		return "success";
	}
	public String bookList(){
		if(id==0){
			this.list=this.baseService.getByHal("from book");
		}else {
			this.list=this.baseService.getByHal("from book b where b.category.id="+id);
		}
		return "success";
	}
	public String zhaoxuesheng(){
		this.studentCategoryList=this.baseService.getByHal("from studentcategory");
		this.studentList=this.baseService.getByHal("from studentuser s where s.category!=null order by state desc");
		return "success";
	}
	public String studentUserList(){
		if(id==0){
			this.studentList=this.baseService.getByHal("from studentuser s where s.category!=null order by state desc");
			return "success";
		}
		this.studentList=this.baseService.getByHal("from studentuser s where s.category.id="+id);
		return "success";
	}
	public String studentMessage(){
		StudentUser studentUser=(StudentUser) this.baseService.get(StudentUser.class, id);
		
		studentUser.setTelphone("不公开");
		String json=JSON.toJSONString(studentUser, true);
		try {
			json=new String(json.getBytes("utf-8"),"utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		HttpServletResponse response=ServletActionContext.getResponse();
		try {
			response.setCharacterEncoding("utf-8");
			OutputStream out=response.getOutputStream();
			out.write(json.getBytes("utf-8"));
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String zhaoyouhui(){
		
		return "success";
	}
	public String huodongzhaopian(){
		this.bookCateogryList=this.baseService.getByHal("from bookcategory");
		this.list=this.baseService.getByHal("from book");
		return "success";
	}
	public String zaixianliuyan(){
		return "success";
	}
	public List<NewsPicture> getNewspicList() {
		return newspicList;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getRegionalId() {
		return regionalId;
	}
	public void setRegionalId(int regionalId) {
		this.regionalId = regionalId;
	}
	public int getIndustryId() {
		return industryId;
	}
	public void setIndustryId(int industryId) {
		this.industryId = industryId;
	}
	public List<OrganizationIndustry> getIndustryList() {
		return industryList;
	}
	public void setIndustryList(List<OrganizationIndustry> industryList) {
		this.industryList = industryList;
	}
	public List<OrganizationRegional> getRegionalList() {
		return regionalList;
	}
	public void setRegionalList(List<OrganizationRegional> regionalList) {
		this.regionalList = regionalList;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getQQ() {
		return QQ;
	}
	public void setQQ(String qQ) {
		QQ = qQ;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<TeacherCategory> getTeacherCategoryList() {
		return teacherCategoryList;
	}
	public void setTeacherCategoryList(List<TeacherCategory> teacherCategoryList) {
		this.teacherCategoryList = teacherCategoryList;
	}
	public List<Teacher> getTeacherList() {
		return teacherList;
	}
	public void setTeacherList(List<Teacher> teacherList) {
		this.teacherList = teacherList;
	}
	public Message getMessages() {
		return messages;
	}
	public void setMessages(Message messages) {
		this.messages = messages;
	}
	public List<TeacherUser> getTeacherList2() {
		return teacherList2;
	}
	public void setTeacherList2(List<TeacherUser> teacherList2) {
		this.teacherList2 = teacherList2;
	}
	public List<StudentCategory> getStudentCategoryList() {
		return studentCategoryList;
	}
	public void setStudentCategoryList(List<StudentCategory> studentCategoryList) {
		this.studentCategoryList = studentCategoryList;
	}
	public List<StudentUser> getStudentList() {
		return studentList;
	}
	public void setStudentList(List<StudentUser> studentList) {
		this.studentList = studentList;
	}
	public List<BookCategory> getBookCateogryList() {
		return bookCateogryList;
	}
	public void setBookCateogryList(List<BookCategory> bookCateogryList) {
		this.bookCateogryList = bookCateogryList;
	}
	public List getNewsList1() {
		return newsList1;
	}
	public void setNewsList1(List newsList1) {
		this.newsList1 = newsList1;
	}
	
	public long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}
	public void setNewspicList(List newspicList) {
		this.newspicList = newspicList;
	}
	public List getNewsCategoryList() {
		return newsCategoryList;
	}
	public void setNewsCategoryList(List newsCategoryList) {
		this.newsCategoryList = newsCategoryList;
	}
	public Ad getAd() {
		return ad;
	}
	public void setAd(Ad ad) {
		this.ad = ad;
	}

	
}
