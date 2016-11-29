<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>OrderList | E-Shopper</title>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/css/prettyPhoto.css" rel="stylesheet">
    <link href="${ctx}/css/price-range.css" rel="stylesheet">
    <link href="${ctx}/css/animate.css" rel="stylesheet">
	<link href="${ctx}/css/main.css" rel="stylesheet">
	<link href="${ctx}/css/responsive.css" rel="stylesheet">
    <link rel="shortcut icon" href="images/ico/favicon.ico">
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
								<li><a href="${ctx}"><i class="fa fa-phone"></i>E-SHOPPER</a></li>
								<li><a href=""><i class="fa fa-envelope"></i>客服电话：010-100000000</a></li>
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
							<ul class="nav navbar-nav">
								<li><a href="${ctx}"><i class="fa fa-user"></i>首页</a></li>
								<li><a href="${ctx}/security/orderlist"><i class="fa fa-crosshairs"></i>所有订单</a></li>
								<li><a href="${ctx}/security/orderlist/yes"><i class="fa fa-crosshairs"></i>已付款订单</a></li>
								<li><a href="${ctx}/security/orderlist/no"><i class="fa fa-crosshairs"></i>未付款订单</a></li>
								<li><a href="${ctx}/exit" class="active"><i class="fa fa-shopping-cart"></i> 注销</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
	</header><!--/header-->

	<section id="cart_items">
		<div class="container">
			<div class="table-responsive cart_info" style="margin-bottom: 5px;">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="number">订单号</td>
							<td class="image"></td>
							<td class="description">商品名称</td>
							<td class="mernum">件数</td>
							<td class="price">收件人</td>
							<td class="rcvphone">收件人电话</td>
							<td class="quantity">收货地址</td>
							<td class="remark">备注</td>
							<td class="total">是否付款</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orders}" var="order">
							<tr>
								<td class="cart_description">
									<h7>${order.ordercode}</a></h7>
								</td>
								<td class="cart_product">
									<img src="${ctx}/images/home/${order.pic}" alt=""></a>
								</td>
								<td class="cart_description">
									&nbsp;&nbsp;&nbsp;<h7>${order.mername}</a></h7>
								</td>
								<td class="cart_mernum">
									<h6>${order.mernum}</h6>
								</td>
								<td class="cart_price">
									${order.rcvname}
								</td>
								<td class="cart_rcvphone">
									${order.rcvphone}
								</td>
								<td class="cart_quantity">
									${order.rcvaddress}
								</td>
								<td class="cart_remark">
									${order.remark}
								</td>
								<td class="cart_total">
									<c:if test="${order.payflag==0}">
										未付款
									</c:if>
									<c:if test="${order.payflag==1}">
										已付款
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="margin-bottom: 50px;float: right;
				font-size: 31px;background-color: #94EC8F;
				border-radius: 7px;">
			</div>
		</div>
	</section> <!--/#cart_items-->


	<footer id="footer"><!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2><span>e</span>-shopper</h2>
							<p>最新流行趋势，尽在E-SHOPPER官网。包括了每周女士、男士、儿童和宝宝的新款服装以及所有LOOKBOOK。</p>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="${ctx}/images/home/iframe1.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>潮人街拍</p>
								<h2>2016</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="${ctx}/images/home/iframe2.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>时尚单品</p>
								<h2>2016</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="${ctx}/images/home/iframe3.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>潮流搭配</p>
								<h2>2016</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="${ctx}/images/home/iframe4.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>流行趋势</p>
								<h2>2016</h2>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="address">
							<img src="${ctx}/images/home/map.png" alt="" />
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
</body>
<script src="${ctx}/js/jquery-1.12.4.min.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/jquery.scrollUp.min.js"></script>
<script src="${ctx}/js/jquery.prettyPhoto.js"></script>
<script src="${ctx}/js/main.js"></script>
</html>