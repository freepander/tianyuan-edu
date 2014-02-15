package com.myivcre.tianyuan.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.Book;
import com.myivcre.tianyuan.model.BookCategory;
import com.myivcre.tianyuan.model.OrganizationIndustry;

@Component("bookCategoryAction")
@Scope("prototype")
public class BookCategoryAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private String name;
	private BookCategory bookCategory;
	
	public String add(){
		this.bookCategory=new BookCategory();
		this.bookCategory.setName(name);
		this.baseService.save(this.bookCategory);
		return "list";
	}
	public String list(){
		this.list=this.baseService.getByHal("from bookcategory");
		return "success";
	}
	public String update(){
		this.bookCategory=(BookCategory) this.baseService.get(BookCategory.class, id);
		this.bookCategory.setName(name);
		this.baseService.save(this.bookCategory);
		return "list";
	}
	public String input(){
		this.bookCategory=(BookCategory) this.baseService.get(BookCategory.class, id);
		return "success";
	}
	public String delete(){
		this.bookCategory=(BookCategory) this.baseService.get(BookCategory.class, id);
		List<Book> bookList=this.baseService.getByHal("from book");
		for(int i=0;i<bookList.size();i++){
			if(bookList.get(i).getCategory().getId()==this.bookCategory.getId()){
				this.message="该地类别下有图书,请先将该类别下图书移除后在删除该类别";
				return "list";
			}
		}
		this.baseService.delete(this.bookCategory);
		return "list";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public BookCategory getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(BookCategory bookCategory) {
		this.bookCategory = bookCategory;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
