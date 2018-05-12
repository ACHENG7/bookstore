package com.listener;

import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener,HttpSessionAttributeListener{

	 private long addTime;
	@Override
	public void attributeAdded(HttpSessionBindingEvent even) {
		System.out.println("添加属性："+even.getName());
		addTime = System.currentTimeMillis();
		
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent even) {
		System.out.println("移除属性:"+even.getName());
		
		long removeTime = System.currentTimeMillis();
		long t = (removeTime-addTime)/1000;
		System.out.println("数据保存时间:"+t+"秒");
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent even) {
		System.out.println("更改属性:"+even.getName());
		
	}

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("session创建");
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		System.out.println("session销毁");
		
	}

}
