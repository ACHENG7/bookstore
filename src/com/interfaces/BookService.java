package com.interfaces;

import java.util.List;

import com.entity.Book;
import com.util.Page;

public interface BookService {
    
	/**
	 * 获取各个类型的booklist列表
	 * @return
	 */
	public List<Book> bookList();	
	public List<Book> bookList(Page page);	
	
	public List<Book> bookSpecilList();	
	public List<Book> bookSpecilList(Page page);
	
	public List<Book> bookHotSellList();
	public List<Book> bookHotSellList(Page page);
	
	public List<Book> bookNewList();
	public List<Book> bookNewList(Page page);
	
	public List<Book> bookClassify(String  classifyid);
	public List<Book> bookClassify(String  classifyid,Page page);
	
	/**
	 * 搜索book及列表
	 * @param id
	 * @return
	 */
	public Book searchBookById(int id);
	
	public List<Book> searchBooks(String name);
	public List<Book> searchBooks(String name,Page page);
	
}
