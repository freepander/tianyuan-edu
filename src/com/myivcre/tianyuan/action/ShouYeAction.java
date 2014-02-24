package com.myivcre.tianyuan.action;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.Organization;
import com.myivcre.tianyuan.model.OrganizationIndustry;
import com.myivcre.tianyuan.model.OrganizationRegional;
import com.myivcre.tianyuan.model.Review;
import com.myivcre.tianyuan.model.StudentCategory;
import com.myivcre.tianyuan.model.StudentUser;
import com.myivcre.tianyuan.model.TRU;
import com.myivcre.tianyuan.model.TeacherCategory;
import com.myivcre.tianyuan.model.TeacherUser;

@Component("shouyeAction")
@Scope("prototype")
public class ShouYeAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	private String email;
	private StudentUser studentUser;
	private TeacherUser teacherUser;
	private String userid;
	private boolean asex;
	private String lesson;
	private long categoryId;
	private String money;
	private String time;
	private String name;
	private String sex;
	private String address;
	private String age;
	private String mail;
	private String telphone;
	private int state;
	private String school;
	private String post;
	private String political;
	private String experience;
	private String qq;
	private String home;
	private String zipcode;
	private String logo;
	private List listT;
	private Organization organization;
	private List listT2;
	private List listT3;
	private long industryId;
	private long regionalId;
	private String introduce;
	private long organizationId;
	private String recommend;
	private String post2;
	
	private double source;
	private String content;
	/**
	 * 学生登录
	 * @return
	 */
	public String studentLogin(){
		try {
			q.add("username = ?");
			a.add(username);
			q.add("password = ?");
			a.add(password);
			this.pageModel = this.baseService.getPageModel("studentuser", pageNum, 20,orderby,q,a);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		this.list=this.pageModel.getObjects();
		if(list.size()>=1){
			this.studentUser=(StudentUser)list.get(0);
			//把studentUserId 放入cookie中
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addCookie(new Cookie("userId","student"+String.valueOf(this.studentUser.getId())));
			response.addCookie(new Cookie("username",this.studentUser.getUsername()));
			try {
				response.getOutputStream().print("success");
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			HttpServletResponse response=ServletActionContext.getResponse();
			try {
				response.getOutputStream().print("error");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		return null;
	}
	/**
	 * 机构登录
	 * @return
	 */
	public String organizationLogin(){
		try {
			q.add("username = ?");
			a.add(username);
			q.add("password = ?");
			a.add(password);
			this.pageModel = this.baseService.getPageModel("organization", pageNum, 20,orderby,q,a);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		this.list=this.pageModel.getObjects();
		if(list.size()>=1){
			this.organization=(Organization)list.get(0);
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addCookie(new Cookie("userId","organization"+String.valueOf(this.organization.getId())));
			response.addCookie(new Cookie("username",this.organization.getUsername()));
			try {
				response.getOutputStream().print("success");
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			HttpServletResponse response=ServletActionContext.getResponse();
			try {
				response.getOutputStream().print("error");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		return null;
	}
	/**
	 * 学生注册
	 * @return
	 */
	public String studentRegister(){
		this.list=this.baseService.getByHal("from studentuser");
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		for(int i=0;i<list.size();i++){
			if(null!=((StudentUser)list.get(i)).getUsername()&&((StudentUser)list.get(i)).getUsername().equals(username)){
				try {
					response.getOutputStream().write("error".getBytes());
					return null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		this.studentUser=new StudentUser();
		this.studentUser.setUsername(username);
		this.studentUser.setPassword(password);
		this.studentUser.setEmail(email);
		this.studentUser.setLogo("studentuserlogo.png");
		this.studentUser.setNewcome(true);
		this.studentUser.setDate(new Date());
		this.baseService.save(this.studentUser);
		try {
			q.add("username = ?");
			a.add(username);
			q.add("password = ?");
			a.add(password);
			this.pageModel = this.baseService.getPageModel("studentuser", pageNum, 20,orderby,q,a);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		this.list=this.pageModel.getObjects();
		this.studentUser=(StudentUser)list.get(0);
		response.addCookie(new Cookie("userId","student"+String.valueOf(this.studentUser.getId())));
		response.addCookie(new Cookie("username", this.studentUser.getUsername()));
		try {
			response.getOutputStream().write(String.valueOf(this.studentUser.getId()).getBytes());
			return null;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String studentRegister2() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		this.list=this.baseService.getByHal("from studentuser where email='"+this.email+"' or username='"+this.username+"'");
		if(this.list.size()>0){
			try {
				response.getOutputStream().write("error1".getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}else{
			this.studentUser=new StudentUser();
			this.studentUser.setUsername(username);
			this.studentUser.setPassword(password);
			this.studentUser.setEmail(email);
			StudentCategory category=(StudentCategory)this.baseService.get(StudentCategory.class, categoryId);
			this.studentUser.setCategory(category);
			this.studentUser.setMoney(money);
			this.studentUser.setTime(time);
			this.studentUser.setName(name);
			this.studentUser.setSex(sex);
			this.studentUser.setAge(age);
			this.studentUser.setTelphone(telphone);
			this.studentUser.setLogo("studentuserlogo.png");
			this.studentUser.setSchool(school);
			this.studentUser.setNewcome(true);
			this.studentUser.setDate(new Date());
			this.studentUser.setState(state);
			this.studentUser.setLesson(lesson);
			this.studentUser.setRecommend(recommend);
			this.baseService.save(this.studentUser);
			response.getOutputStream().write("success".getBytes());
			try {
				q.add("username = ?");
				a.add(username);
				q.add("password = ?");
				a.add(password);
				this.pageModel = this.baseService.getPageModel("studentuser", pageNum, 20,orderby,q,a);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			this.list=this.pageModel.getObjects();
			this.studentUser=(StudentUser)list.get(0);
			response.addCookie(new Cookie("userId","student"+String.valueOf(this.studentUser.getId())));
			response.addCookie(new Cookie("username", this.studentUser.getUsername()));
		}
		
		return null;
	}
	/**
	 * 老师登录
	 * @return
	 */
	public String teacherLogin(){
		this.list=this.baseService.getByHal("from teacheruser t where t.username = '"+username+"' and t.password = '"+password+"'");
		if(list.size()>0){
			this.teacherUser=(TeacherUser)this.list.get(0);
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addCookie(new Cookie("userId","teacher"+String.valueOf(this.teacherUser.getId())));
			response.addCookie(new Cookie("username", this.teacherUser.getUsername()));
			try {
				response.getOutputStream().print("success");
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			HttpServletResponse response=ServletActionContext.getResponse();
			try {
				response.getOutputStream().print("error");
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	/**
	 * 老师注册
	 * @return
	 */
	public String teacherRegister(){
		this.list=this.baseService.getByHal("from teacheruser");
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		for(int i=0;i<list.size();i++){
			if(null!=((TeacherUser)list.get(i)).getUsername()&&((TeacherUser)list.get(i)).getUsername().equals(username)){
				try {
					response.getOutputStream().write("error".getBytes());
					return null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		this.teacherUser=new TeacherUser();
		this.teacherUser.setUsername(username);
		this.teacherUser.setPassword(password);
		this.teacherUser.setEmail(email);
		this.teacherUser.setLogo("teacheruserheader.png");
		this.teacherUser.setDianji(0);
		this.teacherUser.setIshuiyuan(false);
		this.teacherUser.setSoucre(4);
		this.teacherUser.setNewHuiYuan(true);
		this.teacherUser.setSoucreNumber(1);
		this.baseService.save(this.teacherUser);
		this.list=this.baseService.getByHal("from teacheruser t where t.username = '"+username+"' and t.password = '"+password+"'");
		this.teacherUser=(TeacherUser)this.list.get(0);
		response.addCookie(new Cookie("userId","teacher"+String.valueOf(this.teacherUser.getId())));
		response.addCookie(new Cookie("username", this.teacherUser.getUsername()));
		try {
			response.getOutputStream().write(String.valueOf(this.teacherUser.getId()).getBytes());
			return null;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String teacherRegister2() throws IOException{
		this.list=this.baseService.getByHal("from teacheruser");
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		for(int i=0;i<list.size();i++){
			if(null!=((TeacherUser)list.get(i)).getUsername()&&((TeacherUser)list.get(i)).getUsername().equals(username)){
				try {
					response.getOutputStream().write("error".getBytes());
					return null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		this.teacherUser=new TeacherUser();
		this.teacherUser.setUsername(username);
		this.teacherUser.setPassword(password);
		this.teacherUser.setEmail(email);
		this.teacherUser.setLogo("teacheruserheader.png");
		this.teacherUser.setDianji(0);
		this.teacherUser.setIshuiyuan(false);
		this.teacherUser.setSoucre(4);
		this.teacherUser.setNewHuiYuan(true);
		this.teacherUser.setSoucreNumber(1);
		TeacherCategory category = (TeacherCategory)this.baseService.get(TeacherCategory.class, categoryId);
		this.teacherUser.setCategory(category);
		this.teacherUser.setMoney(money);
		this.teacherUser.setLesson(lesson);
		this.teacherUser.setTime(time);
		this.teacherUser.setName(name);
		this.teacherUser.setSex(sex);
		this.teacherUser.setTelphone(telphone);
		this.teacherUser.setPost(post);
		this.teacherUser.setPolitical(political);
		this.teacherUser.setPost2(post2);
		this.teacherUser.setRecommend(recommend);
		this.baseService.save(this.teacherUser);
		this.list=this.baseService.getByHal("from teacheruser t where t.username = '"+username+"' and t.password = '"+password+"'");
		this.teacherUser=(TeacherUser)this.list.get(0);
		response.addCookie(new Cookie("userId","teacher"+String.valueOf(this.teacherUser.getId())));
		response.addCookie(new Cookie("username", this.teacherUser.getUsername()));
		try {
			response.getOutputStream().write(String.valueOf(this.teacherUser.getId()).getBytes());
			return null;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 获得用户信息
	 * @return
	 */
	public String getUserMessage(){
		if(userid.startsWith("student")){
			String i=userid.substring(7);
			id=Long.valueOf(i);
			studentUser=(StudentUser) this.baseService.get(StudentUser.class, id);
			this.list=this.baseService.getByHal("from studentcategory");
			if("女".equals(studentUser.getSex())){
				this.asex=false;
			}else {
				this.asex=true;
			}
			return "studentMessage";
		}else if(userid.startsWith("teacher")){
			String i=userid.substring(7);
			id=Long.valueOf(i);
			teacherUser=(TeacherUser) this.baseService.get(TeacherUser.class, id);
			if("女".equals(teacherUser.getSex())){
				this.asex=false;
			}else {
				this.asex=true;
			}
			this.list=this.baseService.getByHal("from teachercategory");
			return "teacherMessage";
		}
		return null;
	}
	/**
	 * 展示用户信息
	 * @return
	 */
	public String showUserMessage(){
		if(userid.startsWith("student")){
			String i=userid.substring(7);
			id=Long.valueOf(i);
			studentUser=(StudentUser) this.baseService.get(StudentUser.class, id);
			this.list=this.baseService.getByHal("from studentcategory");
			if("女".equals(studentUser.getSex())){
				this.asex=false;
			}else {
				this.asex=true;
			}
			//找到机构
			try {
				if(this.studentUser.getCategory()!=null){
					q.add("industry.name like ?");
					a.add(this.studentUser.getCategory().getName());
				}
				this.orderby.add("priority desc ");
				this.pageModel = this.baseService.getPageModel("organization", pageNum, 3,orderby,q,a);
			} catch (Exception e) {
				e.printStackTrace(); 
			}
			this.listT=this.pageModel.getObjects();
			//找到老师用户
			try {
				if(this.studentUser.getCategory()!=null){
					q=new ArrayList<String>();
					a=new ArrayList<Object>();
					q.add("category.name like ?");
					a.add(this.studentUser.getCategory().getName());
					q.add("ishuiyuan=?");
					a.add(true);
				}
				this.pageModel = this.baseService.getPageModel("teacheruser", pageNum, 6,orderby,q,a);
			} catch (Exception e) {
				e.printStackTrace(); 
			}
			this.listT2=this.pageModel.getObjects();
			//找到老师
			try {
				if(this.studentUser.getCategory()!=null){
					q=new ArrayList<String>();
					a=new ArrayList<Object>();
					q.add("category.name like ?");
					a.add(this.studentUser.getCategory().getName());
				}
				this.pageModel = this.baseService.getPageModel("teacher", pageNum, 6,orderby,q,a);
			} catch (Exception e) {
				e.printStackTrace(); 
			}
			this.listT3=this.pageModel.getObjects();
			Calendar rightNow = Calendar.getInstance();
	        String[] data = rightNow.getTime().toString().split(" ");
	        if(Integer.parseInt(data[2].toString()) % 2 == 0){
	        	//奇数
        		for(int ii=0;ii<listT2.size();ii++){
					if(ii%2==0){
						this.listT2.remove(ii);
					}
				}
				for(int ii=0;ii<listT3.size();ii++){
					if(ii%2==0){
						this.listT3.remove(ii);
					}
				}
	        }else{
	        	//哦数
	        	for(int ii=0;ii<listT2.size();ii++){
					if(ii%2==1){
						this.listT2.remove(ii);
					}
				}
				for(int ii=0;ii<listT3.size();ii++){
					if(ii%2==1){
						this.listT3.remove(ii);
					}
				}
	        }
			return "gerenxinxiStudent";
		}else if(userid.startsWith("teacher")){
			String i=userid.substring(7);
			id=Long.valueOf(i);
			teacherUser=(TeacherUser) this.baseService.get(TeacherUser.class, id);
			if("女".equals(teacherUser.getSex())){
				this.asex=false;
			}else {
				this.asex=true;
			}
			this.list=this.baseService.getByHal("from teachercategory");
			return "gerenxinxiTeacher";
		}else if(userid.startsWith("organization")){
			String i=userid.substring(12);
			id=Long.valueOf(i);
			organization=(Organization) this.baseService.get(Organization.class, id);
			this.listT=this.baseService.getByHal("from organizationindustry");
			this.listT2=this.baseService.getByHal("from organizationregional");
			return "gerenxinxiOrganization";
		}
		return null;
	}
	/**
	 * 更新学生用户信息
	 * @return
	 */
	public String updateStudentMessage(){
		studentUser=(StudentUser) this.baseService.get(StudentUser.class, id);
		this.studentUser.setAge(age);
		StudentCategory category=(StudentCategory)this.baseService.get(StudentCategory.class,categoryId);
		this.studentUser.setCategory(category);
		this.studentUser.setEmail(email);
		this.studentUser.setIsvisible(true);
		this.studentUser.setLesson(lesson);
		this.studentUser.setMoney(money);
		this.studentUser.setName(name);
		this.studentUser.setSchool(school);
		this.studentUser.setSex(sex);
		this.studentUser.setState(state);
		this.studentUser.setTelphone(telphone);
		this.studentUser.setTime(time);
		
		this.studentUser.setRecommend(recommend);
		this.baseService.update(this.studentUser);
		HttpServletResponse response=ServletActionContext.getResponse();
		try {
			response.getOutputStream().print("success");
			response.getOutputStream().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 更新老师信息
	 * @return
	 */
	public String updateTeacherMessage(){
		this.teacherUser=(TeacherUser)this.baseService.get(TeacherUser.class, id);
		this.teacherUser.setAddress(address);
		TeacherCategory category=(TeacherCategory)this.baseService.get(TeacherCategory.class, categoryId);
		this.teacherUser.setCategory(category);
		this.teacherUser.setEmail(email);
		this.teacherUser.setExperience(experience);
		this.teacherUser.setLesson(lesson);
		this.teacherUser.setMoney(money);
		this.teacherUser.setName(name);
		this.teacherUser.setPolitical(political);
		this.teacherUser.setPost(post);
		this.teacherUser.setPriority(1);
		this.teacherUser.setQq(qq);
		this.teacherUser.setHome(home);
		this.teacherUser.setSex(sex);
		this.teacherUser.setZipcode(zipcode);
		this.teacherUser.setTelphone(telphone);
		this.teacherUser.setTime(time);
		this.teacherUser.setRecommend(recommend);
		this.teacherUser.setPost2(post2);
		this.baseService.update(this.teacherUser);
		HttpServletResponse response=ServletActionContext.getResponse();
		try {
			response.getOutputStream().print("success");
			response.getOutputStream().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 更新机构信息
	 * @return
	 */
	public String updateOrganizationMessage(){
		this.organization=(Organization)this.baseService.get(Organization.class, id);
		OrganizationIndustry industry=(OrganizationIndustry) this.baseService.get(OrganizationIndustry.class, industryId);
		OrganizationRegional regional=(OrganizationRegional)this.baseService.get(OrganizationRegional.class, regionalId);
		this.organization.setRegional(regional);
		this.organization.setIndustry(industry);
		this.organization.setName(name);
		this.organization.setPassword(password);
		this.organization.setIntroduce(introduce);
		this.baseService.update(this.organization);
		HttpServletResponse response=ServletActionContext.getResponse();
		try {
			response.getOutputStream().print("success");
			response.getOutputStream().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 增加机构访问量
	 * @return
	 */
	public String organizationLookAdd(){
		this.organization=(Organization)this.baseService.get(Organization.class, id);
		this.organization.setLook(this.organization.getLook()+1);
		this.baseService.update(this.organization);
		return null;
	}
	/**
	 * 增加老师点击量
	 * @return
	 */
	public String teacherLookAdd(){
		this.teacherUser=(TeacherUser)this.baseService.get(TeacherUser.class,id);
		this.teacherUser.setDianji(this.teacherUser.getDianji()+1);
		this.baseService.update(this.teacherUser);
		return null;
	}
	/**
	 * 学生个人页面
	 * @return
	 */
	public String gerenstudent(){
		this.studentUser=(StudentUser)this.baseService.get(StudentUser.class, id);
		this.list=this.baseService.getByHal("from studentuser where category.id="+studentUser.getCategory().getId()+" and state>99 and id!="+studentUser.getId());
		return "gerenstudent";
	}
	/**
	 * 老师个人页面
	 * @return
	 */
	public String gerenteacher(){
		this.teacherUser=(TeacherUser)this.baseService.get(TeacherUser.class, id);
		this.list=this.baseService.getByHal("from teacheruser where category.id="+this.teacherUser.getCategory().getId()+" and ishuiyuan=true and id!="+this.teacherUser.getId());
		//System.out.println("from teacheruser where category.id="+this.teacherUser.getId()+" and ishuiyuan=true and id!="+this.teacherUser.getId());
		return "gerenteacher";
	}
	/**
	 * 获得教师评论列表
	 * @return
	 */
	public String getReviews(){
		this.list=this.baseService.getByHal("from review where teacher.id="+this.id+" order by id desc");
		return "reviewsList";
	}
	/**
	 * 对老师进行评分
	 * @return
	 */
	public String addSource(){
		
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		Cookie[] cookies=request.getCookies();
		for(Cookie cookie:cookies){
			if(cookie.getName().equals("userId")){
				if(cookie.getValue().startsWith("student")){
					//是学生
					String ids=cookie.getValue().substring(7);
					long id2=Long.parseLong(ids);

					this.list=this.baseService.getByHal("from tru where teacher.id="+id+" and student.id="+id2);
					if(list.size()==0){
						//没有评论过
						this.studentUser=(StudentUser)this.baseService.get(StudentUser.class, id2);
						this.teacherUser=(TeacherUser)this.baseService.get(TeacherUser.class, id);
						TRU tru=new TRU();
						tru.setStudent(this.studentUser);
						tru.setTeacher(this.teacherUser);
						this.baseService.save(tru);
						double sum=this.teacherUser.getSoucre()*this.teacherUser.getSoucreNumber();
						this.teacherUser.setSoucreNumber(this.teacherUser.getSoucreNumber()+1);
						Double d=new Double((sum+this.source)/this.teacherUser.getSoucreNumber());
						DecimalFormat df = new DecimalFormat("#.00");
						this.teacherUser.setSoucre(Double.parseDouble(df.format(d)));
						this.baseService.update(this.teacherUser);
						try {
							response.getOutputStream().write("评分成功，赶快写下想对老师说的话吧！".getBytes("utf-8"));
						} catch (IOException e) {
							e.printStackTrace();
						}
						return null;
					}else {
						//已经评论过
						try {
							response.getOutputStream().write("您最近一个月内已经参与了对该老师的评分，无法再次参与评分。".getBytes("utf-8"));
						} catch (IOException e) {
							e.printStackTrace();
						}
						return null;
					}
				}else {
					//不是学生
					try {
						response.getOutputStream().write("您不是学生，不可以对该老师进行评分。".getBytes("utf-8"));
					} catch (IOException e) {
						e.printStackTrace();
					}
					return null;
				}
			}
		}
		try {
			
			response.getOutputStream().write("请登录后在对该老师评分。".getBytes("utf-8"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 对教师进行评价
	 * @return
	 */
	public String addReview(){
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpServletResponse response=ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			Cookie[] cookies=request.getCookies();
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("userId")){
					if(cookie.getValue().startsWith("student")){
						//是学生
						String ids=cookie.getValue().substring(7);
						long id2=Long.parseLong(ids);
						this.studentUser=(StudentUser)this.baseService.get(StudentUser.class, id2);
						this.teacherUser=(TeacherUser)this.baseService.get(TeacherUser.class, id);
						Review review =new Review();
						review.setContent(this.content);
						review.setDate(new Date());
						review.setStudent(this.studentUser);
						review.setTeacher(this.teacherUser);
						this.baseService.save(review);
						try {
							response.getOutputStream().write("评论成功！".getBytes("utf-8"));
						} catch (IOException e) {
							e.printStackTrace();
						}
						return null;
					}else {
						//不是学生
						try {
							response.getOutputStream().write("您不是学生，不可以对该老师进行评价。".getBytes("utf-8"));
						} catch (IOException e) {
							e.printStackTrace();
						}
						return null;
					}
				}
			}
			try {
				response.getOutputStream().write("请登录后在对该老师评分。".getBytes("utf-8"));
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
	
	public String registerInput(){
		this.listT=this.baseService.getByHal("from studentcategory");
		this.listT2=this.baseService.getByHal("from teachercategory");
		
		
		return "success";
	}
	
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public StudentUser getStudentUser() {
		return studentUser;
	}
	public void setStudentUser(StudentUser studentUser) {
		this.studentUser = studentUser;
	}
	public TeacherUser getTeacherUser() {
		return teacherUser;
	}
	public void setTeacherUser(TeacherUser teacherUser) {
		this.teacherUser = teacherUser;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public boolean isAsex() {
		return asex;
	}
	public void setAsex(boolean asex) {
		this.asex = asex;
	}
	public String getLesson() {
		return lesson;
	}
	public void setLesson(String lesson) {
		this.lesson = lesson;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getPolitical() {
		return political;
	}
	public void setPolitical(String political) {
		this.political = political;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public List getListT() {
		return listT;
	}
	public void setListT(List listT) {
		this.listT = listT;
	}
	public Organization getOrganization() {
		return organization;
	}
	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	public List getListT2() {
		return listT2;
	}
	public void setListT2(List listT2) {
		this.listT2 = listT2;
	}
	public long getIndustryId() {
		return industryId;
	}
	public void setIndustryId(long industryId) {
		this.industryId = industryId;
	}
	public long getRegionalId() {
		return regionalId;
	}
	public void setRegionalId(long regionalId) {
		this.regionalId = regionalId;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public long getOrganizationId() {
		return organizationId;
	}
	public void setOrganizationId(long organizationId) {
		this.organizationId = organizationId;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public String getPost2() {
		return post2;
	}
	public void setPost2(String post2) {
		this.post2 = post2;
	}
	public double getSource() {
		return source;
	}
	public void setSource(double source) {
		this.source = source;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List getListT3() {
		return listT3;
	}
	public void setListT3(List listT3) {
		this.listT3 = listT3;
	}

	
}
