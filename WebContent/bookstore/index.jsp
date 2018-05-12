
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>我的网上书店</title>
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
		<a href="summary" ><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ ${cartQuantity} ] 购物车 </span> </a> 
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
			<center><h3>欢迎登录</h3></center>
		  </div>
		  <div class="modal-body">
		    <center>
			<form class="form-horizontal loginFrm" action="login" method="post">
			  <div class="control-group">								
				<input type="text" id="userName" placeholder="用户名" name="userName">
			  </div>
			  <div class="control-group">
				<input type="password" id="passWord" placeholder="密码" name="passWord">
			  </div>
			  <div class="control-group">
				
				<a href="register.jsp" >注册</a>
			  </div>				
			<button type="submit" class="btn btn-success" >登录</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			</form>	
			</center>
		  </div>
	</div>
	<!-- 登录结束 -->
	</s:if>
	
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
<div id="carouselBlk">
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
		  <div class="item active">
		  <div class="container">
			<a href="register.html"><img style="width:100%" src="themes/images/carousel/1.jpg" alt="special offers"/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		  <div class="item">
		  <div class="container">
			<a href="register.html"><img style="width:100%" src="themes/images/carousel/2.jpg" alt=""/></a>
				<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
	
		 
		 
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
	  </div> 
</div>
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
   
	<div id="sidebar" class="span3">
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
<!-- ====================================热销======================================================== -->
     <div class="span9">
         <div class="well well-small">
			<h4>热门图书 <small class="pull-right">200+ 畅销图书</small></h4>
			<div class="row-fluid">
			<div id="featured" class="carousel slide">
			<div class="carousel-inner">		
			  <div class="item active">			     
			  <ul class="thumbnails">		    
			   <s:iterator  value="#session.bookHotSellList">
				<li class="span3">
				  <div class="thumbnail">
				  <i class="tag2"></i>
					<a href="detail?bookId=<s:property value="bookId" />"><img src="themes/images/products/<s:property value="bookId"/>.jpg" alt=""></a>
					<div class="caption">
					  <h5> <s:property value="bookName"/> </h5>
					  <h4><a class="btn" href="detail?bookId=<s:property value="bookId" />">详 情</a> <span class="pull-right">￥<s:property value="bookPrice"/> </span></h4>
					</div>
				  </div>
				</li>
				</s:iterator>				
			  </ul>
			  </div>
			  
			 <div class="item">
			  <ul class="thumbnails">				  	    
			     <s:iterator  value="#session.bookHotSellList">
				<li class="span3">
				  <div class="thumbnail">
				  <i class="tag2"></i>
					<a href="detail?bookId=<s:property value="bookId" />"><img src="themes/images/products/<s:property value="bookId"/>.jpg" alt=""></a>
					<div class="caption">
					  <h5> <s:property value="bookName"/> </h5>
					  <h4><a class="btn" href="detail?bookId=<s:property value="bookId" />">详 情</a> <span class="pull-right"><s:property value="bookPrice"/> </span></h4>
					</div>
				  </div>
				</li>
				</s:iterator>				
			  </ul>			  
		     </div>
			  			  
		   </div>
			  <a class="left carousel-control" href="#featured" data-slide="prev">‹</a>
			  <a class="right carousel-control" href="#featured" data-slide="next">›</a>
		   </div>
		   </div>
		</div>		
	 </div>
  
	<!-- ====================================热销end======================================================== -->
	<!-- =================================新书上架============================================= -->
		<div class="span12">					
		<h4>新书上架 </h4>
		  <ul class="thumbnails">	  
			  <s:iterator value="#session.bookNewList">
				<li class="span3">
				  <div class="thumbnail">
				   <i class="tag"></i>
					<a  href="detail?bookId=<s:property value="bookId" />"><img src="themes/images/products/<s:property value="bookId"/>.jpg" alt=""/></a>
					<div class="caption">
					  <h5><s:property value="bookName"/></h5>
					  <p> 
						简介
					  </p>
					 
					  <h4 style="text-align:center"><a class="btn" href="detail?bookId=<s:property value="bookId" />"> <i class="icon-zoom-in"></i></a> 
					  <a class="btn" onclick="addCart(<s:property value="bookId" />)"> 加  入 <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#"><s:property value="bookPrice"/> </a></h4>
					</div>
				  </div>
				</li>
			</s:iterator>
				
			  </ul>	

		</div>
<!-- =================================新书上架end============================================= -->
		</div>
	</div>
</div>

<script type="text/javascript">

   /*
   ======================================================================
   */
  function addCart(bookId){
	  var xmlHttpReq;
	  if(window.XMLHttpRequest){
		  xmlHttpReq = new XMLHttpRequest();
		  if(xmlHttpReq.overrideMimeType){
			  xmlHttpReq.overrideMimeType("text/xml");
		  }
	  }else if(window.ActiveXObject){
		   try{
			   xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
		   }catch(e){
			   xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
			   
		   }
	  }
	  if(!xmlHttpReq){
		  window.alter("该浏览器不支持XMLHttpRequest!");
		  return ;
	  }
	  
	  xmlHttpReq.open("post","addCart");//设置提交参数
	  
	  xmlHttpReq.onreadystatechange = function(){
		  
		  if(xmlHttpReq.readyState == 4){
			 
				if(xmlHttpReq.status == 200){
					//
					//返回正常
					var res = xmlHttpReq.responseText;
					
					if(res.length>0){
						
						alert(res);
					}
				}else{
					window.alert("页面请求异常");
				}
			}
		  
	  };//指示响应函数
	  
	  xmlHttpReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	
	  xmlHttpReq.send("bookId="+bookId); //提交
	  
  
  }

</script>
<!-- Footer ================================================================== -->
	<div  id="footerSection">
	<div class="container">
		<div class="row">
			<div class="span3">
				<h5>账  户</h5>
				<a href="login.jsp">您 的 帐 户</a>
				<a href="login.html">个 人 信 息</a> 
				<a href="login.jsp">地  址</a> 
				<a href="login.jsp">折  扣</a>  
				<a href="login.jsp">历  史</a>			
			 </div>
			<div class="span3">
				<h5>信  息</h5>
				<a href="contact.html">接触</a>  
				<a href="register.html">注册</a>  
				<a href="legal_notice.html">法律公告</a>  
				<a href="tac.html">条 款</a> 
				<a href="faq.html">FAQ</a>
			 </div>
			<div class="span3">
				<h5>我 们 的 图 书</h5>
				<a href="#">新产品</a> 
				<a href="#">畅销</a>  
				<a href="special_offer.html">特价</a>  
				<a href="#">厂家</a> 
				<a href="#">供应商</a> 
			 </div>
			<div id="socialMedia" class="span3 pull-right">
				<h5>社交媒体</h5>
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