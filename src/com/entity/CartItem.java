package com.entity;

public class CartItem {
   private int cartId;   //购物车Id
   private UserInfo userId; //用户id
   private Book bookId; //书id
   private int quantity; //购物车中的某本书的个数

   
   
public int getCartId() {
	return cartId;
}
public void setCartId(int cartId) {
	this.cartId = cartId;
}

public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public UserInfo getUserId() {
	return userId;
}
public void setUserId(UserInfo userId) {
	this.userId = userId;
}
public Book getBookId() {
	return bookId;
}
public void setBookId(Book bookId) {
	this.bookId = bookId;
}


   
   
   
}
