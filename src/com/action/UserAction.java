package com.action;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;


import com.entity.Book;
import com.entity.UserInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import com.service.UserInfoServiceImpl;

public class UserAction extends ActionSupport {
   private String userName;//用户名
   private String passWord;//用户密码
   private int bookId;//书的id
    private float totalPrice;
	private float totalTax;
	private float totalMoney;
  
   
   UserInfoServiceImpl userservice = new UserInfoServiceImpl();
   HttpServletRequest request = ServletActionContext.getRequest();
   Map<String,Object> session = ActionContext.getContext().getSession();
   
   

   
   public String lookCartList() {
	   
	  UserInfo user = (UserInfo) session.get("user");
	  int userId = user.getUserId();
	  List<Book> cartList =userservice.getCartItem(userId);
	  request.setAttribute("cartList", cartList);
	  return SUCCESS;
	  
   }
   
   /**
    * 注册页面，注册成功直接登录
    * @return
    */
   public String register() {
	   UserInfo user = new UserInfo();
	   user.setUserName(userName);
	   user.setPassWord(passWord);
	   
	   boolean temp = userservice.register(user);
	      if(temp=true) {
	       int userId = userservice.searchUserId(user.getUserName());
	           user.setUserId(userId);
	           
	           session.put("user", user);
	    	   return SUCCESS;
	      }else {
	    	  return INPUT;
	      }
			   
   }
   
   /**
    * 用户注销登录
    * @return
    */
   public String logout(){
      session.remove("user");
      
     return SUCCESS;
   }
   
   
   /**
    * 用户登录
    * 成功登录后获取cartQuantity 和cartItem 列表
    * @return
    */
   public String login() {
   
	   boolean flog = userservice.login(userName,passWord);
	   
	   if(flog==true) {
		      int userId = userservice.searchUserId(userName);
		      UserInfo user = new UserInfo();
		      user.setUserId(userId);
		      user.setUserName(userName);
		      
		      int cartQuantity= userservice.getCartQuantity(userId);
			  List<Book> cartList = userservice.getCartItem(userId);
			  
			  session.put("user",user);
			  session.put("cartQuantity", cartQuantity);
			  session.put("cartList", cartList);	
			 
			  	  
		   return SUCCESS;
	   }else {
		   return INPUT;
	   }
   }
   
   public String summary() throws IOException {
	   
         totalPrice=0;
		  totalTax=0;
		  totalMoney=0;
		List<Book> cartItem  = (List<Book>)session.get("cartList");
	    Iterator< Book> it = cartItem.iterator();
	    while(it.hasNext()) {
	    	Book book = it.next();
	    	totalMoney+=book.getBookPrice();
	    	totalTax+=5;
	    }
	    totalPrice=totalTax+totalMoney;
	   	    
	   return SUCCESS;
  }
  
   
   
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getPassWord() {
	return passWord;
}
public void setPassWord(String passWord) {
	this.passWord = passWord;
}

public int getBookId() {
	return bookId;
}

public void setBookId(int bookId) {
	this.bookId = bookId;
}

public float getTotalPrice() {
	return totalPrice;
}

public void setTotalPrice(float totalPrice) {
	this.totalPrice = totalPrice;
}

public float getTotalTax() {
	return totalTax;
}

public void setTotalTax(float totalTax) {
	this.totalTax = totalTax;
}

public float getTotalMoney() {
	return totalMoney;
}

public void setTotalMoney(float totalMoney) {
	this.totalMoney = totalMoney;
}




   
}
