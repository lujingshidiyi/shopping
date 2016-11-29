<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Checkout | E-Shopper</title>
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
	<style>
		.shopper-informations input{
			background: #F0F0E9;
   		 	border: 0 none;
    		margin-bottom: 10px;
    		padding: 10px;
    		width: 100%;
    		font-weight: 300;
		}
	</style>
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
	<form action="${ctx}/security/orders/orders" method="post" name="pay" >
		<div class="container">
			<div class="shopper-informations">
				<div class="row">
					<!-- <div class="col-sm-3">
						<div class="shopper-info">
							<p>购买人</p>
							<input name="payname" type="text" placeholder="您的名字">
							<input name="payphone" type="text" placeholder="您的电话">
							<input name="payaddress" type="text" placeholder="您的地址">
							<input name="payemail" type="text" placeholder="您的邮箱">
						</div>
					</div> -->
					<div class="col-sm-10 clearfix">
						<div class="bill-to">
							<p>收件人信息填写</p>
							<div class="form-one">
								<input name="rcvname" type="text" placeholder="收件人名字">
							</div>
							<div class="form-two">
								<input name="rcvphone" type="text" placeholder="收件人电话">
							</div>
							<div class="form-three">
								<input name="rcvaddress" type="text" placeholder="收件人地址">
							</div>
							<div class="form-four">
								<input name="rcvemail" type="text" placeholder="收件人邮箱">
							</div>
							<div class="form-four">
								<input name="remark" type="text" placeholder="备注">
							</div>
						</div>
					</div>
					<!-- <div class="col-sm-4">
						<div class="order-message">
							<p>备注</p>
							<textarea name="remark" rows="16"></textarea>
						</div>	
					</div>	 -->				
				</div>
			</div>
			<div class="review-payment">
				<h2>确认订单信息</h2>
			</div>

			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">商品</td>
							<td class="description"></td>
							<td class="price">单价（元）</td>
							<td class="quantity">数量</td>
							<td class="total">小计（元）</td>
							<td>选择</td>
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
								<p>种类: ${car.sname}</p>
							</td>
							<td class="cart_price">
								<p>￥${car.merprice}</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<input class="cart_quantity_input" type="text" name="quantity" value="${car.mernum}" autocomplete="off" size="2">
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">￥${car.totalprice}</p>
							</td>
							<td class="cart_delete">
								<input onclick="clickChoice(this);" type="checkbox" name="carid" value="${car.id}"/>
								<div style="display: none;">
									<input type="checkbox" name="sellerid" value="${car.sellerid}"/>
									<input type="checkbox" name="totalprice" value="${car.totalprice}"/>
									<input type="checkbox" name="merid" value="${car.merid}"/>
									<input type="checkbox" name="mernum" value="${car.mernum}"/>
								</div>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="payment-options">
					<a onclick="toPay()" style=" border-radius: 7px;background-color: #FE980F;
    					float: right;font-size: 20px;height: 50px;
    					line-height: 50px;width: 100px;
    					text-align: center;cursor: pointer; color: #FFFFFF;">提交订单</a>
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


    <script src="${ctx}/js/jquery.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
    <script src="${ctx}/js/jquery.scrollUp.min.js"></script>
    <script src="${ctx}/js/jquery.prettyPhoto.js"></script>
    <script src="${ctx}/js/main.js"></script>
    <script>
    	function toPay(){
    	rcvname=document.pay.rcvname.value;
	    rcvphone=document.pay.rcvphone.value;
	    rcvaddress=document.pay.rcvaddress.value;
	    merid=document.pay.merid.value;
	    
	   
		   if(rcvname==""){
		       alert("收件人名字不能为空！");
		       return false;
		   }
		    if(rcvphone==""){
		       alert("收件人电话不能为空！");
		       return false;
		   }
		   if(rcvaddress==""){
		       alert("收件人地址不能为空！");
		       return false;
		   }
		    /* if(merid==""){
		       alert("请至少选择一项商品进行订单提交！");
		       return false;
		   } */

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
</body>
</html>