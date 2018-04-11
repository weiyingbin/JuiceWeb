<%@ page language="java" contentType="text/html; charset=utf-8"   
 pageEncoding="utf-8"%>
 
 <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zxx">
	<head>
		 <meta content="text/html;charset=utf-8" />
		<meta content="text/html;charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>产品详情</title>
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
				<h2>博客内容</h2>
				<ul class="breadcrumb">
					<li><a href="#">首页</a></li>
					<li><a href="#">博客</a></li>
					<li>${gonggao.gname}</li>
				</ul>
			</div>
		</div>
		<!-- Product -->
		<section class="m-t-30"> 
			<div class="container" style="text-align:center">
					<div class="row" >
						<!-- Product image gallery -->
						
						<!-- Product decr -->
						
						<div class="col-sm-6 col-md-7">
							<div class="product-pare m-t-xs-60">
								<h1>${gonggao.gname}</h1>
								<div class="col-sm-6 col-md-7">
							<ul class="thumbnails p-0">
								<li>
									<a class="thumbnail img-large image-zoom" href="Itempicture/${gonggao.gphoto}" title="${gonggao.gname}">
										<img src="Itempicture/${gonggao.gphoto}" alt="${gonggao.gname}">
									</a>
								</li>		
							</ul>
						    </div>
								
								<p style="text-align:center;color:#123456;font-size:30px;" >${gonggao.gneirong}</p>								
								</div>
							</div>
						</div>
					
					
					</div><!-- End row -->
				<!-- Tabs -->
				<div class="row m-t-30">
					<div class="col-sm-9">
						


					</div>
					<div class="col-sm-3">
						<div class="banner bg-img-13">
							<div class="caption text-center">
								<h2 class="heading-size-3 f-bold">100%</h2>
								<h3 class="heading-size-5 f-normal">有机</h3>
								<a href="#" class="btn ht-btn ht-btn-bg-2">阅读更多</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Product relaed -->
		<section>
			<div class="container">
				
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

