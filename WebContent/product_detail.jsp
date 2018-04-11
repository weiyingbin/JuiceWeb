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
				<h2>产品详情</h2>
				<ul class="breadcrumb">
					<li><a href="#">首页</a></li>
					<li><a href="#">产品</a></li>
					
					<li>${item.name}</li>
				</ul>
			</div>
		</div>
		<!-- Product -->
		<section class="m-t-30"> 
			<div class="container">
					<div class="row">
						<!-- Product image gallery -->
						<div class="col-sm-6 col-md-7">
							<ul class="thumbnails p-0">
								<li>
									<a class="thumbnail img-large image-zoom" href="Itempicture/${item.photo}" title="iPhone">
										<img src="Itempicture/${item.photo}" alt="iPhone">
									</a>
								</li>
								<li class="image-additional">
									<a class="thumbnail image-zoom" href="Itempicture/${item.photo}" title="iPhone">
										<img src="Itempicture/${item.photo}" title="iPhone" alt="iPhone">
									</a>
								</li>
							</ul>
						</div>
						<!-- Product decr -->
						<form action="addToCard.action"  method="post">
						<div class="col-sm-6 col-md-5">
							<div class="product-pare m-t-xs-60">
								<h1>${item.name}</h1>
								<p>${item.state}</p>
								<p class="product-price">${item.price}</p>
								<div class="quantily-wrap">
									<label  class="control-label" for="input-quantity"></label>
									<input type="number" value="1" name="num" size="2" id="input-quantity" class="form-control form-item">
									<input type="hidden" name="itemId" value="${item.id}" />
								</div>
								<input type="submit" value="加入购物车"  class="btn ht-btn bg-3 m-t-0" />
								<div class="m-t-30">
								<a href="#">${amountcomment} 评论</a> / <a href="#">写评论</a>
								</div>
							</div>
						</div>
					</form>
					</div><!-- End row -->
				<!-- Tabs -->
				<div class="row m-t-30">
					<div class="col-sm-9">
						<div class="p-30 bore">
							<h3 class="title">说明</h3>
							<p>${item.state}</p>
						</div>

                      <c:forEach  items="${pingluns}" var="pingluns">
                   
						<div class="p-30 bore">   
									<img src="Itempicture/${pingluns.pphoto}" alt="image" id=photos style="height: 300px;width: 300px">	
									</br>			                                                            
									<h3 class="title">${pingluns.uname}</h3>
									<p>${pingluns.neirong}</p>
                                    <label class="control-label m-b-10" for="input-name">${pingluns.ptime}</label>
			        </div>
			        
                    
                    
                    </c:forEach>





						<form action="pinglun.action" method="post"  enctype="multipart/form-data">
							<input type="hidden" name="cid" value="${item.id}" />
							<h3 class="title">写评论</h3>
							<div class="form-group required">
								
							</div>
							<div class="form-group required">
								<div class="col-sm-12">
									<label class="control-label m-b-10" for="input-review">你的评论</label>
									<textarea name="neirong" rows="5" id="input-review" class="form-control form-item"></textarea>
									<div class="help-block">
										<span class="text-danger">Note:</span> HTML is not translated!
									</div>
								</div>
							</div>
							<div class="form-group required">
								<div class="col-sm-12">
								<td id="more">									
                                   <input type="file" name="file" />
								<td>
								</div>
							</div>
							<div class="buttons clearfix">
								<div class="">
									<button type="submit" class="btn btn-primary ht-btn bg-6">提交</button>
								</div>
							</div>
						</form>
						






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
				<h3 class="title">产品相关</h3>
				<div class="row product-bor">
					<div class="owl" data-items="4" data-itemsDesktop="4" data-itemsDesktopSmall="3" data-itemsTablet="2" data-itemsMobile="1" data-transitionstyle="backslide" data-singleItem="false" data-autoplay="false" data-pag="false" data-buttons="true">
						<c:forEach items="${relateItems}" var="relateItem">
						<div class="col-sm-12">
							<!-- Product item -->
		
							<div class="product-item m-b-0">
								<a href="/dcxy/item?id=${relateItem.id}" class="product-img">
									<img src="Itempicture/${relateItem.photo}" alt="image">
								</a>
								<div class="product-caption">
									<h4 class="product-name">
										<a href="#">${relateItem.name}</a>
									</h4>
									
									<div class="product-price-group">
										<span class="product-price-old">$12,00</span>
										<span class="product-price">${relateItem.price}</span>
									</div>
								</div>
								<div class="ht-btn-group">
									<a href="#"><i class="fa fa-heart-o"></i></a>
									<a href="#"><i class="fa fa-exchange"></i></a>
									<a href="#">加入购物车</a>
								</div>
							</div>
						</div>
						</c:forEach>		
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

