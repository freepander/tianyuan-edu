package com.myivcre.tianyuan.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.Book;
import com.myivcre.tianyuan.model.BookCategory;
import com.myivcre.tianyuan.model.Organization;
import com.myivcre.tianyuan.model.OrganizationIndustry;
import com.myivcre.tianyuan.model.OrganizationRegional;

@Component("bookAction")
@Scope("prototype")
public class BookAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private String name;
	private String logo;
	private long categoryId;
	private List<BookCategory> bookCategoryList;
	
	private Book book;
	public String list(){
		try {
			this.pageModel = this.baseService.getPageModel("book", pageNum, 20,orderby,q,a);
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.pageModel.setUrl("back/book_list?pageNum=");
		return "success";
	}
	public String add(){
		this.book=new Book();
		this.book.setName(name);
		this.book.setLogo(logo);
		BookCategory category=(BookCategory) this.baseService.get(BookCategory.class, categoryId);
		this.book.setCategory(category);
		this.baseService.save(this.book);
		return "list";
	}
	public String input(){
		if(this.id!=0){
			this.book=(Book) this.baseService.get(Book.class, id);
		}
		this.bookCategoryList=this.baseService.getByHal("from bookcategory");
		return "success";
	}
	public String update(){
		this.book=(Book) this.baseService.get(Book.class, id);
		this.book.setName(name);
		this.book.setLogo(logo);
		BookCategory category=(BookCategory) this.baseService.get(BookCategory.class, categoryId);
		this.book.setCategory(category);
		this.baseService.save(this.book);
		return "list";
	}
	public String delete(){
		this.book=(Book) this.baseService.get(Book.class, id);
		this.baseService.delete(this.book);
		return "list";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}
	public List<BookCategory> getBookCategoryList() {
		return bookCategoryList;
	}
	public void setBookCategoryList(List<BookCategory> bookCategoryList) {
		this.bookCategoryList = bookCategoryList;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
