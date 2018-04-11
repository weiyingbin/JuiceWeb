<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<table id="rounded-corner" summary="2007 Major IT Companies' Profit">
    <thead>
    	<tr>
        	<th scope="col" class="rounded-company"></th>
            <th scope="col" class="rounded">产品</th>
            <th scope="col" class="rounded">类型</th>
            <th scope="col" class="rounded">描述</th>
            <th scope="col" class="rounded">价格</th>
            <th scope="col" class="rounded">编辑</th>
            <th scope="col" class="rounded-q4">删除</th>
        </tr>
    </thead>
        <tfoot>
    	<tr>
        	<td colspan="6" class="rounded-foot-left"><em>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</em></td>
        	<td class="rounded-foot-right">&nbsp;</td>

        </tr>
    </tfoot>
     <tbody>
    
    	<tr>
        	<td><input type="checkbox" name="" /></td>
            <td>第一行</td>
            <td>第一行</td>
            <td>第一行</td>
            <td>第一行</td>

            <td><a href="#"><img src="images/user_edit.png" alt="" title="" border="0" /></a></td>
            <td><a href="#" class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
        </tr>

    </tbody>
    <c:forEach  items="${product}" var="pro">
    <tbody>
   
    	<tr>
        	<td><input type="checkbox" name="" /></td>
            <td>${pro.name}</td>
            <td>${pro.type}</td>
            <td>${pro.state}</td>
            <td>${pro.price}</td>

            <td><a href="#"><img src="images/user_edit.png" alt="" title="" border="0" /></a></td>
            <td><a href="#" class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
        </tr>

    </tbody>
    </c:forEach>
</table>
</body>
</html>