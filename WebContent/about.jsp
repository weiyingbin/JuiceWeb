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
		<title>关于我们</title>
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
         
<c:import url="index-header.jsp"></c:import>

		<div class="preloader">
			<i class="fa fa-spinner"></i>
		</div>
		
		<div class="heading-inner-page">
			<div class="container">
				<h2>About us</h2>
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li>Login</li>
				</ul>
			</div>
		</div>
		<!-- About -->
		<section>
			<div class="container">
				<div class="bg-img-2">  
					<div class="row">
						<div class="col-sm-9 pull-right">
							<div class="box p-40 bg-white">
								<h1>class="title f-30 m-b-0">欢迎来到我们的网站</h1>
								<p>汇集美好生活，源自天然营养阳光、空气、水，是自然的美丽恩赐；健康营养生活，是身体的美好赏赐。.</p>
								<p>从农业产业园，到果业加工厂。遍布全国的成熟产品体系，只为把每一份新鲜营养带给您</p>
								<p>每批产品出厂均经过生产自检、过程检验和最终产品检验,所有批次产品的出厂检验必须经过历时7天的微生物指标加强检验过程，验证合格后才允许出厂进入流通环节。</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
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
								<h5 class="media-heading">Free shipping on all orders</h5>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">	
						<div class="media ht-media">
							<div class="media-left">
								<i class="fa fa-undo bg-3"></i>
							</div>
							<div class="media-body">
								<h5 class="media-heading">100% money back guarantee</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Footer -->
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

