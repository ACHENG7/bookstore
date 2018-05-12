package com.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.apache.struts2.ServletActionContext;

import com.dao.BookDaoImpl;
import com.entity.Book;
import com.opensymphony.xwork2.ActionSupport;
import com.service.BookServiceImpl;
import com.util.Page;
import com.util.PageSplitUtil;

public class BookAction extends ActionSupport {
	private String classifyid;//图书类型id
	private String type;//获取图书的不同列表分类
	private String bookname;//获取搜索匡框内的字符串
	private int bookId;//书的id
	private Integer page;//当前页也就是Page对象的nowpage属性
	
	BookServiceImpl bookservice = new BookServiceImpl();

	/**
      * 根据分类的id不同获取不同的booklist
      * @return
      */
	public String classify() {
		//List<Book> booklist=bookservice.bookClassify(classifyid);
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Book> booklist=null;//分页的列表
		PageSplitUtil pagesplitutil = new PageSplitUtil();
		String pagesplit="";//分页的<li>标签
		int countbooklist=(int)(new BookDaoImpl().countClassifyList(classifyid)) ;
		
		 if(page==null) {
			 page = 1;
		 }
		 Page pageBean=null;
		 		 
		 pageBean=new Page(page, 9, countbooklist);
		 pagesplit=  pagesplitutil.pageSpilt("classify_classify?classify="+classifyid+"&page=", pageBean);
		 booklist=bookservice.bookClassify(classifyid, pageBean);
		
        request.setAttribute("pagesplit", pagesplit);
        request.setAttribute("booklist", booklist);
        request.setAttribute("countbooklist", countbooklist);
		return SUCCESS;
	}
	
	/**
	 * 根据type的类型获取不同的booklist
	 * @return
	 */
	public String type() {	
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Book> booklist=null;//分页的列表
		PageSplitUtil pagesplitutil = new PageSplitUtil();
		String pagesplit="";//分页的<li>标签
		int countbooklist=0;//查找booklist总记录数
		
		 if(page==null) {
			 page = 1;
		 }
		 Page pageBean=null;
		 
		if(type.equals("all")) {
			//booklist=bookservice.bookList();
			
		 
		  countbooklist=(int)(new BookDaoImpl().countBookList());
		  pageBean=new Page(page, 9,countbooklist );
		  booklist=bookservice.bookList(pageBean);
		  pagesplit=  pagesplitutil.pageSpilt("classify_type?type=all&page=", pageBean);	  
			 
			 
		}else if(type.equals("speciallist")) {
			//booklist=bookservice.bookSpecilList();
		     
			
			 countbooklist=(int)(new BookDaoImpl().countSpecialList());
			 pageBean=new Page(page, 9, countbooklist);
			 booklist=bookservice.bookSpecilList(pageBean);
			 pagesplit=  pagesplitutil.pageSpilt("classify_type?type=speciallist&page=", pageBean);	  
		
			
		}else if(type.equals("hostlist")) {
			//booklist=bookservice.bookHotSellList();
			
			
			 countbooklist=(int)(new BookDaoImpl().countHotList());
			 pageBean=new Page(page, 9, countbooklist);
			 booklist=bookservice.bookHotSellList(pageBean);
			 pagesplit=  pagesplitutil.pageSpilt("classify_type?type=hostlist&page=", pageBean);
			 
		}else if(type.equals("newlist")) {
			//booklist = bookservice.bookNewList();
			
			
			 countbooklist=(int)(new BookDaoImpl().countHotList());
			 pageBean=new Page(page, 6,countbooklist);
			 booklist=bookservice.bookNewList(pageBean);
			 pagesplit=  pagesplitutil.pageSpilt("classify_type?type=newlist&page=", pageBean);
		}
		
		//并将列表的总数存在request中
		
		request.setAttribute("pagesplit", pagesplit);
        request.setAttribute("booklist", booklist);
        request.setAttribute("countbooklist", countbooklist);
        
        
       
		
		return SUCCESS;
	}
	
	/**
	 * 模糊查询书列表
	 */
	public String searchBooks() {
		
		//booklist = bookservice.searchBooks(bookname);		
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Book> booklist=null;//分页的列表
		PageSplitUtil pagesplitutil = new PageSplitUtil();
		String pagesplit="";//分页的<li>标签
		int countbooklist=(int)(new BookDaoImpl().countSearchByName(bookname)) ;
		
		 if(page==null) {
			 page = 1;
		 }
		 Page pageBean=null;
		 		 
		 pageBean=new Page(page, 9, countbooklist);
		 pagesplit=  pagesplitutil.pageSpilt("products.jsp?page=", pageBean);
		 booklist=bookservice.searchBooks(bookname, pageBean);
		
        request.setAttribute("pagesplit", pagesplit);
        request.setAttribute("booklist", booklist);
        request.setAttribute("countbooklist", countbooklist);
		return SUCCESS;
       
		
	}
	/**
	 * 通过ID查看图书详情并获取通classifyid的图书列表
	 * @return
	 */
	public String searchBook() {
		Book book=bookservice.searchBookById(bookId);
		
		HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("book", book);
        
        List<Book> booklist = bookservice.bookClassify(book.getClassify());
        request.setAttribute("booklist", booklist);
        return SUCCESS;
	}
	
	



	public String getClassifyid() {
		return classifyid;
	}

	public void setClassifyid(String classifyid) {
		this.classifyid = classifyid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
     public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}



    
	


}
