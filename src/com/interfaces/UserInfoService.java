package com.interfaces;

import java.util.List;

import com.entity.Book;
import com.entity.UserInfo;

public interface UserInfoService {
	
	public boolean login(String userName,String passWord);
	public boolean register(UserInfo userinfo);
	
	public int searchUserId(String userName);
	
	public List<Book> getCartItem(int userId);
	
	public int getCartQuantity(int userId);
	
	public boolean addCart(int userId,int bookId);
	public boolean deleteCart(int userId,int bookId);

}
