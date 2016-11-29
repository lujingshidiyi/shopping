<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Order | E-Shopper</title>
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
								<li><a href="#"><i class="fa fa-phone"></i>E-SHOPPER</a></li>
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
							<a href="index.html"><img src="${ctx}/images/home/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="${ctx}"><i class="fa fa-user"></i>首页</a></li>
								<li><a href="${ctx}/security/car/toCart"><i class="fa fa-star"></i>购物车</a></li>
								<li><a href="${ctx}/security/orders/myorders"><i class="fa fa-crosshairs"></i>我的订单</a></li>
								<li><a href="${ctx}/exit" class="active"><i class="fa fa-shopping-cart"></i> 注销</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
	</header><!--/header-->

	<section id="cart_items">
	<form action="${ctx}/security/orders/toOrderPay" method="post" name="pay">
		<div class="container">
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">商品</td>
							<td class="total">订单号</td>
							<td class="price">单价（元）</td>
							<td class="description">件数</td>
							<td class="quantity">小计（元）</td>
							<td class="total">是否付款</td>
							<td>选择</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orders}" var="order">
						<tr>
							<td class="cart_product">
								<a href=""><img src="${ctx}/images/home/${order.pic}" alt=""></a>
							</td>
							<td class="cart_price">
								${order.ordercode}
							</td>
							<td class="cart_description">
								￥${order.merprice}
							</td>
							<td class="cart_description">
								${order.mernum}
							</td>
							<td class="cart_price">
								￥${order.totalprice}
							</td>
							
							<td class="cart_quantity">
								<c:if test="${order.payflag==0}">
										未付款
										<td class="cart_delete">
										<input onclick="clickChoice(this);" type="checkbox" name="orderid" value="${order.orderid}"/>
										<div style="display: none;">
											<input type="checkbox" name="totalprice" value="${order.totalprice}"/>
											<input type="checkbox" name="ordercode" value="${order.ordercode}"/>
										</div>
										</td>
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
			<div class="payment-options">
					<a onclick="toPay()" style=" border-radius: 7px;background-color: #FE980F;
    					float: right;font-size: 20px;height: 50px;color: #FFFFFF;
    					line-height: 50px;width: 100px;
    					text-align: center;cursor: pointer;">去支付</a>
			</div>
		</div>
		</form>
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
<script>
    	function toPay(){
    		$("form[name=pay]").submit();
    	}
    	function clickChoice(obj){
   			if($(obj).is(':checked')){
   				$(obj).next().children().each(function(index,element){
 					$(element).attr("checked",true);
 				});
   			}
   			else{ 
   				$(obj).next().children().each(function(index,element){
 					$(element).attr("checked",false);
 				});
   			}
    	}
    </script>
</html>