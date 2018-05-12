package com.service;

import java.util.ArrayList;
import java.util.List;


import com.dao.BookDaoImpl;
import com.entity.Book;
import com.interfaces.BookService;
import com.util.Page;
import com.util.PageSplitUtil;


public class BookServiceImpl implements BookService{
	
BookDaoImpl bookdao = new BookDaoImpl();



	/**
	 * 用id获取图书
	 */
	@Override
	public Book searchBookById(int id) {
		Book book = bookdao.search(id);
		return book;
	}
	
	
	
	/**
	 * 书名模糊查询书
	 */
		public List<Book> searchBooks(String name) {
			List<Book> booklist = new ArrayList<Book>();
			
			booklist = bookdao.searchByName(name);
			return booklist;
		}
		
		
		@Override
		public List<Book> searchBooks(String name, Page page) {

			String hql = "from Book as b where b.bookName like ";
			hql +="'%"+name+"%'"+" or b.bookAuthor like "; 
			hql +="'%"+name+"%'";
			
			int  firstRow = (page.getNowpage()-1)*page.getPagesize();
			int  maxRow = page.getPagesize();
			
			List<Book> list = bookdao.PageSplit(hql, firstRow, maxRow);
			return list;
		}
	
		
		   

	     /**
	      * 获取所有书并进行分页处理
	      */
		public List<Book> bookList() {
			List<Book> booklist = new ArrayList<Book>();		
			booklist = bookdao.listBooks();
			return booklist;
			
		}

		@Override
		public List<Book> bookList(Page page) {
		
			String hql = "from Book b";	
			int  firstRow = (page.getNowpage()-1)*page.getPagesize();
			int  maxRow = page.getPagesize();
			
			List<Book> list = bookdao.PageSplit(hql, firstRow, maxRow);
			return list;
		}
		
		/**
		 * 获取特价图书列表
		 */
		
		public List<Book> bookSpecilList() {
			List<Book> booklist = new ArrayList<Book>();
						
			booklist = bookdao.bookSpecilList();
			return booklist;
		}
		
		@Override
		public List<Book> bookSpecilList(Page page) {
		
			String hql="from Book b where bookSpecialPrice =1";
			int  firstRow = (page.getNowpage()-1)*page.getPagesize();
			int  maxRow = page.getPagesize();
			
			List<Book> list = bookdao.PageSplit(hql, firstRow, maxRow);
			
			
		   return list;
		}
		
		
		/**
		 * 获取畅销图书
		 */
		@Override
		public List<Book> bookHotSellList() {
            List<Book> booklist = new ArrayList<Book>();
			
			booklist= bookdao.bookHotSellList();
			return booklist;
		}
		
		@Override
		public List<Book> bookHotSellList(Page page) {

			String hql="SELECT * FROM t_book ORDER BY bookId DESC ";
			int  firstRow = (page.getNowpage()-1)*page.getPagesize();
			int  maxRow = page.getPagesize();
			
			List<Book> list = bookdao.PageSplit(hql, firstRow, maxRow);
			
			return list;
		
		}
		
		
		
		/**
		 * 获取新书列表
		 */
		@Override
		public List<Book> bookNewList() {
			List<Book> booklist = new ArrayList<Book>();
			
			booklist= bookdao.bookNewList();
			return booklist;
		}
		
		@Override
		public List<Book> bookNewList(Page page) {
			String hql="from Book b where current_date()-bookPublicDate<30";
			int  firstRow = (page.getNowpage()-1)*page.getPagesize();
			int  maxRow = page.getPagesize();
			
			List<Book> list = bookdao.PageSplit(hql, firstRow, maxRow);
			
			return list;
		}
		
		
		/**
		 * 获取分类后的list
		 */
		
		@Override
		public List<Book> bookClassify(String  classifyid) {
           List<Book> booklist = new ArrayList<Book>();
			
			booklist= bookdao.bookClassify(classifyid);
			
			return booklist;
		}
	
		@Override
		public List<Book> bookClassify(String classifyId,Page page) {
			String hql="from Book b where classify =";
			hql+=classifyId;
           
			int  firstRow = (page.getNowpage()-1)*page.getPagesize();
			int  maxRow = page.getPagesize();
			
			List<Book> list = bookdao.PageSplit(hql, firstRow, maxRow);
			
			return list;
			
		}

		


}
