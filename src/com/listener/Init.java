package com.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.action.BookAction;
import com.entity.Book;
import com.service.BookServiceImpl;
import com.util.Page;



public class Init implements ServletContextListener{

	

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		ServletContext application=event.getServletContext();
		/**
		 * 在服务开启时就开始从数据库中获取booklist
		 */
	    
		  
		  
		  
	}

}
