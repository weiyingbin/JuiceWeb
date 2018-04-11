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
		<title>收藏夹</title>
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
				<h2>收藏夹</h2>
				<ul class="breadcrumb">
					<li><a href="index">主页</a></li>
					<li><a href="#">收藏夹</a></li>
					
				</ul>
			</div>
		</div>
		<!-- Checkout -->
		<section>
			<div class="container">
				<div>
					<div id="content">
						<div class="panel-group">
						<div>
													<div class="table-div">
														<div class="row m-0 table-heading">
															<div class="col col-xs-1"><strong>图片</strong></div>
															<div class="col col-xs-3"><strong>产品名称 </strong></div>
															<div class="col col-xs-2"><strong>分类</strong></div>															
															<div class="col col-xs-2"><strong>单价</strong></div>
															<div class="col col-xs-2"><strong>操作</strong></div>
														</div>
														<c:forEach items="${like}" var="item">
														<div class="row m-0 table-content">
															<div class="col col-xs-1">
																<a href="/dcxy/item?id=${item.id}"><img src="Itempicture/${item.photo}" width="70" alt="iPhone" title="iPhone"></a>
															</div>
															<div class="col col-xs-3">
																<a href="#">${item.name}</a>
															</div>
															<div class="col col-xs-2">${item.type }</div>
															
															<div class="col col-xs-2">${item.price}</div>
															<div class="col col-xs-2"><a href="/dcxy/deleteFavoriteProduct?productId=${item.id}" class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></div>
														</div><!--end row-->
														</c:forEach>
														
														
														
														
													</div>
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
								<h5 class="media-heading">所有订单免费送货 </h5>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">	
						<div class="media ht-media">
							<div class="media-left">
								<i class="fa fa-undo bg-6"></i>
							</div>
							<div class="media-body">
								<h5 class="media-heading">100%退款保证 </h5>
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

