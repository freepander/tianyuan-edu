package com.myivcre.tianyuan.action;

import java.util.Date;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.News;
import com.myivcre.tianyuan.model.NewsCategory;

@Component("newsAction")
@Scope("prototype")
public class NewsAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private String title;
	private String content;
	private News news;
	private Date date;
	private String color;
	private NewsCategory category;
	private long categoryId;
	private List<NewsCategory> categoryList;
	public String add(){
		this.news=new News();
		this.news.setTitle(title);
		this.news.setContent(content);
		this.news.setDate(new Date());
		this.category=(NewsCategory)this.baseService.get(NewsCategory.class, categoryId);
		this.news.setCategory(category);
		this.news.setColor(color);
		this.baseService.save(this.news);
		return "list";
	}
	public String list(){
		this.list=this.baseService.getByHal("from news order by id desc");
		return "success";
	}
	public String update(){
		this.news=(News) this.baseService.get(News.class, id);
		this.news.setContent(content);
		this.news.setTitle(title);
		this.category=(NewsCategory)this.baseService.get(NewsCategory.class, categoryId);
		this.news.setCategory(category);
		this.news.setColor(color);
		this.baseService.update(this.news);
		return "list";
	}
	public String delete(){
		this.news=(News) this.baseService.get(News.class, id);
		this.baseService.delete(this.news);
		return "list";
	}
	public String input(){
		if(this.id!=0){
			this.news=(News) this.baseService.get(News.class, id);
		}
		this.categoryList=this.baseService.getByHal("from newscategory");
		return "success";
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public NewsCategory getCategory() {
		return category;
	}
	public void setCategory(NewsCategory category) {
		this.category = category;
	}
	public long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}
	public List<NewsCategory> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<NewsCategory> categoryList) {
		this.categoryList = categoryList;
	}
	
	
	
}
