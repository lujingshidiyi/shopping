<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | E-Shopper</title>
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
<body>
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="${ctx}">E-SHOPPER</a></li>
								<li><a><i class="fa fa-phone"></i>客服电话:010-100000000</a></li>
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
							<c:if test="${empty userinfo}">
								<ul class="nav navbar-nav">
									<li><a href="${ctx}/toLogin"><i class="fa fa-lock"></i> 登 录</a></li>
									<li><a href="${ctx}/toLogin"><i class="fa fa-crosshairs"></i> 注 册</a></li>
								</ul>
							</c:if>
							<c:if test="${userinfo.role==3}">
								<ul class="nav navbar-nav">
									<li><a href="${ctx}/exit"><i class="fa fa-lock"></i> 注销</a></li>
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
        
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<img src="${ctx}/images/home/girl1.jpg" class="girl img-responsive" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<img src="${ctx}/images/home/girl2.jpg" class="girl img-responsive" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<img src="${ctx}/images/home/girl3.jpg" class="girl img-responsive" alt="" />
								</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
	<section>
		<div class="container">
			<div class="row">
				
				<div class="col-sm-9 padding-right">
					
					<div class="category-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#woman" data-toggle="tab">女 士</a></li>
								<li><a href="#TRF" data-toggle="tab">TRF</a></li>
								<li><a href="#man" data-toggle="tab">男 士</a></li>
								<li><a href="#kids" data-toggle="tab">儿 童</a></li>
								<li><a href="#bags" data-toggle="tab">鞋与包</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="woman" >
								<c:forEach items="${merlist}" var="mer">
								<c:if test="${mer.sid==1 }">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<a href="${ctx}/security/merinfo/detail/${mer.mid}">
													<img src="${ctx}/images/home/${mer.pic }" alt="" />
												</a>
												<h2>￥${mer.merprice }</h2>
												<p>${mer.mername }</p>
												<form style="display: none;" action="${ctx}/security/car/addToCar" method="post">
													<input style="display: none;" value="${mer.mid}" name="merid">
													<input style="display: none;" value="1" name="mernum">
												</form>
												<c:if test="${userinfo.role!=2}">
												<a onclick="addToCar(this);" class="btn btn-default add-to-cart"><!-- <i class="fa fa-shopping-cart"></i> -->加入购物车</a>
											   </c:if>
											</div>
											
										</div>
									</div>
								</div>
								</c:if>
								</c:forEach>
							</div>
							
							<div class="tab-pane fade" id="TRF" >
								<c:forEach items="${merlist}" var="mer">
								<c:if test="${mer.sid==2 }">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<a href="${ctx}/security/merinfo/detail/${mer.mid}">
													<img src="${ctx}/images/home/${mer.pic }" alt="" />
												</a>
												<h2>￥${mer.merprice }</h2>
												<p>${mer.mername }</p>
												<form style="display: none;" action="${ctx}/security/car/addToCar" method="post">
													<input style="display: none;" value="${mer.mid}" name="merid">
													<input style="display: none;" value="1" name="mernum">
												</form>
												<c:if test="${userinfo.role!=2}">
												<a onclick="addToCar(this);" class="btn btn-default add-to-cart">加入购物车</a>
												</c:if>
											</div>
											
										</div>
									</div>
								</div>
								</c:if>
								</c:forEach>
							</div>
							
							<div class="tab-pane fade" id="man" >
								<c:forEach items="${merlist}" var="mer">
								<c:if test="${mer.sid==3}">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<a href="${ctx}/security/merinfo/detail/${mer.mid}">
													<img src="${ctx}/images/home/${mer.pic }" alt="" />
												</a>
												<h2>￥${mer.merprice }</h2>
												<p>${mer.mername }</p>
												<form style="display: none;" action="${ctx}/security/car/addToCar" method="post">
													<input style="display: none;" value="${mer.mid}" name="merid">
													<input style="display: none;" value="1" name="mernum">
												</form>
												<c:if test="${userinfo.role!=2}">
												<a onclick="addToCar(this);" class="btn btn-default add-to-cart">加入购物车</a>
												</c:if>
											</div>
											
										</div>
									</div>
								</div>
								</c:if>
								</c:forEach>
							</div>
							
							<div class="tab-pane fade" id="kids" >
								<c:forEach items="${merlist}" var="mer">
								<c:if test="${mer.sid==4 }">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<a href="${ctx}/security/merinfo/detail/${mer.mid}">
													<img src="${ctx}/images/home/${mer.pic }" alt="" />
												</a>
												<h2>￥${mer.merprice }</h2>
												<p>${mer.mername }</p>
												<form style="display: none;" action="${ctx}/security/car/addToCar" method="post">
													<input style="display: none;" value="${mer.mid}" name="merid">
													<input style="display: none;" value="1" name="mernum">
												</form>
												<c:if test="${userinfo.role!=2}">
												<a onclick="addToCar(this);" class="btn btn-default add-to-cart">加入购物车</a>
												</c:if>
											</div>
											
										</div>
									</div>
								</div>
								</c:if>
								</c:forEach>
							</div>
							
							<div class="tab-pane fade" id="bags" >
								<c:forEach items="${merlist}" var="mer">
								<c:if test="${mer.sid==5 }">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<a href="${ctx}/security/merinfo/detail/${mer.mid}">
													<img src="${ctx}/images/home/${mer.pic }" alt="" />
												</a>
												<h2>￥${mer.merprice }</h2>
												<p>${mer.mername }</p>
												<form style="display: none;" action="${ctx}/security/car/addToCar" method="post">
													<input style="display: none;" value="${mer.mid}" name="merid">
													<input style="display: none;" value="1" name="mernum">
												</form>
												<c:if test="${userinfo.role!=2}">
												<a onclick="addToCar(this);" class="btn btn-default add-to-cart">加入购物车</a>
												</c:if>
											</div>
											
										</div>
									</div>
								</div>
								</c:if>
								</c:forEach>
							</div>
						</div>
					</div><!--/category-tab-->
					
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
								<input type="text" placeholder="您的邮箱地址" />
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
					<p class="pull-left"><center>Copyright © 2016 E-SHOPPER Inc. All rights reserved.</center></p>
				</div>
			</div>
		</div>
	</footer><!--/Footer-->
  	<script src="${ctx}/js/jquery-1.12.4.min.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/jquery.scrollUp.min.js"></script>
	<script src="${ctx}/js/price-range.js"></script>
    <script src="${ctx}/js/jquery.prettyPhoto.js"></script>
    <script src="${ctx}/js/main.js"></script>
    <script>
    	function addToCar(obj){
    		$(obj).prev().submit();
    	}
    </script>
</body>
</html>