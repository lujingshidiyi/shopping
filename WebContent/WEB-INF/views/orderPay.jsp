<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>PAY | E-Shopper</title>
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
		#pwdInput{
			background: #F0F0E9;
		    border: 0;
		    color: #696763;
		    padding: 5px;
		    width: 100%;
		    border-radius: 0;
		    resize: none;
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
			<div class="shopper-informations">
				<div class="row">
				<form name="pay">
					<div class="col-sm-5" style="margin-bottom: 50px;">
					<br/>
					    <label style="font-size: 20px;color: black;">您的订单号:</label>
					    <label style="font-size: 20px;color: black;">${ordercode}</label>
					    <br/>
						<p style="font-size: 30px;color: green;">
						<label style="font-size: 20px;color: black;">您总共需要支付:</label>${totalprice}<label style="font-size: 20px;color: black;">元</label></p>
						<label style="margin-top: 30px;">您的银行:</label>
						<select name="payid">
							<c:forEach items="${banks}" var="bank">
								<option value="${bank.bankid}">${bank.bankname}</option>
							</c:forEach>
						</select>
						<label style="margin-top: 30px;">您的银行卡号:</label>
						<select>
							<c:forEach items="${banks}" var="bank">
								<option>${bank.bankcode}</option>
							</c:forEach>
						</select>
						<label style="margin-top: 30px;">请输入密码:</label><input id="pwdInput" name="password" type="password"/>
						<input type="hidden" name="ordercode" value="${ordercode}"/>
						<input type="hidden" name="userid" value="${userid}"/>
						<input id="payBtn" type="button" value="确认支付" style="border-radius: 7px;
						    background-color: #FE980F;color: #FFFFFF;margin-top: 10px;height: 40px;"/>
					</div>
				</form>
				</div>
			</div>
		</div>
	</section>
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
	$("#payBtn").click(function(){
		$.ajax({
           type: "post",
           url: "${ctx}/security/orders/Pay",
           data: $("form[name=pay]").serialize(),
           success: function(msg){
	           if(msg=="password error"){
	           		alert("密码错误");
	           }
	           if(msg=="success"){
	           		alert("支付成功");
	           		window.location.href="${ctx}";
	           }
           }
        })
	})
</script>
</html>