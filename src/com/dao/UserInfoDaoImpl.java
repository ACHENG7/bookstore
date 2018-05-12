package com.dao;


import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.Book;
import com.entity.CartItem;
import com.entity.UserInfo;
import com.interfaces.UserInfoDao;
import com.util.HibernateSessionFactory;


public class UserInfoDaoImpl implements UserInfoDao {
	
	
	//添加新用户
	
	@Override
	public boolean addUserInfo(UserInfo user) {
		boolean result =false;
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = null;
		try {
			tx=session.beginTransaction();
			session.save(user);
			tx.commit();
			result = true;
		}catch (Exception e) {
			tx.rollback();
		}
		return result;
	}

	

	
	//根据用户名和密码查询，如果找到返回1，否则返回0
	public boolean searchUserInfo(String userName,String passWord) {		
		boolean result=false;		
		Session session = HibernateSessionFactory.getSession();
		String hql="from UserInfo u where u.userName=? and u.passWord=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, userName);
		query.setParameter(1, passWord);
		List list = query.list();
		Iterator it = list.iterator();
		if(it.hasNext()) {
			UserInfo user  = (UserInfo)it.next();
			result = true;
		}
		session.close();
		return result;
	}

	@Override
	public int searchUserId(String userName) {
		Session session = HibernateSessionFactory.getSession();
		String hql="select userId from UserInfo u where userName=?";
		Query query = session.createQuery(hql);
		
		query.setParameter(0, userName);
		int id = (int) query.uniqueResult();
		
		session.close();
		return id;
	}

	@Override
	public long getCartQuantity(int userId) {
		Session session = HibernateSessionFactory.getSession();
		String hql="select count(*) from CartItem where userId=?";			
		Query  query  = session.createQuery(hql);	
		
		//在cartitem表中的userid是userinfo的主键，类型也是UserInfo
		UserInfo user=new UserInfo();
		user.setUserId(userId);
		
		query.setParameter(0,user);
		long count = (long) query.uniqueResult();
		return count;
	}
	
	@Override
	public List<Book> getCartItem(int userId) {
		Session session = HibernateSessionFactory.getSession();
		String hql=" select bookId from CartItem c where userId = ?";
		List cartlist;
		
		Query query = session.createQuery(hql);
		query.setParameter(0, userId);
		cartlist = query.list();
		session.close();
		return cartlist;
	}
	

	@Override
	public boolean addCart(int userId,int bookId) {
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = null;
		boolean temp=false;
		try {
			tx = session.beginTransaction();
			Book book = new Book();
			book.setBookId(bookId);
			
			UserInfo user = new UserInfo();
			user.setUserId(userId);
			
			CartItem cartitem = new CartItem();
			cartitem.setBookId(book);
			cartitem.setUserId(user);
			cartitem.setQuantity(1);
			
			session.save(cartitem);
			tx.commit();
			temp=true;
		}catch (Exception e) {
			
			tx.rollback();
		}finally {
			session.close();
		}
		
		return temp;
	}

	@Override
	public boolean deleteCart(int userId,int bookId) {
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = null;
		boolean temp = false;
		try {
			tx = session.beginTransaction();
			Book book = new Book();
			book.setBookId(bookId);
			
			UserInfo user = new UserInfo();
			user.setUserId(userId);
			
			CartItem cartitem = new CartItem();
			cartitem.setBookId(book);
			cartitem.setUserId(user);			
			
			session.delete(cartitem);
			tx.commit();
			temp=true;
		}catch (Exception e) {
			tx.rollback();
		}finally {
			session.close();
		}
		
		return temp;
	}




	@Override
	public boolean isExistUserInfo(String userName) {
		Session session = HibernateSessionFactory.getSession();
		String hql="from UserInfo u where userName=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, userName);
	    if(query.uniqueResult()==null) {
	    	 return false;
	    }else {
	    	 return true;
	    }
	    	    
	}



   /**
    * 如果购物车存在返回一个CartItem对象的quantity
    * 如果不存在返回0
    */
	@Override
	public int  isExistCart(int userId, int bookId) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from CartItem c where userId=? and bookId=?";	
		Query query = session.createQuery(hql);
		
		UserInfo user = new UserInfo();
		user.setUserId(userId);
			
		Book book = new Book();
		book.setBookId(bookId);
			
		query.setParameter(0,user);
		query.setParameter(1, book);
		
		System.out.println(query.list().isEmpty());
		boolean temp=query.list().isEmpty();
		if(temp) {
			return 0;
		}else {
			CartItem c = (CartItem)query.uniqueResult();
			//System.out.println("size=========="+c.getQuantity());
			
			return c.getQuantity();
		}	
	   
	}




	@Override
	public boolean updateCart(int userId, int bookId,int quantity) {
		Session session = HibernateSessionFactory.getSession();	
		String hql="update CartItem c set c.quantity=? where c.userId = ? and c.bookId =?";
		Query query = session.createQuery(hql);
		
		boolean temp=false;
		UserInfo user = new UserInfo();
		user.setUserId(userId);
			
		Book book = new Book();
		book.setBookId(bookId);
				
		query.setParameter(0,quantity);	
		query.setParameter(1,user);
		query.setParameter(2, book);
   	Transaction tx = null;
		try {
			tx = session.beginTransaction();
			query.executeUpdate();
			tx.commit();
			temp=true;
		}catch (Exception e) {
			tx.rollback();			
		}finally {
			session.close();
		}
		
    	return temp;
	}




	@Override
	public int searchBookQuantity(int userId, int bookId) {
		Session session = HibernateSessionFactory.getSession();
		String hql="select quantity from CartItem c where userId = ? and bookId =?";
	    Query query = session.createQuery(hql);
	        
	    UserInfo user = new UserInfo();
		user.setUserId(userId);
			
		Book book = new Book();
		book.setBookId(bookId);
					
		query.setParameter(0,user);
		query.setParameter(1, book);
		
		int quantity = (int)query.uniqueResult();
	    session.close();
	    
		return quantity;
	}

	

}
