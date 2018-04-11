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
		<title>找回密码</title>
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
	<style type="text/css">
	#div1{
	color:red;
	font-size:15pt;
	}
	</style>
	
	</head>
	<body> 
		<div class="preloader">
			<i class="fa fa-spinner"></i>
		</div>
		<c:import url="index-header.jsp"></c:import>
		<div class="heading-inner-page">
			<div class="container">
				<h2>找回密码</h2>
				<ul class="breadcrumb">
					<li><a href="#">主页</a></li>
					<li>找回密码</li>
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
								<form action="zhpass.action" method="post">
									<div class="form-group">
										<label class="control-labe" for="input-email">邮箱</label><div id="div1" >${info}</div>
										<input type="text" name="email" value="" placeholder="E-mail" id="input-email" class="form-control form-item">
									</div>
									<div class="form-group">
										<label class="control-label" for="input-email">电话</label>
										<input type="text" name="phone" value="" placeholder="Telephone" id="input-phone" class="form-control form-item">
									</div>
									<div class="form-group">
										<label class="control-label" for="input-password">新的密码</label>
										<input type="password" name="pwd" value="" placeholder="Password" id="input-password" class="form-control form-item">
									</div>
									<div class="m-t-15"> 
									<a href="#" class="agree"><b class="color-6">Privacy Policy</b></a>                       
									<br>
								</div>
									
							
									<input type="submit" class="btn ht-btn bg-6 m-t-30" value="注册" />
									<div id="div1" >${errorinfo}</div>
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
								<h5 class="media-heading">加盟  24/7: 0123-456-789</h5>
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
								<h5 class="media-heading">100% 保证退款</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<c:import url="index-footer.jsp"></c:import>
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

