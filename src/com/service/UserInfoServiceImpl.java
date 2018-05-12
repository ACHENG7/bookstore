package com.service;

import java.util.List;
import java.util.Map;

import com.dao.UserInfoDaoImpl;
import com.entity.Book;
import com.entity.CartItem;
import com.entity.UserInfo;
import com.interfaces.UserInfoService;
import com.opensymphony.xwork2.ActionContext;

public class UserInfoServiceImpl implements UserInfoService {

	
	 UserInfoDaoImpl userdao = new UserInfoDaoImpl();
	 
	@Override
	public boolean login(String userName, String passWord) {	
		
		 boolean temp=userdao.searchUserInfo(userName,passWord);

		return temp;
	}

	@Override
	public boolean register(UserInfo userinfo) {
		boolean temp = userdao.addUserInfo(userinfo);
		return temp;
	}

	@Override
	public List<Book> getCartItem(int userId) {
		List<Book> cartlist;
		cartlist=userdao.getCartItem(userId);
		return cartlist;
	}

	@Override
	public int getCartQuantity(int userId) {
		int count; 
		count =(int) userdao.getCartQuantity(userId);
		return count;
	}
	
	/**
	 * 添加购物车分两类：先查看购物车内是否存在该商品
	 * 如果存在，更新商品数量
	 * 如果不存在，添加商品
	 */
	@Override
	public boolean addCart(int userId, int bookId) {
		
		boolean temp=false;
		int quantity= userdao.isExistCart(userId, bookId);
		
		if(quantity== 0) {
			temp= userdao.addCart(userId, bookId);
			return temp;
		}else {
			
			quantity++;
			temp=userdao.updateCart(userId, bookId, quantity);
			return temp;
		}
			
	}

	@Override
	public boolean deleteCart(int userId, int bookId) {
		boolean temp=false;
		temp = userdao.deleteCart(userId, bookId);
		return temp;
	}

	@Override
	public int searchUserId(String userName) {
		int userId = userdao.searchUserId(userName);
		return userId;
	}

}
