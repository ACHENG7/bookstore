package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.UserInfoDaoImpl;
import com.entity.Book;
import com.entity.UserInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.service.UserInfoServiceImpl;





public class AjaxAction extends ActionSupport{
    private String userName;
	private int bookId;
	
	
	
	UserInfoServiceImpl userservice = new UserInfoServiceImpl();
	Map<String,Object> session =ServletActionContext.getContext().getSession();	

	   public String addCart() throws IOException {
		   
			  UserInfo currentUser=(UserInfo)session.get("user");
			  String feedbackMessage;//用户操作反馈信息
			  
			   //获取response对象
				   HttpServletResponse response = ServletActionContext.getResponse();
				   HttpServletRequest request = ServletActionContext.getRequest();
				   response.setCharacterEncoding("utf-8");
				   
			 //得到输出对象
				   PrintWriter out = response.getWriter();
			  //逻辑处理
			int userId = currentUser.getUserId();
			
			int cartQuantity= userservice.getCartQuantity(userId);
			List<Book> cartList = userservice.getCartItem(userId);			  			
			request.setAttribute("cartQuantity", cartQuantity);
			request.setAttribute("cartList", cartList);
			//session.put("cartQuantity", cartQuantity);
			//session.put("cartList", cartList);
								
	        boolean temp= userservice.addCart(userId,bookId);
			  			   
		     if(temp) {
			    feedbackMessage ="亲爱的"+currentUser.getUserName()+"您已添加成功~";					
				out.print(feedbackMessage);
				out.flush();
				out.close();			
			  }
			
		      return null;
		   }
	   
	   public String validateUserName() throws IOException {
		   
		   HttpServletResponse response = ServletActionContext.getResponse();
		   
		   PrintWriter out =  response.getWriter();	   
		   boolean temp = false;
		   
		   temp=new UserInfoDaoImpl().isExistUserInfo(userName);
		   //JSONObject json2 = new JSONObject();
		   String json="";
		   if(temp) {
			   json="{\"exist\":true}";
			   //json2.put("exist", true);
		   }else {
			   json="{\"exist\":false}";
			   //json2.put("exist", false);
		   }
		   out.println(json);
		   out.flush();
		   out.close();
		   
		   return null;
	   }
	   
	   public String summary() throws IOException {
		    HttpServletResponse response  = ServletActionContext.getResponse();
		    PrintWriter out = response.getWriter();
		    
		     float totalPrice=0;
			 float totalTax=0;
			 float totalMoney=0;
			List<Book> cartItem  = (List<Book>) session.get("cartList");
		    Iterator< Book> it = cartItem.iterator();
		    while(it.hasNext()) {
		    	Book book = it.next();
		    	totalPrice+=book.getBookPrice();
		    	totalTax+=5;
		    }
		    totalMoney=totalTax+totalPrice;
		    
		    String json="{\"totalPrice\":"+totalPrice+",\"totalTax\":"+totalTax+",\"totalMoney\":"+totalMoney+"}";
		    out.println(json);
		    out.flush();
		    out.close();
		   return null;
	   }
	   
	   
		public int getBookId() {
			return bookId;
		}

		public void setBookId(int bookId) {
			this.bookId = bookId;
		}


		public String getUserName() {
			return userName;
		}


		public void setUserName(String userName) {
			this.userName = userName;
		}



		public UserInfoServiceImpl getUserservice() {
			return userservice;
		}

		public void setUserservice(UserInfoServiceImpl userservice) {
			this.userservice = userservice;
		}

		public Map<String, Object> getSession() {
			return session;
		}

		public void setSession(Map<String, Object> session) {
			this.session = session;
		}


}
