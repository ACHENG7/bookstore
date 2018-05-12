<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s"  uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>盼盼网上书店</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<!--Less styles -->
   <!-- Other Less css file //different less files has different color scheam
	<link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
	-->
	<!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
	<script src="themes/js/less.js" type="text/javascript"></script> -->
	
<!-- Bootstrap style --> 
    <link id="callCss" rel="stylesheet" href="themes/bootshop/bootstrap.min.css" media="screen"/>
    <link href="themes/css/base.css" rel="stylesheet" media="screen"/>
<!-- Bootstrap style responsive -->	 
	<link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet"/>
	<link href="themes/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->	
	<link href="themes/js/google-code-prettify/prettify.css" rel="stylesheet"/>
<!-- fav and touch icons -->
    <link rel="shortcut icon" href="themes/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="themes/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="themes/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="themes/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="themes/images/ico/apple-touch-icon-57-precomposed.png">
	<style type="text/css" id="enject"></style>
  </head>
<body>
<div id="header">
<div class="container">

<s:if test="#session.user!=null">
<div id="welcomeLine" class="row">
	<div class="span6">欢迎~<strong>  ${user.userName}</strong></div>
	
	<div class="span6">
	<div class="pull-right">
	    <a href="product_summary.jsp"><span class="btn btn-mini btn-primary">查看订单</span></a>
		<a href="summary"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ ${cartQuantity} ] 购物车 </span> </a> 
	</div>
	</div>
	
</div>
</s:if>

   
<!-- Navbar ================================================== -->
<div id="logoArea" class="navbar">
<a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
</a>
  <div class="navbar-inner">
    <a class="brand" href="index.html"><img src="themes/images/panpan_logo.png" alt="BookShop"/></a>
		<form class="form-inline navbar-search" method="post" action="searchBook" >
		  <input id="srchFld" class="srchTxt" type="text" name="bookname"/>
		 
		  <button type="submit" id="submitButton" class="btn btn-primary">搜索</button>
       </form>
    <ul id="topMenu" class="nav pull-right">
     <li class=""><a href="index">首  页</a></li>
	 <li class=""><a href="classify_type?type=all">全 部 图 书</a></li>	
	 <li class=""><a href="classify_type?type=speciallist">特 价 图 书</a></li>
	 <li class="">
	 
	 <s:if test="#session.user==null">
	 <!-- 登录开始 -->
	 <a href="#login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">登录</span></a>
	<div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3>欢迎登录</h3>
		  </div>
		  <div class="modal-body">
		  
			<form class="form-horizontal loginFrm" action="login" method="post">
			  <div class="control-group">								
				<input type="text" id="userName" placeholder="用户名" name="userName">
			  </div>
			  <div class="control-group">
				<input type="password" id="passWord" placeholder="密码" name="passWord">
			  </div>
			  <div class="control-group">
				<label class="checkbox">
				<input type="checkbox">记 住 密 码
				</label>
				<a href="register.jsp" >注册</a>
			  </div>				
			<button type="submit" class="btn btn-success" >登录</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			</form>	
		  </div>
	</div>
	</s:if>
	<!-- 登录结束 -->
		<s:if test="#session.user!=null">
	     <a href="#logout" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">注销</span></a>
	      <div id="logout" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<center><h3>注  销  登  录</h3></center>
		  </div>
		  <div class="modal-body">
		  
			<form class="form-horizontal loginFrm" action="logout" method="post">	
			<center><button type="submit" class="btn btn-success" >确定退出</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">再想想</button>
			</center>		 				
			
			</form>	
		  </div>
	</div>
	      
	</s:if>
	
	</li>
    </ul>
  </div>
</div>
</div>
</div>
<!-- Header End====================================================================== -->
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
	<div id="sidebar" class="span2">
		<div class="well well-small"><a id="myCart" href="product_summary.html"><img src="themes/images/ico-cart.png" alt="cart">3 件商品在你的购物车里  <span class="badge badge-warning pull-right">$155.00</span></a></div>
	<ul id="sideManu" class="nav nav-tabs nav-stacked">
			<li class="subMenu open"><a> 程序设计 [230]</a>
				<ul>
				<li><a class="active"   href="classify_classify?classifyid=1"><i class="icon-chevron-right"></i>java</a></li>
			    <li> <a href="classify_classify?classifyid=2"><i class="icon-chevron-right"></i>C/C++</a></li>
				<li><a href="classify_classify?classifyid=3"><i class="icon-chevron-right"></i>C#</a></li>
				<li><a href="classify_classify?classifyid=4"><i class="icon-chevron-right"></i>python</a></li>
				</ul>
			</li>
			<li class="subMenu"><a> 移动开发[840] </a>
			<ul style="display:none">
				<li><a href="classify_classify?classifyid=1"><i class="icon-chevron-right"></i>Android</a></li>
				<li><a href="classify_classify?classifyid=2"><i class="icon-chevron-right"></i>IOS</a></li>																																		
			</ul>
			</li>
			<li class="subMenu"><a> 数据库[840] </a>
			<ul style="display:none">
				<li><a href="classify_classify?classifyid=3"><i class="icon-chevron-right"></i>Oracle</a></li>
				<li><a href="classify_classify?classifyid=4"><i class="icon-chevron-right"></i>SQL server</a></li>	
				<li><a href="classify_classify?classifyid=1"><i class="icon-chevron-right"></i>数据库原理及应用</a></li>																																	
			</ul>
			</li>
			<li><a href="classify_classify?classifyid=2">操作系统/系统开发[18]</a></li>
			<li><a href="classify_classify?classifyid=3">深度学习[14]</a></li>
		</ul>
		<br/>
		 
	</div>
	
	
<!-- Sidebar end=============================================== -->
	<div class="span10">
    <ul class="breadcrumb">
		<li><a href="index.jsp">首 页</a> <span class="divider">/</span></li>
		<li class="active">全 部 图 书</li>
    </ul>
	<h3> 全 部 图 书<small class="pull-right">  共 有 ${countbooklist} 本 书 </small></h3>	
	<hr class="soft"/>
	
	<form class="form-horizontal span6">
		<div class="control-group">
		  <label class="control-label alignL">筛 选 </label>
			<select>
              <option>商品名称 A - Z</option>
              <option>商品名称 Z - A</option>
              <option>按照销售排行</option>

            </select>
		</div>
	  </form>
	  
<div id="myTab" class="pull-right">
 <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a>
 <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
</div>
<br class="clr"/>
<div class="tab-content">
	<div class="tab-pane" id="listView">
	
	 <s:iterator  var="book" value="#request.booklist">
	 <hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="themes/images/products/<s:property  value="#book.bookId" />.jpg" alt=""/>
			</div>
			<div class="span4">
				<h3><s:property value="#book.bookName" /></h3>				
				<hr class="soft"/>
				<h5>作者：<s:property value="#book.bookAuthor" /> </h5>
				<h5>简介：</h5>
				<p>				
				<s:property value="#book.bookIntroduction"/>
				</p>
				<a class="btn btn-small pull-right" href="detail?bookId=<s:property value="bookId" />">查 看 详 情</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
			<form class="form-horizontal qtyFrm">
			<h3> ￥<s:property  value="bookPrice"/> </h3>
			<label class="checkbox">
				<input type="checkbox">  收 藏 图 书 
			</label><br/>
			
			  <a href="detail?bookId=<s:property value="bookId" />" class="btn btn-large btn-primary"> 加 入 <i class=" icon-shopping-cart"></i></a>
			  <a href="detail?bookId=<s:property value="bookId" />" class="btn btn-large"><i class="icon-zoom-in"></i></a>
			
				</form>
			</div>
		</div>
	</s:iterator>	
	</div>

	<div class="tab-pane  active" id="blockView">
		<ul class="thumbnails">
		   <s:iterator  value="#request.booklist">
			<li class="span3">
			  <div class="thumbnail">
				<a href="detail?bookId=<s:property value="bookId" />"><img src="themes/images/products/<s:property value="bookId" />.jpg" alt=""/></a>
				<div class="caption">
				  <h5><s:property value="bookName"/>  </h5>
				  <p> 
					<!--<s:property value="bookIntroduction"/>
					-->
				  </p>
				   <h4 style="text-align:center"><a class="btn" href="detail?bookId=<s:property value="bookId" />"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">加 入 <i class="icon-shopping-cart"></i></a>
				    <a class="btn btn-primary" href="#">￥<s:property value="bookPrice"/></a></h4>
				</div>
			  </div>
			</li>
			</s:iterator>
			
		  </ul>
	<hr class="soft"/>
	</div>
</div>

	<a href="compair.html" class="btn btn-large pull-right"> 收 藏 此 书</a>
	
	<div class="pagination">
			<ul>
	           ${pagesplit}
			</ul>
			</div>
			<br class="clr"/>
</div>
</div>
</div>
</div>
<!-- MainBody End ============================= -->
<!-- Footer ================================================================== -->
	<div  id="footerSection">
	<div class="container">
		<div class="row">
			<div class="span3">
				<h5>ACCOUNT</h5>
				<a href="login.html">YOUR ACCOUNT</a>
				<a href="login.html">PERSONAL INFORMATION</a> 
				<a href="login.html">ADDRESSES</a> 
				<a href="login.html">DISCOUNT</a>  
				<a href="login.html">ORDER HISTORY</a>
			 </div>
			<div class="span3">
				<h5>INFORMATION</h5>
				<a href="contact.html">CONTACT</a>  
				<a href="register.html">REGISTRATION</a>  
				<a href="legal_notice.html">LEGAL NOTICE</a>  
				<a href="tac.html">TERMS AND CONDITIONS</a> 
				<a href="faq.html">FAQ</a>
			 </div>
			<div class="span3">
				<h5>OUR OFFERS</h5>
				<a href="#">NEW PRODUCTS</a> 
				<a href="#">TOP SELLERS</a>  
				<a href="special_offer.html">SPECIAL OFFERS</a>  
				<a href="#">MANUFACTURERS</a> 
				<a href="#">SUPPLIERS</a> 
			 </div>
			<div id="socialMedia" class="span3 pull-right">
				<h5>SOCIAL MEDIA </h5>
				<a href="#"><img width="60" height="60" src="themes/images/facebook.png" title="facebook" alt="facebook"/></a>
				<a href="#"><img width="60" height="60" src="themes/images/twitter.png" title="twitter" alt="twitter"/></a>
				<a href="#"><img width="60" height="60" src="themes/images/youtube.png" title="youtube" alt="youtube"/></a>
			 </div> 
		 </div>
		<p class="pull-right">&copy; Bootshop</p>
	</div><!-- Container End -->
	</div>
<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>
	
	<script src="themes/js/bootshop.js"></script>
    <script src="themes/js/jquery.lightbox-0.5.js"></script>
	
	<!-- Themes switcher section ============================================================================================= -->
<div id="secectionBox">
<link rel="stylesheet" href="themes/switch/themeswitch.css" type="text/css" media="screen" />
<script src="themes/switch/theamswitcher.js" type="text/javascript" charset="utf-8"></script>
	<div id="themeContainer">
	<div id="hideme" class="themeTitle">Style Selector</div>
	<div class="themeName">Oregional Skin</div>
	<div class="images style">
	<a href="themes/css/#" name="bootshop"><img src="themes/switch/images/clr/bootshop.png" alt="bootstrap business templates" class="active"></a>
	<a href="themes/css/#" name="businessltd"><img src="themes/switch/images/clr/businessltd.png" alt="bootstrap business templates" class="active"></a>
	</div>
	<div class="themeName">Bootswatch Skins (11)</div>
	<div class="images style">
		<a href="themes/css/#" name="amelia" title="Amelia"><img src="themes/switch/images/clr/amelia.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="spruce" title="Spruce"><img src="themes/switch/images/clr/spruce.png" alt="bootstrap business templates" ></a>
		<a href="themes/css/#" name="superhero" title="Superhero"><img src="themes/switch/images/clr/superhero.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="cyborg"><img src="themes/switch/images/clr/cyborg.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="cerulean"><img src="themes/switch/images/clr/cerulean.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="journal"><img src="themes/switch/images/clr/journal.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="readable"><img src="themes/switch/images/clr/readable.png" alt="bootstrap business templates"></a>	
		<a href="themes/css/#" name="simplex"><img src="themes/switch/images/clr/simplex.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="slate"><img src="themes/switch/images/clr/slate.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="spacelab"><img src="themes/switch/images/clr/spacelab.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="united"><img src="themes/switch/images/clr/united.png" alt="bootstrap business templates"></a>
		<p style="margin:0;line-height:normal;margin-left:-10px;display:none;"><small>These are just examples and you can build your own color scheme in the backend.</small></p>
	</div>
	<div class="themeName">Background Patterns </div>
	<div class="images patterns">
		<a href="themes/css/#" name="pattern1"><img src="themes/switch/images/pattern/pattern1.png" alt="bootstrap business templates" class="active"></a>
		<a href="themes/css/#" name="pattern2"><img src="themes/switch/images/pattern/pattern2.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern3"><img src="themes/switch/images/pattern/pattern3.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern4"><img src="themes/switch/images/pattern/pattern4.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern5"><img src="themes/switch/images/pattern/pattern5.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern6"><img src="themes/switch/images/pattern/pattern6.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern7"><img src="themes/switch/images/pattern/pattern7.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern8"><img src="themes/switch/images/pattern/pattern8.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern9"><img src="themes/switch/images/pattern/pattern9.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern10"><img src="themes/switch/images/pattern/pattern10.png" alt="bootstrap business templates"></a>
		
		<a href="themes/css/#" name="pattern11"><img src="themes/switch/images/pattern/pattern11.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern12"><img src="themes/switch/images/pattern/pattern12.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern13"><img src="themes/switch/images/pattern/pattern13.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern14"><img src="themes/switch/images/pattern/pattern14.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern15"><img src="themes/switch/images/pattern/pattern15.png" alt="bootstrap business templates"></a>
		
		<a href="themes/css/#" name="pattern16"><img src="themes/switch/images/pattern/pattern16.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern17"><img src="themes/switch/images/pattern/pattern17.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern18"><img src="themes/switch/images/pattern/pattern18.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern19"><img src="themes/switch/images/pattern/pattern19.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern20"><img src="themes/switch/images/pattern/pattern20.png" alt="bootstrap business templates"></a>
		 
	</div>
	</div>
</div>
<span id="themesBtn"></span>
</body>
</html>