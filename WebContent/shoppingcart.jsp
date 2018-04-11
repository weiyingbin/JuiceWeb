
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/mycart.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购物车</title>

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/shoppingcart.js"></script>
<script type="text/javascript">
function addNum(obj,uid,gid){
	var number=$(obj).prev().val();
	number++;
	 var url ="buy.jsp?op=update&gid="+gid+"&uid="+uid+"&num="+number+"";
	 window.location = url; 
}
function reduceNum(obj,gid,uid){
	var number=$(obj).next().val();
	number--;
	 var url ="buy.jsp?op=update&gid="+gid+"&uid="+uid+"&num="+number+"";
	 window.location = url; 
}
function clearcart(uid) {
	var url ="buy.jsp?op=clear&uid="+uid+"";
    window.location = url;
}
function delcart(uid,gid) {
	var url ="buy.jsp?op=del&uid="+uid+"&gid="+gid+"";
    window.location = url;
}
function change(uid,gid,state) {
	var url ="buy.jsp?op=change&uid="+uid+"&gid="+gid+"&state="+state+"";
    window.location = url;
}
function chooseall(uid) {
	var url ="buy.jsp?op=chooseall&uid="+uid+"";
	window.location = url;
}
</script>
</head>
<body>
	<div id="box">
		<div id="goods_box">
			<div class="imfor_box">
				
				<div class="check_box">
					<input type="checkbox" id="all" onclick="chooseall()">全选
				</div>
				
				<div class="check_box">
					<input type="checkbox" id="all" onclick="chooseall()">全选
				</div>
				
				<div class="pudc_top">商品</div>
				<div class="pices_top">单价</div>
				<div class="num_top">数量</div>
				<div class="totle_top">小计</div>
				<div class="del_top">操作</div>
			</div>
			
			<div class="fail"
				style="width: 400px; color: darkturquoise; font-size: 30px; margin-left: 30%;">购物车空空的，快去选购吧!</div>
			
			
			<div class="imfor" id="imfor">
				<div class="check" id="check">
					
					<input type="checkbox" class="Each" id="choose"
						onclick="change()" />
				</div>
				<div class="pudc">
					<img src="" /><span></span>
				</div>
				<div class="pices"></div>
				<div class="num">
					<span class="reduc" onclick="reduceNum(this,)">&nbsp;-&nbsp;</span><input
						class="numbers" type="text" value=""
						readonly="readonly"><span class="add" 
						onclick="addNum(this,)">&nbsp;+&nbsp;</span>
				</div>
				<div class="totle"></div>
				<div class="del" onclick="delcart()">删除</div>
			</div>
			
		</div>
		<div class="foot">
			<input type="hidden" name="uid" value="null"></input>
			<div class="foot_del" onclick="clearcart(null)">清空购物车</div>
			<div class="foot_page">
				<a href="#">继续购物</a>
			</div>
			<div class="foot_tol">
				<span>合计：￥</span><span id="susum"></span>
			</div>
			<div class="foot_cash">提交订单</div>
		</div>
		
		
		
	</div>
</body>
</html>