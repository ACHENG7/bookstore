package com.test;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.action.BookAction;
import com.dao.BookDaoImpl;
import com.dao.UserInfoDaoImpl;
import com.entity.Book;
import com.entity.CartItem;
import com.entity.UserInfo;
import com.interfaces.BookService;
import com.service.BookServiceImpl;
import com.service.UserInfoServiceImpl;
import com.sun.glass.ui.Application;

public class test {

	  Configuration cfg;
	  SessionFactory sessionFactory;
	  Session session;
	  Transaction tx;
	  
	@Before
	public void setUp() throws Exception {
		cfg = new Configuration().configure();
		sessionFactory = cfg.buildSessionFactory();
		session = sessionFactory.openSession();
		tx= session.beginTransaction();
		
	}

	@After
	public void tearDown() throws Exception {
		tx.commit();
		session.close();
	}

	@Test
	public void testCount() {
		BookDaoImpl b = new BookDaoImpl();
		List list = b.bookClassify("1");
		Iterator<Book> it = list.iterator();
		while(it.hasNext()) {
			Book book = it.next();
			System.out.println(book.getBookName());
		}
		
		
	long count1 = b.countSearchByName("你");
	System.out.println(count1);
	
	
		
	}
	
	@Test
	public void testbooklist() {
		
		BookServiceImpl b = new BookServiceImpl();
		List list = new ArrayList(); 
		list=b.bookList();
		Iterator<Book> it=list.iterator();
		while(it.hasNext()) {
			Book book = it.next();
			System.out.println(book.getBookName());
		}
	}
	/**
	 * 测试全局变量booklist
	 * @throws ParseException 
	 */
	@Test
	public void testDate() throws ParseException {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(sdf.format(date));
		Date date2 = sdf.parse("1996-09-14");
		//通过system类中的currentTimeMillis方法输出当前时间
		System.out.println(sdf.format(System.currentTimeMillis()));
		System.out.println((date.getTime()-date2.getTime())/(1000*60*60*24));
	}
	
   @Test
   public void testUser() {
	   //UserInfoDaoImpl userdao = new  UserInfoDaoImpl();
     
	   
	   UserInfoServiceImpl user = new UserInfoServiceImpl();	      
	   user.addCart(2,12);
	      
	   //int size=userdao.isExistCart(11, 2);	   
       //System.out.println("size+====="+size);
       
     // boolean temp =userdao.updateCart(3, 2, 5);
     // System.out.println(temp);
       
       //int q = userdao.searchBookQuantity(11, 1);
       //System.out.println("book="+q);
       
      
   
       
      // CartItem caritem2=userdao.isExistCart(11, 2);	   
       //System.out.println(caritem.getQuantity());
      
	   
   }
   
   @Test
   public void restart() {
	   
	   UserInfoDaoImpl userdao = new  UserInfoDaoImpl();
	   UserInfo user = new UserInfo();
	   user.setUserName("刘亚楠");
	   user.setPassWord("123");
	   userdao.addUserInfo(user);
	   
	   
   }
}
