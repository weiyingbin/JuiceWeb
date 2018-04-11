<!DOCTYPE jsp PUBLIC "-//W3C//DTD jsp 4.01 Transitional//EN">
<%@ page language="java" contentType="text/jsp; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header>
	<div class="container">
		<div class="row top-header">
			<div class="col-sm-3 text-left">
				<a href="#" class="logo">
					<img src="images/logo.png" alt="logo">
				</a>
			</div>				
			<div class="col-sm-9">
				<ul class="top-link pull-right">
					<li class="hidden-xs"><a href="allCart">购物清单</a></li>
					<li class="hidden-xs"><a href="product_checkout.jsp">结帐</a></li>
					<li class="dropdown hidden-xs">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" id="dropdownMenu1" aria-haspopup="true" aria-expanded="false">我的账户 <span class="caret"></span></a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							<li><a href="login.jsp">登录</a></li>
							<li><a href="register.jsp">注册</a></li>
							<li><a href="loginout">注销</a></li>
							<li><a href="#">邮箱：${sessionScope.email}</a></li>
						</ul>
					</li>
					
				
			</div>
		</div>
	</div>
	<div class="container">
		<div class="bg-mn color-inher">
			<div class="row m-0">
				<div class="col-sm-1 col-md-1 col-lg-2 p-0">
					<div class="dropdown category-bar">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">
							<i class="fa fa-bars"></i><span>分类</span>
						</a>
						<ul class="dropdown-menu display-block hidden-xs">
							<li><a href="/dcxy/vegetable"><span><img src="images/25.jpg" width="50" alt="image"></span>蔬菜</a></li>
							<li><a href="/dcxy/fruit"><span><img src="images/20.jpg" width="50" alt="image"></span>水果</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-8 col-md-8 col-lg-7 p-0">
					<div class="main-menu">
						<nav class="navbar navbar-default menu">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed m-r-xs-15" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
									<span class="sr-only">导航</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
							</div>
							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav"> 
									<li><a href="index">主页</a></li>
									<li><a href="mopwd.jsp">修改密码</a></li>
									<li><a href="zijipinglun">查看评论</a></li>
									<li><a href="selectUser">个人中心</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>	
				<div class="col-sm-3 col-md-3 col-lg-3 p-0">
				<form action="select.action"  method="post">
					<div class="search-box m-l-xs-15 m-r-xs-15">
						<input type="text" name="selectproduct" class="form-item" placeholder="Search...">
						<button type="submit" class="fa fa-search"></button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</header>