package com.interfaces;

import java.util.List;

import com.entity.Book;
import com.entity.CartItem;
import com.entity.UserInfo;

public interface UserInfoDao {
	
	/**==============================用户个人信息操作==================================
	 * 添加用户信息
	 * @param user
	 * @return
	 */
	
	public boolean addUserInfo(UserInfo user);
	/**
	 * 查询用户是否存在
	 * @param userInfo
	 * @return
	 */
	
	public boolean isExistUserInfo(String userName);	
	public boolean searchUserInfo(String userName,String passWord);
	
	/**
	 * 查找用户id
	 * @param userName
	 * @return
	 */
	public int searchUserId(String userName);
	
	/**
	 * 获取购物车列表的总数
	 * @return
	 */
	
	
	
	/**====================用户对购物车的操作========================================
	 * 获取购物车列表
	 * @param userId
	 * @return
	 */
	public List<Book> getCartItem(int userId); 
	
	public int searchBookQuantity(int userId,int bookId);

	/**
	 * 获取购物车总记录数
	 * @param userId
	 * @return
	 */
	public long getCartQuantity(int userId);
	
	/**
	 * 查询购物车内是够存在该图书
	 * @param userId
	 * @param bookId
	 * @return
	 */
	public int isExistCart(int userId,int bookId);
	/**
	 * 更新购物车
	 * @param userId
	 * @param bookId
	 * @return
	 */
	public boolean updateCart(int userId,int bookId,int quantity);
	/**
	 * 添加购物车
	 * @param bookId
	 */
	public boolean addCart(int userId,int bookId);
	/**
	 * 删除购物车
	 * @param bookId
	 */
	public boolean deleteCart(int userId,int bookId);

}
