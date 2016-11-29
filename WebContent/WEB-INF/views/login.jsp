<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login | E-Shopper</title>
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
								 <li><a href="${ctx}"><i class="fa fa-phone"></i>E-SHOPPER</a></li>
								<li><a><i class="fa fa-envelope"></i>客服电话：010-100000000</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
	
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>账户登录</h2>
						<form name="form" align="center">
							<input type="text" placeholder="用户名" name="uname"/>
							<input type="password" placeholder="密码" name="password"/>
							<input type="Hidden" name="productid" id="pd" value="login" />
							<span>
								<input type="checkbox" class="checkbox"> 
								下次自动登录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span>
							<button id="login" onclick="checkdata()" type="button" class="btn btn-default" >登 录</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>新用户立即注册!</h2>
						<form name="form1" align="center" action="register">
							<input type="text" placeholder="用户名" name="uname"/>
							<input type="password" name="password" placeholder="密码"/>
							<input type="password" name="password1" placeholder="密码确认"/>
							<input type="email" placeholder="邮箱地址" name="email"/>
							<input type="text" name="bankcode" placeholder="银行卡号" />
							<input type="text" name="bankname" placeholder="银行名称" />
							<button onclick="checkdata1()" type="button" class="btn btn-default">注 册</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	
	
	<footer id="footer"><!--Footer-->
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<center>Copyright © 2016 ZARA Inc. All rights reserved.</center>
					<p class="pull-right"></p>
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
    <script language="JavaScript">
	function checkdata1(){
	   uname=document.form1.uname.value;
	   password=document.form1.password.value;
	   password1=document.form1.password1.value;
	   email=document.form1.email.value;
	   bankcode=document.form1.bankcode.value;
	   bankname=document.form1.bankname.value;
	   
	   if(uname==""){
	       alert("用户名不能为空！");
	       return false;
	   }
	    if(password==""){
	       alert("密码不能为空！");
	       return false;
	   }
	   if(password!=password1){
	       alert("两次密码输入不匹配！");
	       return false;
	   }
	   if(email==""||(email.indexOf('@')==-1)||(email.indexOf('.')==-1)){
	       alert("邮箱格式不正确！");
	       return false;
	   }
	    if(bankcode==""){
	       alert("银行账号不能为空！");
	       return false;
	   }
	    if(bankname==""){
	       alert("银行名称不能为空！");
	       return false;
	   }
	   $.ajax({
           type: "post",
           url: "${ctx}/register",
           data: $("form[name=form1]").serialize(),
           success: function(msg){
	           if(msg=="success"){
	           		alert("注册成功");
	           		window.location.href="${ctx}/toLogin";
	           }
	           else{
	           		alert("注册失败");
	           }
           }
        })
	   return true;
	}
	
	function checkdata(){
	   uname=document.form.uname.value;
	   password=document.form.password.value;
	   
	   if(uname==""){
	       alert("用户名不能为空！");
	       return false;
	   }
	    if(password==""){
	       alert("密码不能为空！");
	       return false;
	   }
		$.ajax({
           type: "post",
           url: "${ctx}/login",
           data: $("form[name=form]").serialize(),
           success: function(msg){
	           if(msg=="error"){
	           		alert("用户名或密码错误");
	           		window.location.href="${ctx}/toLogin";
	           }
	           if(msg=="index"){
	           		window.location.href="${ctx}";
	           }
	           if(msg=="redirect"){
	           		window.location.href="${ctx}/security/orderlist";
	           }
           }
        })
	return true;
	}
	
	</script>
</body>
</html>