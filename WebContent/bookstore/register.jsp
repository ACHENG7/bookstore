<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>盼盼网上书城</title>
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
	<link rel="shortcut icon" href="themes/images/ico/yes.ico">
    <link rel="shortcut icon" href="themes/images/ico/error.ico">
	<style type="text/css" id="enject"></style>
  </head>
<body>
<div id="header">
<div class="container">
<s:if test="user!=null">
<div id="welcomeLine" class="row">
	<div class="span6">欢迎~<strong>  ${user.userName}</strong></div>
	
	<div class="span6">
	<div class="pull-right">
	    <a href="product_summary.jsp"><span class="btn btn-mini btn-primary">查看订单</span></a>
		<a href="product_summary.jsp"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ ${cartQuantity} ] 购物车 </span> </a> 
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
	 
	 <s:if test="user==null">
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
				<input type="text" id="userName" placeholder="用户名" name="user.userName">
			  </div>
			  <div class="control-group">
				<input type="password" id="passWord" placeholder="密码" name="user.passWord">
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
	<!-- 登录结束 -->
	</s:if>
	<s:if test="user!=null">
	      <a href="logout" ><span class="btn btn-large btn-success">注销</span></a>
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
		  <div class="thumbnail">
			<img src="themes/images/products/panasonic.jpg" alt="Bootshop panasonoc New camera"/>
			<div class="caption">
			  <h5>热门推荐</h5>
				<h4 style="text-align:center"><a class="btn" href="product_details.html"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a></h4>
			</div>
		  </div><br/>
			<div class="thumbnail">
				<img src="themes/images/products/kindle.png" title="Bootshop New Kindel" alt="Bootshop Kindel">
				<div class="caption">
				  <h5>Kindle</h5>
				    <h4 style="text-align:center"><a class="btn" href="product_details.html"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a></h4>
				</div>
			  </div><br/>
			<div class="thumbnail">
				<img src="themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
				<div class="caption">
				  <h5>支付 方 式</h5>
				</div>
			  </div>
	</div>
	
	
<!-- Sidebar end=============================================== -->
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.jsp">首 页</a> <span class="divider">/</span></li>
		<li class="active">注 册 页 面</li>
    </ul>
	<h3>创 建 一 个 账 号 </h3>	
	<div class="well">
	<!--
	<div class="alert alert-info fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div>
	<div class="alert fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div>
	 <div class="alert alert-block alert-error fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply</strong> dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div> -->
	 
	<form class="form-horizontal" action="register" method="post" >
		<h4>登 录 账 号</h4>
		<div class="control-group">
			<label class="control-label" for="userName">用户名 <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="input_userName" placeholder="用户名" name="userName" onblur="validateUserName()"><span id="validateUserName"></span>
			</div>
		 </div>
	  <div class="control-group">
		<label class="control-label" for="passWord">密码 <sup>*</sup></label>
		<div class="controls">
		  <input type="password" id="passWord" placeholder="密码" name="passWord">
		</div>
	  </div>
	  <div class="control-group">
		<label class="control-label" for="repassWord">确认密码 <sup>*</sup></label>
		<div class="controls">
		  <input type="password" id="repassWord" placeholder="确认密码">
		</div>
	  </div>
      
      <div class="alert alert-block alert-error fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>完 善 个 人 信 息（可选）</strong>
		
	 </div>	
      
	  <h4>个 人 信 息</h4>
	  <div class="control-group">
		<label class="control-label">性别<sup>*</sup></label>
		  <div class="controls">
		  <select class="span1" name="days">
			<option value="">-</option>
			<option value="1">女生</option>
			<option value="2">男生</option>
		  </select>
		 </div>
		</div>
		<div class="control-group">
		<label class="control-label" for="input_email">邮箱 <sup>*</sup></label>
		<div class="controls">
		  <input type="text" id="input_email" placeholder="邮箱">
		</div>
	  </div>	  
	  
		<div class="control-group">
		<label class="control-label">出 生 日 期 <sup>*</sup></label>
		<div class="controls">
		  <select class="span1" name="days">
				<option value="">-</option>
					<option value="1">1&nbsp;&nbsp;</option>
					<option value="2">2&nbsp;&nbsp;</option>
					<option value="3">3&nbsp;&nbsp;</option>
					<option value="4">4&nbsp;&nbsp;</option>
					<option value="5">5&nbsp;&nbsp;</option>
					<option value="6">6&nbsp;&nbsp;</option>
					<option value="7">7&nbsp;&nbsp;</option>
			</select>
			<select class="span1" name="days">
				<option value="">-</option>
					<option value="1">1&nbsp;&nbsp;</option>
					<option value="2">2&nbsp;&nbsp;</option>
					<option value="3">3&nbsp;&nbsp;</option>
					<option value="4">4&nbsp;&nbsp;</option>
					<option value="5">5&nbsp;&nbsp;</option>
					<option value="6">6&nbsp;&nbsp;</option>
					<option value="7">7&nbsp;&nbsp;</option>
			</select>
			<select class="span1" name="days">
				<option value="">-</option>
					<option value="1">1&nbsp;&nbsp;</option>
					<option value="2">2&nbsp;&nbsp;</option>
					<option value="3">3&nbsp;&nbsp;</option>
					<option value="4">4&nbsp;&nbsp;</option>
					<option value="5">5&nbsp;&nbsp;</option>
					<option value="6">6&nbsp;&nbsp;</option>
					<option value="7">7&nbsp;&nbsp;</option>
			</select>
		</div>
	  </div>


		<h4>收 货 地 址</h4>
		<div class="control-group">
			<label class="control-label" for="inputFname">收货人姓名 <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="inputFname" placeholder="收货人姓名">
			</div>
		</div>
		
		
		<div class="control-group">
			<label class="control-label" for="address">（默认）收货地址<sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="address" placeholder="收货地址"/> <span>省份/市/街道/详细地址</span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="address2">收货地址2<sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="address2" placeholder="收货地址2"/> <span>省份/市/街道/详细信息</span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="postcode">邮政编号<sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="postcode" placeholder="邮政编号"/> 
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="phone"> 手机号<sup>*</sup></label>
			<div class="controls">
			  <input type="text"  name="phone" id="phone" placeholder="手机号"/> <span>至少要存储一个手机号</span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="mobile">家庭电话 </label>
			<div class="controls">
			  <input type="text"  name="mobile" id="mobile" placeholder="家庭电话"/> 
			</div>
		</div>

	<div class="control-group">
			<div class="controls">
				<input type="hidden" name="email_create" value="1">
				<input type="hidden" name="is_new_customer" value="1">
				<input class="btn btn-large btn-success" type="submit" value="注册" name="" />
			</div>
		</div>		
	</form>
</div>

</div>
</div>
</div>
</div>
<!-- MainBody End ============================= -->

<script type="text/javascript">


  function validateUserName(){
	  var xmlHttpReq;	  
	  
	  var userName = document.getElementById("input_userName").value;
	  
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
	  
	  xmlHttpReq.open("post","validateUserName");//设置提交参数
	  
	  xmlHttpReq.onreadystatechange = function(){
		  
		  if(xmlHttpReq.readyState == 4){
			  
				if(xmlHttpReq.status == 200){
					
					//返回正常
					
					var res = xmlHttpReq.responseText;
					
					//alert(res);
					
					var jsonObject = eval("("+res+")");
					
					//alert(jsonObject.exist);
					
					if(jsonObject.exist){
						
						document.getElementById("validateUserName").innerHTML="<img src=\"themes/images/ico/error.ico\">&nbsp;&nbsp;用户名已存在！";
					}else {
						document.getElementById("validateUserName").innerHTML="<img src=\"themes/images/ico/yes.ico\">&nbsp;&nbsp;可以使用";
					}
				}else{
					window.alert("页面请求异常");
				}
			}
		  
	  };//指示响应函数
	  
	  xmlHttpReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	   
	  xmlHttpReq.send("userName="+userName); //提交
	 
  
  }

</script>
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