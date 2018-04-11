<%@page import="com.dcxy.data.Item"%>
<%@page import="org.hibernate.result.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta content="text/html;charset=utf-8" />
<meta content="text/html;charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>结算</title>
<!-- JqueryUI -->
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!-- Awesome font icons -->
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"
	media="screen">
<!-- Owlcoursel -->
<link rel="stylesheet" type="text/css"
	href="css/owl-coursel/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="css/owl-coursel/owl.transitions.css">
<!-- Magnific-popup -->
<link rel="stylesheet" type="text/css"
	href="css/magnific-popup/magnific-popup.css">
<!-- Style -->
<link rel="stylesheet" type="text/css" href="css/style.css"
	media="screen">
<!-- Fw -->
<link rel="stylesheet" type="text/css" href="css/fw.css" media="screen">
<script type="text/javascript">
	function Switch() {
		$('input[type=radio]').each(function(index, item) {
			if (this.checked == true) {
				$(payment).css("display", "block");
			} else {
				$(payment).css("display", "none");
			}
		});

	}
	function Switch2() {
		$('input[type=radio]').each(function(index, item) {
			if (this.checked == true) {
				$(payment).css("display", "none");
			} else {
				$(payment).css("display", "block");
			}
		});
	}
</script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	function IsNumeric(sText)

	{
		var ValidChars = "0123456789.";
		var IsNumber = true;
		var Char;

		for (i = 0; i < sText.length && IsNumber == true; i++) {
			Char = sText.charAt(i);
			if (ValidChars.indexOf(Char) == -1) {
				IsNumber = false;
			}
		}
		return IsNumber;

	};

	function calcProdSubTotal() {

		var prodSubTotal = 0;

		$(".row-total-input").each(function() {

			var valString = $(this).val() || 0;

			prodSubTotal += parseInt(valString);

		});

		$("#product-subtotal").val(prodSubTotal);

	};

	function calcTotalPallets() {

		var totalPallets = 0;

		$(".num-pallets-input").each(function() {

			var thisValue = $(this).val();

			if ((IsNumeric(thisValue)) && (thisValue != '')) {

				totalPallets += parseInt(thisValue);

			}
			;

		});

		$("#total-pallets-input").val(totalPallets);

	};

	function calcShippingTotal() {

		var totalPallets = $("#total-pallets-input").val() || 0;
		var shippingRate = $("#shipping-rate").text() || 0;
		var shippingTotal = totalPallets * shippingRate;

		$("#shipping-subtotal").val(shippingTotal);

	};

	function calcOrderTotal() {

		var orderTotal = 0;

		var productSubtotal = $("#product-subtotal").val() || 0;
		var shippingSubtotal = $("#shipping-subtotal").val() || 0;

		var orderTotal = parseInt(productSubtotal) + parseInt(shippingSubtotal);
		var orderTotalNice = "$" + orderTotal;

		$("#order-total").val(orderTotalNice);

	};

	$(function() {

		$('.num-pallets-input').blur(
				function() {

					var $this = $(this);

					var numPallets = $this.val();
					var multiplier = $this.parent().parent().find(
							"td.price-per-pallet span").text();

					if ((IsNumeric(numPallets)) && (numPallets != '')) {

						var rowTotal = numPallets * multiplier;

						$this.css("background-color", "white").parent()
								.parent().find("td.row-total input").val(
										rowTotal);

					} else {

						$this.css("background-color", "#ffdcdc");

					}
					;

					calcProdSubTotal();
					calcTotalPallets();
					calcShippingTotal();
					calcOrderTotal();

				});

	});
</script>
<style type="text/css">
table.gridtable {
	font-family: verdana, arial, sans-serif;
	font-size: 15px;
	color: #333333;
	border-width: 1px;
	border-color: #66FFFF;
	border-collapse: collapse;
}

table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #66FFFF;
	background-color: #dedede;
}

table.gridtable td {
	width: 400px;
	height: 60px;
	text-align: center;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #66FFFF;
}

table.gridtable input {
	width: 60px;
}
</style>
</head>

<body >
	<div class="preloader">
		<i class="fa fa-spinner"></i>
	</div>
	<c:import url="index-header.jsp"></c:import>
	<div class="heading-inner-page">
		<div class="container">
			<h2>结算</h2>
			<ul class="breadcrumb">
				<li><a href="index.jsp">主页</a></li>
				<li><a href="#">帐户 </a></li>
				<li>结算</li>
			</ul>
		</div>
	</div>
	<!-- Checkout -->
	<section>
		<div class="container">
			<div>
				<div id="content">
					<div class="panel-group">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="#collapse0" data-toggle="collapse"
										data-parent="#accordion" class="accordion-toggle collapsed"
										aria-expanded="false">步骤1：校验选项 <i class="fa fa-caret-down"></i>
									</a>
								</h4>
							</div>
							<div id="collapse0" class="panel-collapse collapse in"
								role="tabpanel">
								<div class="panel-body">
									<h1>您已登陆，请直接进行下一步</h1>
									<div class="row" id="cc" style="display: none;">
										<div class="col-sm-6">
											<div class="bore p-40 p-xs-20">
												<h3 class="title">新客户</h3>
												<p>
													<strong>创建账户 </strong>
												</p>
												<p>通过创建一个帐户，您将能够购物更快，最新的订单的状态，并跟踪您以前的订单。</p>
												<a href="#" class="btn ht-btn bg-6 m-t-20">继续 </a>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="bore p-40 p-xs-20">
												<h3 class="title">登陆</h3>
												<p>
													<strong>我是一个回头客</strong>
												</p>
												<form>
													<div class="form-group">
														<label class="control-label f-normal" for="input-email">电子邮件</label>
														<input type="text" name="email" value=""
															placeholder="电子邮件地址" id="input-email"
															class="form-control form-item">
													</div>
													<div class="form-group m-t-30">
														<label class="control-label f-normal" for="input-password">密码</label>
														<input type="password" name="password" value=""
															placeholder="请输入密码" id="input-password"
															class="form-control form-item"> <a
															class="f-normal m-b-30" href="#">忘记密码 </a>
													</div>
													<button type="submit" class="btn ht-btn bg-6 m-t-20">登陆</button>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--panel-->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="#collapse1" data-toggle="collapse"
										data-parent="#accordion" class="accordion-toggle collapsed"
										aria-expanded="false">步骤2：记帐细节 <i class="fa fa-caret-down"></i>
									</a>
								</h4>
							</div>
							<div id="collapse1" class="panel-collapse collapse"
								role="tabpanel">
								<div class="panel-body">
									<form class="form-horizontal">
										<div class="radio">
											<label> <input type="radio" name="payment_address"
												value="existing" checked="checked" onclick="Switch2()">
												我想使用现有的地址
											</label>
										</div>
										<div id="payment-existing">
											<select name="address_id"
												class="form-control form-item p-t-15">
												<option value="1" selected="selected">云南省昆明市西山区红塔东路2号</option>
											</select>
										</div>
										<div class="radio">
											<label> <input type="radio" name="payment_address"
												value="new" onclick="Switch()"> 我想用个新地址
											</label>
										</div>
										<br>
										<div id="payment" style="display: none;">
											<div class="form-group required">
												<label class="col-sm-2 control-label"
													for="input-payment-firstname">贵姓</label>
												<div class="col-sm-10">
													<input type="text" name="firstname" value=""
														placeholder="First Name" id="input-payment-firstname"
														class="form-control form-item">
												</div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label"
													for="input-payment-lastname">名字</label>
												<div class="col-sm-10">
													<input type="text" name="lastname" value=""
														placeholder="Last Name" id="input-payment-lastname"
														class="form-control form-item">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label"
													for="input-payment-company">单位</label>
												<div class="col-sm-10">
													<input type="text" name="company" value=""
														placeholder="Company" id="input-payment-company"
														class="form-control form-item">
												</div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label"
													for="input-payment-address-1">地址1 </label>
												<div class="col-sm-10">
													<input type="text" name="address_1" value=""
														placeholder="Address 1" id="input-payment-address-1"
														class="form-control form-item">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label"
													for="input-payment-address-2">地址2</label>
												<div class="col-sm-10">
													<input type="text" name="address_2" value=""
														placeholder="Address 2" id="input-payment-address-2"
														class="form-control form-item">
												</div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label"
													for="input-payment-city">City</label>
												<div class="col-sm-10">
													<input type="text" name="city" value="" placeholder="City"
														id="input-payment-city" class="form-control form-item">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label"
													for="input-payment-postcode">邮政编码 </label>
												<div class="col-sm-10">
													<input type="text" name="postcode" value=""
														placeholder="Post Code" id="input-payment-postcode"
														class="form-control form-item">
												</div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label"
													for="input-payment-country">国家 </label>
												<div class="col-sm-10">
													<select name="country_id" id="input-payment-country"
														class="form-control form-item">
														<option value="">请选择</option>
														<option value="0">名称 1</option>
														<option value="1">名称 2</option>
														<option value="2">名称 3</option>
														<option value="3">名称 4</option>
														<option value="4">名称 5</option>
														<option value="5">名称 6</option>
														<option value="6">名称 7</option>
														<option value="7">名称 8</option>
														<option value="8">名称 9</option>
														<option value="9">名称 10</option>
													</select>
												</div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label"
													for="input-payment-zone">地区/国家 </label>
												<div class="col-sm-10">
													<select name="zone_id" id="input-payment-zone"
														class="form-control">
														<option value="">请选择</option>
														<option value="0">名称 1</option>
														<option value="1">名称 2</option>
														<option value="2">名称 3</option>
														<option value="3">名称 4</option>
														<option value="4">名称 5</option>
														<option value="5">名称 6</option>
														<option value="6">名称 7</option>
														<option value="7">名称 8</option>
														<option value="8">名称 9</option>
														<option value="9">名称 10</option>
													</select>
												</div>
											</div>
										</div>
										<div class="buttons clearfix">
											<div class="pull-right">
												<button type="button" class="btn ht-btn bg-6">继续</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!--panel-->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="#collapse2" data-toggle="collapse"
										data-parent="#accordion" class="accordion-toggle collapsed"
										aria-expanded="false">步骤3：交货细节 <i class="fa fa-caret-down"></i>
									</a>
								</h4>
							</div>
							<div id="collapse2" class="panel-collapse collapse"
								role="tabpanel">
								<div class="panel-body">
									<form class="form-horizontal">
										<div class="radio">
											<label> <input type="radio" name="shipping_address"
												value="existing" checked="checked" onclick="Switch2()">
												我想使用现有的地址
											</label>
										</div>
										<div id="shipping-existing">
											<select name="address_id" class="form-control form-item">
												<option value="1" selected="selected">Nguyen
													Khiem,am, Dong Nai, Da Nang, Viet Nam</option>
											</select>
										</div>
										<div class="radio">
											<label> <input type="radio" name="shipping_address"
												value="new" onclick="Switch()"> 我想用个新地址
											</label>
										</div>
										<br>
										<div id="payment" style="display: none;">
											<div class="form-group required">
												<label class="col-sm-2 control-label"
													for="input-shipping-firstname">First Name</label>
												<div class="col-sm-10">
													<input type="text" name="firstname" value=""
														placeholder="First Name" id="input-shipping-firstname"
														class="form-control form-item">
												</div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label"
													for="input-shipping-lastname">Last Name</label>
												<div class="col-sm-10">
													<input type="text" name="lastname" value=""
														placeholder="Last Name" id="input-shipping-lastname"
														class="form-control form-item">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label"
													for="input-shipping-company">Company</label>
												<div class="col-sm-10">
													<input type="text" name="company" value=""
														placeholder="Company" id="input-shipping-company"
														class="form-control form-item">
												</div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label"
													for="input-shipping-address-1">Address 1</label>
												<div class="col-sm-10">
													<input type="text" name="address_1" value=""
														placeholder="Address 1" id="input-shipping-address-1"
														class="form-control form-item">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label"
													for="input-shipping-address-2">Address 2</label>
												<div class="col-sm-10">
													<input type="text" name="address_2" value=""
														placeholder="Address 2" id="input-shipping-address-2"
														class="form-control form-item">
												</div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label"
													for="input-shipping-city">City</label>
												<div class="col-sm-10">
													<input type="text" name="city" value="" placeholder="City"
														id="input-shipping-city" class="form-control form-item">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label"
													for="input-shipping-postcode">Post Code</label>
												<div class="col-sm-10">
													<input type="text" name="postcode" value="810000"
														placeholder="Post Code" id="input-shipping-postcode"
														class="form-control form-item">
												</div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label"
													for="input-shipping-country">Country</label>
												<div class="col-sm-10">
													<select name="country_id" id="input-shipping-country"
														class="form-control form-item">
														<option value="">Please Select</option>
														<option value="0">Name 1</option>
														<option value="1">Name 2</option>
														<option value="2">Name 3</option>
														<option value="3">Name 4</option>
														<option value="4">Name 5</option>
														<option value="5">Name 6</option>
														<option value="6">Name 7</option>
														<option value="7">Name 8</option>
														<option value="8">Name 9</option>
														<option value="9">Name 10</option>
													</select>
												</div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label"
													for="input-shipping-zone">Region / State</label>
												<div class="col-sm-10">
													<select name="zone_id" id="input-shipping-zone"
														class="form-control form-item">
														<option value="">Please Select</option>
														<option value="0">Name 1</option>
														<option value="1">Name 2</option>
														<option value="2">Name 3</option>
														<option value="3">Name 4</option>
														<option value="4">Name 5</option>
														<option value="5">Name 6</option>
														<option value="6">Name 7</option>
														<option value="7">Name 8</option>
														<option value="8">Name 9</option>
														<option value="9">Name 10</option>
													</select>
												</div>
											</div>
										</div>
										<div class="buttons clearfix">
											<div class="pull-right">
												<button type="button" class="btn ht-btn bg-6">Continue</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!--panel-->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="#collapse3" data-toggle="collapse"
										data-parent="#accordion" class="accordion-toggle collapsed"
										aria-expanded="false">步骤4：交货方式 <i class="fa fa-caret-down"></i></a>
								</h4>
							</div>
							<div id="collapse3" class="panel-collapse collapse"
								role="tabpanel">
								<div class="panel-body">
									<p>请选择此订单上使用的首选运输方法。</p>
									<p>
										<strong>扁平率 </strong>
									</p>
									<div class="radio">
										<label> <input type="radio" name="shipping_method"
											value="flat.flat" checked="checked"> 单位运费率- 5美元
										</label>
									</div>
									<p>
										<strong>添加关于订单的评论 </strong>
									</p>
									<p>
										<textarea name="comment" rows="8" class="form-control"></textarea>
									</p>
									<div class="buttons">
										<div class="pull-right">
											<button type="button" class="btn ht-btn bg-6">继续</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--panel-->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="#collapse4" data-toggle="collapse"
										data-parent="#accordion" class="accordion-toggle collapsed"
										aria-expanded="false">步骤5：付款方法 <i class="fa fa-caret-down"></i></a>
								</h4>
							</div>
							<div id="collapse4" class="panel-collapse collapse"
								role="tabpanel">
								<div class="panel-body">
									<p>请选择此订单上使用的首选付款方法。</p>
									<div class="radio">
										<label> <input type="radio" name="payment_method"
											value="cod" checked="checked"> 货到付款
										</label>
									</div>
									<p>
										<strong>添加关于订单的评论 </strong>
									</p>
									<p>
										<textarea name="comment" rows="8" class="form-control"></textarea>
									</p>
									<div class="buttons">
										<div class="pull-right">
											我已阅读并同意 <a href="#" class="agree"> <b>互联网交易协议</b>
											</a> <input type="checkbox" name="agree" value="1">
											<button type="button" class="btn ht-btn bg-6">继续</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--panel-->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="#collapse5" data-toggle="collapse"
										data-parent="#accordion" class="accordion-toggle collapsed"
										aria-expanded="false">步骤6：确认订单 <i class="fa fa-caret-down"></i>
									</a>
								</h4>
							</div>
							<div id="collapse5" class="panel-collapse collapse"
								role="tabpanel">
								<div class="panel-body">
									<div class="table-responsive">
										<!-- <form action="doDingDan.action" method="post"> -->
											<div>
												<div class="table-div">
													<div class="row m-0 table-content">

														<table id="order-table" class="gridtable">

															<tr style="background-color: #77DDFF;">
																<td><strong>图片</strong></td>
																<td><strong>产品名称</strong></td>
																<td><strong>分类</strong></td>
																<td><strong>数量</strong></td>
																<td><strong>单价</strong></td>
																<td><strong>总计</strong></td>
																<td><strong>操作</strong></td>
															</tr>
															<c:forEach items="${item}" var="item">
																<tr>
																	<input type="hidden" name="cid" value="${item.id}"> 
																	<td name="photo"><a href="#"><img
																			src="Itempicture/${item.photo}" width="70"
																			alt="image" id=photos></a></td>

																	<td name="cname"><a href="#">${item.name}</a></td>
																	<td>${item.type}</td>
																	<td class="num-pallets" name="number"><input type="text"
																		class="num-pallets-input"
																		id="num_${item.id}"></input></td>

																	<td class="price-per-pallet" name="price">$<span>${item.price}</span></td>

																	<td class="row-total"><input type="text"
																		class="row-total-input"  name="count"
																		id="turface-pro-league-row-total" disabled="disabled"></input>
																	</td>
																	<td><div class="col col-xs-2"><a href="/dcxy/deleteCartProduct?proId=${item.id}" class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></div>
													</td>
																</tr>
															</c:forEach>
														</table>


													</div>
													<div class="row">

														<div class="col-xs-5 pull-right">
															<div class="total table-div">
																<ul class="table-content">
																	<li>
																		<table id="shipping-table">
																			<tr>
																				<td>总数量</td>
																				<td>运费</td>
																				<td>总运费</td>
																			</tr>
																			<tr>
																				<td id="total-pallets"><input
																					id="total-pallets-input" type="text"
																					disabled="disabled"></input></td>

																				<td id="shipping-rate">10.00</td>

																				<td style="text-align: right;"><input
																					type="text" class="total-box"
																					id="shipping-subtotal" disabled="disabled"></input></td>
																			</tr>
																		</table>

																	</li>
																	<li><br></li>
																	<li><br></li>
																	<li class="row m-0">

																		<div class="col col-xs-6 text-right">
																			<strong class=" text-right">总价：</strong>
																		</div>
																		<div class="col col-xs-6">
																			<input type="text" class="total-box"
																				id="product-subtotal"
																				name="zongjia"></input>
																		</div>
																	</li>

																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="buttons m-t-30">
												<div class="pull-right">

													<input type="button" class="btn ht-btn bg-6" onclick="submit()" value="确认订单">
												</div>
											</div>
										<!-- </form> -->
									</div>

								</div>
							</div>
						</div>
						<!--/panel-->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Process order -->
	<section class="process">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4">
					<div class="media ht-media">
						<div class="media-left">
							<i class="fa fa-phone bg-6"></i>
						</div>
						<div class="media-body">
							<h5 class="media-heading">加盟 24/7: 0123-456-789</h5>
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
							<i class="fa fa-undo bg-6"></i>
						</div>
						<div class="media-body">
							<h5 class="media-heading">100%退款保证</h5>
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
	<script type="text/javascript">
		function submit(){
			var ids ="";
			var objs = document.getElementsByClassName("num-pallets-input");
			for(var i=0;i<objs.length;i++){
				var obj = objs[i];
				var id = obj.id.split("_")[1];
				var num = obj.value;
				ids +=id+":"+num+",";
			}
			ids = ids.substring(0,ids.length-1);
			
			location.href="/dcxy/doDingDan.action?ids="+ids;
		}
	</script>
</body>
</html>

