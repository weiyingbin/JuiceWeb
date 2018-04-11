<%@ page language="java" contentType="text/html; charset=utf-8"   
 pageEncoding="utf-8"%>
 
 <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">

<head>
 <meta content="text/html;charset=utf-8" />
<meta content="text/html;charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
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
#photos{
heigth:100px;
width:200px;

}
tab-content{
heigth:500px;
width:600px;

}
</style>
</head>
<body class="bg-m">

 

<div class="preloader">
	<i class="fa fa-spinner"></i>
</div>
<c:import url="index-header.jsp"></c:import>
<!-- Banner -->
<section class="m-t-0">
	<div class="container">
		<div class="row slider slider-1">
			<div class="owl" data-items="4" data-itemsDesktop="3" data-itemsDesktopSmall="2" data-itemsTablet="2" data-itemsMobile="1" data-transitionstyle="fade" data-singleItem="true" data-autoplay="true" data-pag="false" data-buttons="false">
				<div class="col-sm-8 col-md-9 pull-right">
					<div class="slider-item">
						<img src="images/bg-13.png" alt="image">
						<div class="slider-caption">
						<h3 class="heading-size-3">100% 天然</h3> 
							<h2 class="heading-size-1">有机的</h1>
							<h4 class="heading-size-5">最好的有机产品商店</h4>
						</div>
					</div>
				</div>
				<div class="col-sm-8 col-md-9 pull-right">
					<div class="slider-item">
						<img src="images/bg-12.png" alt="image">
						<div class="slider-caption">
							<h3 class="heading-size-3">我们的供应来自农场</h3> 
							<h2 class="heading-size-1">蔬菜</h1>
							<h4 class="heading-size-5">农场的新鲜蔬菜 & 水果</h4>
						</div>
					</div>
				</div>
				<div class="col-sm-8 col-md-9 pull-right">
					<div class="slider-item">
						<img src="images/bg-21.png" alt="image">
						<div class="slider-caption">
							<h3 class="heading-size-3">非常好</h3>
							<h1 class="heading-size-1">水果</h1>
							<h4 class="heading-size-5">巨大的不同来自小小的味道</h4>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
</section>
<section class="m-t-0">
	<div class="container">
		<div class="row m-0">
			<div class="col-sm-4 m-b-30 p-0">
				<div class="banner bg-img-8 bg-2">
					<div class="caption">
						<h2 class="heading-size-4">蔬菜</h2>
						<h3 class="heading-size-6 f-normal">非常新鲜</h3>
						<a href="#" class="btn ht-btn ht-btn-bg-2">阅读更多</a>
					</div>
				</div>
			</div>
			<div class="col-sm-4 m-b-30 p-0">
				<div class="banner bg-img-0 bg-6">
					<div class="caption">
						<h2 class="heading-size-4">水果</h2>
						<h3 class="heading-size-6 f-normal">给予你的家庭</h3>
						<a href="#" class="btn ht-btn ht-btn-bg-2">阅读更多</a>
					</div>
				</div>
			</div>
			<div class="col-sm-4 p-0">
				<div class="banner bg-img-7 bg-3">
					<div class="caption">
						<h2 class="heading-size-4">有机的</h2>
						<h3 class="heading-size-6 f-normal">100% 绿色</h3>
						<a href="#" class="btn ht-btn ht-btn-bg-2">阅读更多</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product tabs -->
<div>
	<div class="container text-center m-t-30">
		<h3 class="title f-30">我们的产品</h3>
		<p>你的支出与你得到成正比</p>	
		<div class="ht-tabs ht-tabs-product text-center">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs m-b-20" role="tablist">
				<li role="presentation" class="active">
					<a href="/dcxy/index" aria-controls="tab-description" role="tab" data-toggle="tab"><p><img src="images/25.jpg" alt="image"></p>所有</a>
				</li>
				<li role="presentation">
					<a href="/dcxy/vegetable" aria-controls="tab-review" role="tab" data-toggle="tab"><p><img src="images/17.jpg" alt="image"></p>蔬菜</a>
				</li>
				<li role="presentation">
					<a href="/dcxy/fruit" aria-controls="tab-review" role="tab" data-toggle="tab"><p><img src="images/6.jpg" alt="image"></p>水果</a>
				</li>
				
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="tab-description">
					<div class="row">
						<c:forEach  items="${items}" var="item">
						<div class="col-sm-6 col-md-4 col-lg-3">
							<!-- Product item -->
							<div class="product-item">
								<a href="/dcxy/item?id=${item.id}">
									<img src="Itempicture/${item.photo}" alt="image" id=photos>
								</a>
								<div class="product-caption">
									<h4 class="product-name">
										<a href="#">${item.name}</a>
									</h4>
									<div class="product-price-group">
										<span class="product-price">${item.price}</span>
									</div>
									<div class="ht-btn-group">
										<a href="/dcxy/addFavorite?proId=${item.id}" onclick="favorite();" class="wishlist_btn"><i class="fa fa-heart-o"></i></a>
										<a href="/dcxy/addToCard?itemId=${item.id}" onclick="msgshow();">加入购物车</a>
										<a href="#" class="compare_btn"><i class="fa fa-exchange"></i></a>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
						
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="tab-review">
				............
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Testimonials -->
<section class="text-center m-t-30">
	<div class="container">
		<div class="bg-img-1">
			<div class="row">
			
				<div class="col-sm-8 col-sm-offset-4">
			
					<div class="testimonials">
					
						<h3 class="title f-30">客户评价</h3>
						
						<div class="owl" data-items="4" data-itemsDesktop="3" data-itemsDesktopSmall="2" data-itemsTablet="2" data-itemsMobile="1" data-transitionstyle="fade" data-singleItem="true" data-autoplay="true" data-pag="true" data-buttons="false">
						<div class="testimonial-item">
								<span><img src="images/1.jpg" alt="image"></span>
								<p>人们留下的足迹，你也值得留下 ${inumber}</p>	
								<strong>来自本店</strong>
							</div>
						
						 <c:forEach items="${pinglun}" var="ping">
							<div class="testimonial-item">
								<span><img src="images/1.jpg" alt="image"></span>
								<p>${ping.neirong}</p>	
								<strong>${ping.uname}</strong>
							</div>	
							</c:forEach>						
						</div>
						
					</div>
					
				</div>
				
			</div>
		</div>
	</div>
</section>
<!-- Product slider-->
<section class="text-center">
	<div class="container">
		<h3 class="title f-30">特色</h3>
		<p>你的支出与你的得到成正比</p>
		<div class="row">
			<div class="owl" data-items="4" data-itemsDesktop="3" data-itemsDesktopSmall="2" data-itemsTablet="2" data-itemsMobile="1" data-transitionstyle="backslide" data-singleItem="false" data-autoplay="false" data-pag="false" data-buttons="false">
				
				<c:forEach items="${relate}" var="relates">
				<div class="col-lg-12">
					<!-- Product item -->
					<div class="product-item">
						<a href="/dcxy/item?id=${relates.id}">
							<img src="Itempicture/${relates.photo}" alt="image">
						</a>
						<div class="product-caption">
							<h4 class="product-name">
								<a href="#">${relates.name}</a>
							</h4>
							<div class="product-price-group">
								<span class="product-price">${relates.price}</span>
							</div>
							<div class="ht-btn-group">
								<a href="#" class="wishlist_btn"><i class="fa fa-heart-o"></i></a>
								<a href="/addToCard?itemId=${relates.id}" >加入购物车</a>
								<a href="#" class="compare_btn"><i class="fa fa-exchange"></i></a>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
</section>
<section class="m-t-30">
	<div class="container text-center">
		<h3 class="title f-30">来自博客</h3>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>	
		<div class="row m-t-30">
			<div class="owl" data-items="3" data-itemsDesktop="3" data-itemsDesktopSmall="2" data-itemsTablet="2" data-itemsMobile="1" data-transitionstyle="fade" data-singleItem="false" data-autoplay="false" data-pag="false" data-buttons="false">
				<c:forEach items="${gonggaos}" var="gonggao">
				<div class="col-sm-12">
					<div class="blog-item m-b-0">
						<a href="/dcxy/gonggao?id=${gonggao.gid}" class="blog-img">
							<img src="Itempicture/${gonggao.gphoto}" alt="image">
						</a>	
						<div class="blog-caption">
							<ul class="blog-date">
								<li><i class="fa fa-clock-o"></i>${gonggao.gtime}</li>
								<li><a href="/dcxy/gonggao?id=${gonggao.gid}"><i class="fa fa-comments-o"></i>3</a></li>
							</ul>
							<h3 class="blog-heading"><a href="#">${gonggao.gname}</a></h3>
							<p>${gonggao.gneirong}</p>
							<a href="/dcxy/gonggao?id=${gonggao.gid}" class="btn ht-btn ht-btn-1"><i class="fa fa-long-arrow-right"></i>Read more</a>
						</div>
					</div>
				</div><!--end blog-->
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
<script type="text/javascript">
function msgshow(){
	var numbers="${sessionScope.inumber}";
		if(numbers==0){
		alert("添加购物车失败！");
	}else{
		alert("添加购物车成功！");
	}
}
function favorite(){
	var numbers="${sessionScope.fai}";
		if(numbers==0){
		alert("添加收藏夹失败！");
	}else{
		alert("添加收藏夹成功！");
	}
}


</script>
</body>
</html>