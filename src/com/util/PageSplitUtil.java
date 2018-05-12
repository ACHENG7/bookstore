package com.util;



public class PageSplitUtil {
	/**
	 * 
	 * @param url      路径
	 * @param page     分页的实体类
	 * @return
	 */
 
	public String pageSpilt(String url,Page page) {
		
		
		String str;
	   
		
		int countpage ;
		if(page.getTotalsize()%page.getPagesize()==0) {
			countpage=page.getTotalsize()/page.getPagesize();
		}else {
			countpage = page.getTotalsize()/page.getPagesize()+1;
		}
		
		if(page.getNowpage()<=0) {
			page.setNowpage(1);
		}
		
		if(page.getNowpage()>= countpage) {
			page.setNowpage(countpage);
		}
		
		if(page.getNowpage()>1) {
			 str="	<li><a href=' "+url+(page.getNowpage()-1)+" '>&lsaquo;</a></li>\r\n  ";
		}else {
			 str="	<li><a href='#'>&lsaquo;</a></li>\r\n  ";
		}
	   
	    
	        for(int i = 1; i <= countpage; i ++) {
	          str+= " <li><a href='"+url+i+"'>"+i+"</a></li>\r\n"; 
	        }
	  
		
	    
		if(page.getNowpage()<countpage) {
			 str+="	<li><a href=\""+url+(page.getNowpage()+1)+"\">&rsaquo;</a></li>\r\n  ";
		}else {
			 str+="	<li><a href='#'>&lsaquo;</a></li>\r\n  ";
		}
	   
		
		return str;
	}
	
	
}
