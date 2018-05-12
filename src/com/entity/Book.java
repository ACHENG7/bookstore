package com.entity;

import java.sql.Blob;
import java.util.Date;

public class Book {
	  private int bookId;//图书以及图片名	
	   private String bookName;  //书名
	   private float bookPrice;     //图书价格
	   private int bookSpecialPrice;//是否特价
	   private Date bookPublicDate;    //发布日期
	   private String bookAuthor;      //作者
	   private String bookIntroduction;//简介
	   private Blob bookPic;       //图书图片
	   private String classify;   //图书分类
	   
	   
	   




	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public float getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(float bookPrice) {
		this.bookPrice = bookPrice;
	}


	public int getBookSpecialPrice() {
		return bookSpecialPrice;
	}
	public void setBookSpecialPrice(int bookSpecialPrice) {
		this.bookSpecialPrice = bookSpecialPrice;
	}
	public Date getBookPublicDate() {
		return bookPublicDate;
	}
	public void setBookPublicDate(Date bookPublicDate) {
		this.bookPublicDate = bookPublicDate;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public String getBookIntroduction() {
		return bookIntroduction;
	}
	public void setBookIntroduction(String bookIntroduction) {
		this.bookIntroduction = bookIntroduction;
	}
	public Blob getBookPic() {
		return bookPic;
	}
	public void setBookPic(Blob bookPic) {
		this.bookPic = bookPic;
	}
	   
	   

}
