<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cart | E-Shopper</title>
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
   <style>
	.gw_num{border: 1px solid #dbdbdb;width: 110px;line-height: 26px;overflow: hidden;}
	.gw_num em{display: block;height: 26px;width: 26px;float: left;color: #7A7979;border-right: 1px solid #dbdbdb;text-align: center;cursor: pointer;font-style:normal;}
	.gw_num .num{display: block;float: left;text-align: center;width: 52px;font-style: normal;font-size: 14px;line-height: 24px;border: 0;}
	.gw_num em.add{float: right;border-right: 0;border-left: 1px solid #dbdbdb;}
	</style>
</head><!--/head-->
<script type="text/javascript">
		$(document).ready(function(){
			//加的效果
			$(".add").click(function(){
			var n=$(this).prev().val();
			var num=parseInt(n)+1;
			if(num==0){ return;}
			$(this).prev().val(num);
			});
			//减的效果
			$(".jian").click(function(){
			var n=$(this).next().val();
			var num=parseInt(n)-1;
			if(num==0){ return}
			$(this).next().val(num);
			});
		})
</script>
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
							<a href="${ctx}"><img src="${ctx}/images/home/logo.png" alt="" /></a>
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
		<div class="container">
			<div class="table-responsive cart_info" style="margin-bottom: 5px;">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">商品</td>
							<td class="description"></td>
							<td class="price">单价（元）</td>
							<td class="quantity">&nbsp;&nbsp;数量</td>
							<td class="total">小计（元）</td>
							<td class="total">操作</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cars}" var="car">
							<tr>
								<td class="cart_product">
									<a href=""><img src="${ctx}/images/home/${car.pic}" alt=""></a>
								</td>
								<td class="cart_description">
									<h4><a href="">${car.mername}</a></h4>
									<h5><p>种类: ${car.sname}</p><h5>
								</td>
								<td class="cart_price">
									<p>￥${car.merprice}</p>
								</td>
								<td class="cart_quantity">
									<!-- <div class="gw_num">
										<input type="button" class="jian" value="-"></input>
										<input type="text" value="1" class="num" size="2"/>
										<input type="button" class="add" value="+"></input>
									</div> -->
									<div class="gw_num">
										<em class="jian">-</em>
										<input type="text" value="${car.mernum}" class="num"/>
										<em class="add">+</em>
									</div>
								</td>
								<td class="cart_total">
									<p class="cart_total_price">${car.totalprice}</p>
								</td>
								<td class="cart_total">
									<a href="${ctx}/security/car/deleteCar?id=${car.id}">×</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="margin-bottom: 50px;float: right;
				font-size: 31px;background-color: #94EC8F;
				border-radius: 7px;">
				<button type="button" class="btn btn-default pull-right" style="background:#FE980F;">
					<a href="${ctx}/security/car/toCheckOut" style="color: #FFFFFF;">核算</a>
				</button>
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