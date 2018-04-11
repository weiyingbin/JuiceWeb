<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
	<head>
		 <meta content="text/html;charset=utf-8" />
		<meta content="text/html;charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>登录</title>
		<!-- JqueryUI -->
		<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
		<!-- Bootstrap -->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<!-- Awesome font icons -->
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" media="screen">
		<!-- Owlcoursel -->
		<link rel="stylesheet" type="text/css" href="css/owl-coursel/owl.carousel.css">
		<link rel="stylesheet" type="text/css" href="css/owl-coursel/owl.transitions.css">
		<!-- Magnific-popup -->
		<link rel="stylesheet" type="text/css" href="css/magnific-popup/magnific-popup.css">
		<!-- Style -->
		<link rel="stylesheet" type="text/css" href="css/style.css" media="screen">
		<!-- Fw -->
		<link rel="stylesheet" type="text/css" href="css/fw.css" media="screen">
	</head>
	<body>

         

		<div class="preloader">
			<i class="fa fa-spinner"></i>
		</div>
		<c:import url="index-header.jsp"></c:import>
		<div class="heading-inner-page">
			<div class="container">
				<h2>登录</h2>
				<ul class="breadcrumb">
					<li><a href="#">主页</a></li>
					<li>登录</li>
				</ul>
			</div>
		</div>
		<!-- Login page -->
		<div class="m-t-60">
			<div class="container">
				<div class="bg-img-2 position-left">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<div class="box p-40 p-xs-20 bg-white">
								<form action="doLogin.action" method="post">
									<div class="form-group">
										<label class="control-label" for="input-email">E-Mail 地址</label>
										<input type="text" name="email1" id="input-email" class="form-control form-item">
									</div>
									<div class="form-group m-t-30">
										<label class="control-label" for="input-password">密码</label>
										<input type="password" name="password" value="" placeholder="Password" id="input-password" class="form-control form-item">
										<a class="m-b-30" href="zhpass.jsp">忘记密码</a>
									</div>
									<input type="submit" class="btn ht-btn bg-6" value="登录">
									<div>${errorinfo}</div>
								</form>
							</div>
						</div>
					 </div>
				 </div>
			</div>
		</div>
		<!-- Process order -->
		<section  class="process">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-md-4">	
						<div class="media ht-media">
							<div class="media-left">
								<i class="fa fa-phone bg-6"></i>
							</div>
							<div class="media-body">
								<h5 class="media-heading">Support 24/7: 0123-456-789</h5>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">	
						<div class="media ht-media">
							<div class="media-left">
								<i class="fa fa-truck bg-2"></i>
							</div>
							<div class="media-body">
								<h5 class="media-heading">所有订单免费送货</h5>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">	
						<div class="media ht-media">
							<div class="media-left">
								<i class="fa fa-undo bg-3"></i>
							</div>
							<div class="media-body">
								<h5 class="media-heading">100% 退款保证</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Footer -->
		<footer class="color-inher">
			<div class="footer-top">
				<div class="container">
					<div class="row">
						<div class="col-sm-3 m-b-xs-30">
							<h3 class="title">信息</h3>
							<ul>
								<li><a href="#">关于我们</a></li>
								<li><a href="#">发送信息</a></li>
								<li><a href="#">隐私策略</a></li>
								<li><a href="#">条款和付款情况</a></li>
							</ul>
						</div>
						<div class="col-sm-3 m-b-xs-30">
							<h3 class="title">My Account</h3>
							<ul>
								<li><a href="#">我的账户</a></li>
								<li><a href="#">历史订单</a></li>
								<li><a href="#">列表</a></li>
								<li><a href="#">用户指导</a></li>
							</ul>
						</div>
						<div class="col-sm-3 m-b-xs-30">
							<h3 class="title">附加物</h3>
							<ul>
								<li><a href="#">品牌</a></li>
								<li><a href="#">礼品券</a></li>
								<li><a href="#">分支机构</a></li>
								<li><a href="#">特价</a></li>
							</ul>
						</div>
						<div class="col-sm-3 m-b-xs-30">客户服务
							<h3 class="title"></h3>
							<ul>
								<li><a href="#">联系我们</a></li>
								<li><a href="#">返回</a></li>
								<li><a href="#">站点地图 </a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom">
				<div class="container">
					<p>Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
				</div>
			</div>
		</footer>
		<!-- jQuery -->
		<script src="js/jquery/jquery-2.2.4.min.js"></script>
		<!-- JqueryUI -->
		<script src="js/jquery/jquery-ui.js"></script>
		<!-- Bootstrap -->
		<script src="js/bootstrap/bootstrap.min.js"></script>
		<!-- Owl-coursel -->
		<script src="js/owl-coursel/owl.carousel.js"></script>
		<!-- Magnific-popup -->
		<script src="js/magnific-popup/jquery.magnific-popup.min.js"></script>
		<!-- Script -->
		<script src="js/script.js"></script>
	</body>
</html>

