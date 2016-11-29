<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Product Details | E-Shopper</title>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/css/prettyPhoto.css" rel="stylesheet">
    <link href="${ctx}/css/price-range.css" rel="stylesheet">
    <link href="${ctx}/css/animate.css" rel="stylesheet">
	<link href="${ctx}/css/main.css" rel="stylesheet">
	<link href="${ctx}/css/responsive.css" rel="stylesheet">
    <link rel="shortcut icon" href="${ctx}/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${ctx}/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${ctx}/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${ctx}/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${ctx}/images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->
 <script language="JavaScript">
function check(){
	   mernum=document.joinin.mernum.value;
	   /* ${merinfo.mernum} */
	   if(mernum==""){
	       alert("请输入购买件数！");
	       return false;
	   }
       if(mernum>${merinfo.mernum}){
	       alert("购买件数输入有误！最多只能购买"+${merinfo.mernum}+"件！");
	       return false;
	   }
	    
	return true;
	}
</script>
<body>
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="${ctx}"><i class="fa fa-phone"></i>E-SHOPPER</a></li>
								<li><a><i class="fa fa-envelope"></i>客服电话：010-100000000</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="${ctx}"><img src="${ctx}/images/home/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<c:if test="${userinfo.role==3}">
								<ul class="nav navbar-nav">
									<li><a href="${ctx}/exit"><i class="fa fa-lock"></i> 注销</a></li>
									<li><a href="${ctx}"><i class="fa fa-user"></i>首页</a></li>
									<li><a href="${ctx}/security/car/toCart"><i class="fa fa-star"></i>购物车</a></li>
									<li><a href="${ctx}/security/orders/myorders"><i class="fa fa-lock"></i>我的订单</a></li>
									<li><a><i class="fa fa-lock"></i>${userinfo.uname},欢迎您</a></li>
								</ul>
							</c:if>
							<c:if test="${userinfo.role==2}">
								<ul class="nav navbar-nav">
									<li><a href="${ctx}"><i class="fa fa-user"></i>首页</a></li>
									<li><a href="${ctx}/security/orderlist"><i class="fa fa-crosshairs"></i>所有订单</a></li>
									<li><a href="${ctx}/security/orderlist/yes"><i class="fa fa-crosshairs"></i>已付款订单</a></li>
									<li><a href="${ctx}/security/orderlist/no"><i class="fa fa-crosshairs"></i>未付款订单</a></li>
									<li><a href="${ctx}/exit" class="active"><i class="fa fa-shopping-cart"></i> 注销</a></li>
								</ul>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	</header>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-9 padding-right">
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<img src="${ctx}/images/home/${merinfo.pic}" alt="" />
							</div>
						</div>
						<div class="col-sm-7">
							<div class="product-information" style="height:380px;"><!--/product-information-->
								<form name="joinin" action="${ctx}/security/car/addToCar" method="post" onSubmit="return check()">
									<img src="${ctx}/images/product-details/new.jpg" class="newarrival" alt="" />
									<h2>商品名称:${merinfo.mername}</h2>
									<h2>货品种类: ${merinfo.sname}<h2>
									<span style="margin-top: 7px;">
										<span style="width: 100%">单价: ${merinfo.merprice}</span>
										<br/><br/><br/><p>剩余数量:${merinfo.mernum}</p>
										<c:if test="${userinfo.role==3}">
										<label>购买数:</label>
										<input name="mernum" type="text" value="1" />&nbsp;<label>件</label>
										<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="submit" class="btn btn-fefault cart">
											加入购物车
										</button>
										</c:if>
										<input type="hidden" name="merid" value="${merinfo.mid}">
									</span>
								</form>
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
				</div>
			</div>
		</div>		
	</section>
	<footer>
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>服务</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">在线帮助</a></li>
								<li><a href="">联系我们</a></li>
								<li><a href="">订单状态</a></li>
								<li><a href="">位置变化</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>快速商店</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">T-恤</a></li>
								<li><a href="">男装</a></li>
								<li><a href="">女装</a></li>
								<li><a href="">鞋子</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>关于我们</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">公司信息</a></li>
								<li><a href="">招贤纳士</a></li>
								<li><a href="">实体商店</a></li>
								<li><a href="">版权保护</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>E-Shopper</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Your email address" />
								<p>订阅最新流行趋势...</p>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left"><center>Copyright © 2013 E-SHOPPER Inc. All rights reserved.</center></p>
				</div>
			</div>
		</div>
	</footer><!--/Footer-->
    <script src="${ctx}/js/jquery-1.12.4.min.js"></script>
	<script src="${ctx}/js/price-range.js"></script>
    <script src="${ctx}/js/jquery.scrollUp.min.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
    <script src="${ctx}/js/jquery.prettyPhoto.js"></script>
    <script src="${ctx}/js/main.js"></script>
</body>
</html>