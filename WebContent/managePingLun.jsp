<%@ page language="java" contentType="text/html; charset=utf-8"   
 pageEncoding="utf-8"%>
 
 <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin Panel</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="js/clockp.js"></script>
<script type="text/javascript" src="js/clockh.js"></script> 
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddaccordion.js"></script>
<script type="text/javascript">
ddaccordion.init({
	headerclass: "submenuheader", //共享CSS类名的头部组
	contentclass: "submenu", //共享CSS类名称的内容组
	revealtype: "click", //在用户单击或onmouseover头时显示内容?有效值:“单击”、“clickgo”或“mouseover”
	mouseoverdelay: 200, //如果显示类型= " mouseover "，则在头扩展onMouseover之前设置毫秒
	collapseprev: true, //销毁之前的内容(所以在任何时候只有一个打开)?真/假
	defaultexpanded: [], //默认的(s)打开的内容索引[index1,index2,etc][]表示没有内容
	onemustopen: false, //指定至少一个标题应该是打开的(所以永远不要关闭所有的头)
	animatedefault: false, //默认的内容是否应该以动画的方式打开?
	persiststate: true, //在浏览器会话中保持开放内容的状态?
	toggleclass: ["", ""], //两个CSS类可以应用到头部，当它销毁和扩展时，分别是[" class1 "，" class2 "]
	togglehtml: ["suffix", "<img src='images/plus.gif' class='statusicon' />", "<img src='images/minus.gif' class='statusicon' />"], //额外的HTML添加到头，当它崩溃和扩展时，分别[“位置”，“html1”，“html2”](见文档)
	animatespeed: "fast", //动画的速度:整数的毫秒(即200)，或“快速”，“正常”，或“慢”
	oninit:function(headers, expandedindices){ //自定义代码运行时，头已被输入
		//do nothing
	},
	onopenclose:function(header, index, state, isuseractivated){ //在打开或关闭报头时要运行的自定义代码
		//do nothing
	}
})
</script>

<script type="text/javascript" src="jconfirmaction.jquery.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		$('.ask').jConfirmAction();
	});
	
</script>

<script language="javascript" type="text/javascript" src="niceforms.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="niceforms-default.css" />
<style type="">
#rounded-corner tr th{

}

</style>
</head>
<body>
<div id="main_container">

	<div class="header">
    <div class="logo"><a href="#"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>
    
    <div class="right_header">Welcome Admin, <a href="index">访问网站</a> | <a href="#" class="logout">Logout</a></div>
    <div id="clock_a"></div>
    </div>
    
    <div class="main_content">
    
                    <div class="menu">
                    <ul>
                    <li><a class="current" href="index">首页</a></li>
                    <li><a href="list.html">产品管理<!--[if IE 7]><!--></a><!--<![endif]-->
                    <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul>
                        <li><a href="/dcxy/allProduct" title="">查看所有产品</a></li>
                        <li><a href="/dcxy/vegetableProduct" title="">查看所有水果</a></li>
                        <li><a href="/dcxy/vegetableProduct" title="">查看所有蔬菜</a></li>
                        </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                    </li>
                    <li><a href="">管理用户<!--[if IE 7]><!--></a><!--<![endif]-->
                    <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul>
                        <li><a href="/dcxy/allUser" title="">查看所有用户</a></li>
                        </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                    </li>
                    <li><a href="">管理订单<!--[if IE 7]><!--></a><!--<![endif]-->
                    <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul>
                        <li><a href="" title="">查看所有订单</a></li>
                        <li><a href="" title="">Lorem ipsum dolor sit amet</a></li>
                        </ul>
                  
                    </li>

                    </ul>
                    </div> 
                    
                    
                    
                    
    <div class="center_content">  
    
    
    
    <div class="left_content">
    
    		
            <div class="sidebarmenu">
            
                <a class="menuitem submenuheader" href="">分类</a>
                <div class="submenu">
                    <ul>
                    <li><a href="/dcxy/allProduct">所有</a></li>
                    <li><a href="/dcxy/vegetableProduct">蔬菜</a></li>
                    <li><a href="/dcxy/fruitProduct">水果</a></li>
                   
                    </ul>
                </div>
               <a class="menuitem submenuheader" href="showAllLists" >查看评论</a>
               
 <!--    要复制的地方 -->
                <div class="submenu">
                    <ul>
                    <li><a href="showAllLists">查看所有评论</a></li>
                    </ul>
                </div>
 <!--   到这里结束 -->
                <a class="menuitem submenuheader" href="/dcxy/allProduct">添加新产品</a>
           
             
                
                <a class="menuitem_green" href="">Green button</a>
                
                <a class="menuitem_red" href="">Red button</a>
                    
            </div>
           
            
 
    
    </div>  
    
    <div class="right_content">            
      
    <h2>产品</h2> 
    <form  method="get" action="showAllLists">
    <input type="text" id="cid_input" name="cid"/>
      <input type="submit"value="搜索"/>          
    </form>
         
                    
<table id="rounded-corner" summary="2007 Major IT Companies' Profit">
    <thead>
    	<tr>
            <th scope="col" class="rounded">用户ID</th>
            <th scope="col" class="rounded">用户名</th>
            <th scope="col" class="rounded">商品号</th>
            <th scope="col" class="rounded">图片</th>
            <th scope="col" class="rounded">内容</th>
            <th scope="col" class="rounded">时间</th>
            
            <th scope="col" class="rounded">删除</th>
        </tr>
    </thead>
        <tfoot>
    	<tr>
        	<td colspan="6" class="rounded-foot-left"><em>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</em></td>
        	<td class="rounded-foot-right">&nbsp;</td>

        </tr>
    </tfoot>
    <tbody>
    <c:forEach items="${list}" var="eachlist">
    <tr>
        	<td>${eachlist.id }</td>
            <td>${eachlist.uname}</td>
            <td>${eachlist.cid}</td>
            <td><img src="Itempicture/${eachlist.pphoto }" alt="" style="width:40px;"/></td>
            <td>${eachlist.neirong}</td>
            <td>${eachlist.ptime}</td>
            <td><a href="deleteOneReark?id=${eachlist.id} " class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
        </tr>
        </c:forEach>
    <%-- <c:forEach items="${users}" var="user">
    	<tr>
        	<td></td>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.phone}</td>

          
            <td><a href="/dcxy/deleteUser?id=${user.id}" class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
        </tr>
</c:forEach> --%>
    </tbody>
</table>

	
     <hr />
    
  
      
     
     </div><!-- end of right content-->
            
                    
  </div>   <!--end of center content -->               
                    
                    
    
    
    <div class="clear"></div>
    </div> <!--end of main content-->
    
</div>		
</body>
</html>