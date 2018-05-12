package com.interfaces;

import java.util.List;

import javax.transaction.SystemException;

import com.entity.Book;

public interface BookDao {
	/**
	 * 查询各种类别的书的总数
	 * @return
	 */
	public long countBookList();
	public long countSpecialList();
	public long countHotList();
	public long countNewList();
	public long countClassifyList(String classifyId);
	public long countSearchByName(String name);
	/**
	 * 根据bookId查询某一条记录
	 * @param id
	 * @return
	 */
	public Book search(int id);
	public List<Book> searchByName(String name);
	/**
	 * 查询各种类别的书的列表(分页查询)
	 * @return
	 */
	public List<Book> listBooks();
	public List<Book> bookSpecilList();
	public List<Book> bookHotSellList();
	public List<Book> bookNewList();
	public List<Book> bookClassify(String classifyId);
	
	public boolean add(Book book) throws IllegalStateException, SystemException ;
}
