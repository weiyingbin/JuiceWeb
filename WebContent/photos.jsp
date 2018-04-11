	<%@ page language="java" contentType="text/html; charset=utf-8"   
 pageEncoding="utf-8"%>
 
 <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<title>Photos</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Great Taste Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- //js -->
</head>
	
<!-- banner-body -->
	<div class="banner-body">
		<div class="container">
			<div class="banner-body-content">
			<div class="col-xs-3 banner-body-left">
				<div class="logo">
					<h1><a href="index.html">大 <span>创作</span></a></h1>
				</div>
				<div class="top-nav">
					<nav class="navbar navbar-default">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
						  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">切换导航</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						  </button>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						
						<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
							<nav class="stroke">
								<ul class="nav navbar-nav">
								    <li ><a href="index"><i class="home"></i>主页</a></li>
									<li><a href="bindex" class="hvr-underline-from-left"><i class="home1"></i>博客主页</a></li>
									<li class="active"><a href="photos"><i class="picture"></i>照片</a></li>
									<li><a href="person" class="hvr-underline-from-left"><i class="edit1"></i>个人博客</a></li>
									</ul>
							</nav>
						</div>
						<!-- /.navbar-collapse -->
					</nav>
				</div>
			</div>
			<div class="col-xs-9 banner-body-right">
				<div class="wmuSlider example1">
					<div class="wmuSliderWrapper">
						<article style="position: absolute; width: 100%; opacity: 0;"> 
							<div class="banner-wrap">
								<div class="banner">
								</div>
							</div>
						</article>
						<article style="position: absolute; width: 100%; opacity: 0;"> 
							<div class="banner-wrap">
								<div class="banner1">
								</div>
							</div>
						</article>
						<article style="position: absolute; width: 100%; opacity: 0;"> 
							<div class="banner-wrap">
								<div class="banner2">
								</div>
							</div>
						</article>
					</div>
				</div>
					<script src="js/jquery.wmuSlider.js"></script> 
					  <script>
						$('.example1').wmuSlider();         
					 </script> 
				<div class="banner-bottom">
					<div class="col-md-4 banner-left">
						<div class="col-xs-3 banner-left1">
							<div class="banner-left11">
								<span> </span>
							</div>
						</div>
						<div class="col-xs-9 banner-right1">
							<h3>想象</h3>
						</div>
						<div class="clearfix"> </div>
						<p>让你的想象成为现实</p>
					</div>
					<div class="col-md-4 banner-left">
						<div class="col-xs-3 banner-left1">
							<div class="banner-left22">
								<span> </span>
							</div>
						</div>
						<div class="col-xs-9 banner-right1">
							<h3>才能</h3>
						</div>
						<div class="clearfix"> </div>
						<p>有才能就要展示与世人相见！</p>
					</div>
					<div class="col-md-4 banner-left">
						<div class="col-xs-3 banner-left1">
							<div class="banner-left33">
								<span> </span>
							</div>
						</div>
						<div class="col-xs-9 banner-right1">
							<h3>新鲜</h3>
						</div>
						<div class="clearfix"> </div>
						<p>我们新鲜的材料让你的想法更容易实现，让你的舌尖更加喜欢让食物在上面舞动！</p>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"> </div>
			<div class="col-xs-3 banner-body-left">
				<div class="latest-news">
					<h2>最新消息</h2>
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					  <div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
						  <h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							  ${blog1.username}
							</a>
						  </h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						  <div class="panel-body">
							<a href="/dcxy/singlephoto?phoid=${blog1.id}">${blog1.details}</a>
						  </div>
						</div>
					  </div>
					  
					  <div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
						  <h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							  ${blog2.username}
							</a>
						  </h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
						  <div class="panel-body">
							<a href="/dcxy/singlephoto?phoid=${blog2.id}">${blog2.details}</a>
						  </div>
						</div>
					  </div>
					  <div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
						  <h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
							 ${blog3.username}
							</a>
						  </h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
						  <div class="panel-body">
							<a href="/dcxy/singlephoto?phoid=${blog3.id}">${blog3.details}</a>
						  </div>
						</div>
					  </div>
					</div>
					
					
					<div class="join">
						<a href="allphotos">查看更多照片</a>
					</div>
					</div>
			</div>
			
			
			<div class="col-xs-9 banner-body-right">
				<div class="gallery-head">
					<h5>照片库</h5>
					<p>But I must explain to you how all this mistaken idea of denouncing  pleasure and praising pain was born.</p>
				</div>
				<div class="gallery-grids">
					
					<c:forEach items="${photos}" var="pho">
					
					<div class="gallery-grid">
						<a href="picture/${pho.photo}" rel="title" class="b-link-stripe b-animate-go  thickbox">
							<img src="picture/${pho.photo}" alt=" " class="img-responsive" />
						</a>
						
					</div>
					</c:forEach>
				
					<div class="clearfix"> </div>
				</div>
					<!--script-->
						<script src="js/jquery.chocolat.js"></script>
							<link rel="stylesheet" href="css/chocolat.css" type="text/css" media="screen" charset="utf-8">
							<!--light-box-files-->
						<script type="text/javascript" charset="utf-8">
							$(function() {
								$('.gallery-grid a').Chocolat();
							});
						</script>
					<!--script-->
				<div class="msg-text-bottom">
					<div class="msg-text-bottom">
					
					<c:forEach items="${blog}" var="blog">
					<div class="col-md-4 msg-text-bottom-left">
						<figure class="effect-winston">
							<a href="/dcxy/singlephoto?phoid=${blog.id}"><img src="picture/${blog.photo}" alt=" " class="img-responsive" />
							<figcaption>
								
							</figcaption>	
							</a>
						</figure>
						<h3><a href="single.html">${blog.title}</a></h3>
						<p>${blog.details }</p>
					</div>
					</c:forEach>
					
					<div class="clearfix"> </div>
				</div>
					
					
					<div class="clearfix"> </div>
				</div>
			</div>
			<div class="clearfix"> </div>
			<div class="footer">
				<div class="footer-left">
					<ul>
						<li><a href="#">隐私政策</a>|</li>
						<li><a href="#">使用条款</a>|</li>
						<li><a href="mail.html">联系我们</a></li>
					</ul>
				</div>
				<div class="footer-right">
					<ul class="social-nav model-3">
						<li><a href="#" class="icon icon-border facebook"></a></li>
						<li><a href="#" class="icon icon-border twitter"></a></li>
						 <li><a href="#" class="icon icon-border googleplus"></a></li>
						 <li><a href="#" class="icon icon-border github"></a></li>
						 <li><a href="#" class="icon icon-border rss"></a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		</div>
	</div>
<!-- //banner-body -->
<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
</body>
</html>