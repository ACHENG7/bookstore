package com.dao;


import java.util.List;

import javax.transaction.SystemException;
import javax.transaction.Transaction;


import org.hibernate.Session;
import org.hibernate.query.Query;

import com.entity.Book;
import com.interfaces.BookDao;
import com.util.HibernateSessionFactory;
import com.util.Page;


public class BookDaoImpl implements BookDao {
      

	 /**
	  * 查询总book记录条数
	  */
	public long countBookList() {
	  long count;
	  Session session = HibernateSessionFactory.getSession();
	  String hql="select count(*) from Book b";
	  count = (long) session.createQuery(hql).uniqueResult();
	  session.close();
	  return count;
	}
	
	 /**
	  * 查询总特价book记录条数
	  */
	public long countSpecialList() {
	  long count;
	  Session session = HibernateSessionFactory.getSession();
	  String hql="select count(*) from Book b where bookSpecialPrice=1";
	  count = (long) session.createQuery(hql).uniqueResult();
	  session.close();
	  return count;
	}
	
	 /**
	  * 查询畅销book记录条数
	  */
	public long countHotList() {
	  long count;
	  Session session = HibernateSessionFactory.getSession();
	  String hql="select count(*) from Book b";
	  count = (long) session.createQuery(hql).uniqueResult();
	  session.close();
	  return count;
	}
	
	 /**
	  * 查询新book记录条数(距离当前日期30天)year()
	  */
	public long countNewList() {
	
	  long count;
	  Session session = HibernateSessionFactory.getSession();
	  String hql="select count(*) from Book b where current_date()-bookPublicDate<30";
	  //String sql="SELECT count(*) FROM t_book WHERE CURDATE()-bookPublicDate<30";
	   Query query = session.createQuery(hql);
	  count = (long)query.uniqueResult();
	  session.close();
	  return count;
	}
	
	 /**
	  * 查询不同类别的book记录条数
	  */
	@Override
	public long countClassifyList(String classifyId) {
		 long count;
		  Session session = HibernateSessionFactory.getSession();
		  String hql="select count(*) from Book b where classify=?";
		  Query query = session.createQuery(hql);
		  query.setParameter(0, classifyId);
		  count=(long)query.uniqueResult();
		  session.close();
		  return count;
	}
	
	/**
	 * hibernate 实现分页
	 */
    public List<Book> PageSplit(String hql,int firstRow,int maxRow){
	  List<Book> result ;	  
	  Session session = HibernateSessionFactory.getSession();
	  Query query = session.createQuery(hql);
	  query.setFirstResult(firstRow);
	  query.setMaxResults(maxRow);
	  result = query.list();
	  session.close();
	  
	  return result;
  }



	/**
	 * 返回所有图书列表
	 */
		public List<Book> listBooks() {
            
			List<Book> list;
			Session session = HibernateSessionFactory.getSession();
			String hql="from Book b";
			Query query = session.createQuery(hql);
		    list = (List<Book>)query.list();
			session.close();
			return list;
		}
		
		
	 /**
	  * 返回特价图书列表
	  */
		@Override
		public List<Book> bookSpecilList() {
			List list;
			Session session = HibernateSessionFactory.getSession();
		//	String sql="select * from t_book where bookSpecialPrice = :flag";
			String hql="from Book b where bookSpecialPrice =?";
			Query query = session.createQuery(hql);
			query.setParameter(0, 1);
			list = query.list();
		    session.close();
			return list;
		}
		
		
        /**
         * 返回热销图书列表(根据id排序近4条)
         */
		@Override
		public List<Book> bookHotSellList() {
			String sql="SELECT * FROM t_book ORDER BY bookId DESC LIMIT 0,4";
			List<Book>list;
			Session session= HibernateSessionFactory.getSession();
			Query query = session.createSQLQuery(sql).addEntity(Book.class);
			list = query.list();
			return list;
		}
		
		
		/**
		 * 返回新书列表（根据出版日期最近的6条记录）
		 */
		@Override
		public List<Book> bookNewList() {
			//String sql="SELECT * FROM t_book ORDER BY bookPublicDate DESC LIMIT 0,6";
			String sql="SELECT * FROM t_book WHERE CURDATE()-bookPublicDate<30";
			String hql="from Book b where current_date()-bookPublicDate<30";
			List list;
			Session session= HibernateSessionFactory.getSession();

			Query query = session.createQuery(hql);
			list = query.list();
			session.close();
			return list;
		}
        /**
         * 返回分类后的图书
         */

		@Override
		public List<Book> bookClassify(String classifyid) {
			//String sql ="SELECT * FROM t_book WHERE classify = :id";
			String hql="from Book b where classify = ?";
			Session session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			query.setParameter(0, classifyid);			
			List list = query.list();
			session.close();
			return list;
		}

		/**
		 * 根据图书的ID查询
		 */
		public Book search(int id) {
			Book book;
			Session session = HibernateSessionFactory.getSession();
			book = (Book)session.get(Book.class, id);
			session.close();
			return book;
		}
		
		/**
		 * 根据书名和作者模糊查询
		 */
		public List<Book> searchByName(String name) {
			Book book;
			Session session = HibernateSessionFactory.getSession();
			//String sql = "SELECT * FROM t_book WHERE bookName LIKE ? OR bookAuthor LIKE ?";
			String hql="from Book as b where b.bookName like :name  or b.bookAuthor like :author";
			//Query query = session.createSQLQuery(sql).addEntity(Book.class);
			Query query = session.createQuery(hql);
			query.setParameter("name","%"+name+"%");
			query.setParameter("author","%"+name+"%");
			List list = query.list();
			session.close();
			return list;
			
		}
		
		@Override
		public long countSearchByName(String name) {
			 long count;
			  Session session = HibernateSessionFactory.getSession();
			  String hql="select count(*) from Book b where b.bookName like ?  or b.bookAuthor like  ?";
			  Query query = session.createQuery(hql);
			  query.setParameter(0,"%"+name+"%");
			  query.setParameter(1,"%"+name+"%");
			  count=(long)query.uniqueResult();
			  session.close();
			  return count;
		}





		
	/**
	 * 添加图书
	 */
	public boolean add(Book book) throws IllegalStateException, SystemException {
		boolean result=false;
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = (Transaction) session.beginTransaction();
		
		try {
		Book books = new Book();
	    books.setBookName(book.getBookName());
	    books.setBookAuthor(book.getBookAuthor());
	    books.setBookPrice(book.getBookPrice());
	    books.setBookPic(book.getBookPic());
	    books.setBookIntroduction(book.getBookIntroduction());
	    books.setBookPublicDate(book.getBookPublicDate());
	    books.setBookSpecialPrice(book.getBookSpecialPrice());
	     session.save(books);
	     tx.commit();
	     session.close();
	     
	     result=true;
		}catch(Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
      return result;
	}






	
}
