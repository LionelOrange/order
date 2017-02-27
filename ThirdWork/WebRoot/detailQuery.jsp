<%@page import="com.bean.OrderDetail"%>
<%@page import="com.db.PageModel"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <link rel="stylesheet" type="text/css" href="js/semantic.css">
    <script type="text/javascript" src="js/semantic.js"></script>
	<style type="text/css">
		a{
			text-decoration:none;
		}
	</style>
  </head>
  
  <body>
    <h2 class="ui center aligned icon header">
    <i class="circular users icon"></i>
    Friends
	</h2>
  	<center><h1>订单编号<%=(String)request.getAttribute("orderId") %>明细表</h1></center>
    <table class="ui selectable celled table" >
  <thead>
    <tr align="center">
      		<th>产品ID</th>
    		<th>产品名称</th>
    		<th>数量</th>
    		<th>折扣</th>
    </tr>
  </thead>
  <tbody>
    <%
    		PageModel<OrderDetail> pageModel=(PageModel<OrderDetail>)request.getAttribute("pageModel");
    		List<OrderDetail> list=pageModel.getList();
    		for(int i=0;i<list.size();i++){
    			OrderDetail detail=list.get(i);
    		%>
    			<tr align="center" height="35">
    				<td class="positive"><%=detail.getProduct().getProductId() %></td>
    				<td class="warning"><%=detail.getProduct().getProductName() %></td>
    				<td class="negative"><%=detail.getQuantity() %></td>
    				<td class="positive"><%=detail.getDiscount() %></td>
    			</tr>
    	<%
    		}
    	%>
  </tbody>
</table>
    <form action="DetailDoQuery.jsp?orderId=<%=(String)request.getAttribute("orderId") %>" method="post" id="searchForm">
    	<input type="hidden" name="detailCurrentPage" id="detailCurrentPage"/>
    </form>
    <%@include file="page.jsp"%>
  </body>
</html>
