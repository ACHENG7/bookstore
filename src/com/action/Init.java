package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.service.BookServiceImpl;

public class Init extends ActionSupport{
	
	public String init() {
		
	 Map<String ,Object> session = ServletActionContext.getContext().getSession();
	 
	  List bookSpecilList = new ArrayList();
	  BookServiceImpl b1 = new BookServiceImpl();

	  bookSpecilList = b1.bookSpecilList();
	  int bookSpecilList_quantity=bookSpecilList.size();
	
	  session.put("bookSpecilList", bookSpecilList);
	  session.put("bookSpecilList_quantity", bookSpecilList_quantity);
	
	  
	  List bookNewList = new ArrayList();
	  BookServiceImpl b2 = new BookServiceImpl();
	  bookNewList = b2.bookNewList();	  

	  session.put("bookNewList", bookNewList);

	  
	  List bookHotSellList = new ArrayList();
	  BookServiceImpl b3 = new BookServiceImpl();
	  bookHotSellList = b3.bookHotSellList();	  

	  session.put("bookHotSellList", bookHotSellList);
      return SUCCESS;

	}
	  

}
