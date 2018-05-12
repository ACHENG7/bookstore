package com.entity;

import java.util.Set;

public class Order {
	private int orderId;//订单id，主键
	
	private String zipcode;//邮政编码
	private String address;//订单地址
	private float total;//总金额
	private UserInfo userid;//用户
	
	

	


	public UserInfo getUserid() {
		return userid;
	}
	public void setUserid(UserInfo userid) {
		this.userid = userid;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	
	
	
	
	
	

	

}

