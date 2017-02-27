<%@page import="com.bean.Orders"%>
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
  	<a href="OrderAdd.jsp">添加订单</a>
    <table class="ui selectable celled table" >
  <thead>
    <tr align="center">
      		<th>订单编号</th>
    		<th>订单日期</th>
    		<th>顾客</th>
    		<th>员工</th>
    		<th>action</th>
    </tr>
  </thead>
  <tbody>
    <%
    		PageModel<Orders> pageModel=(PageModel<Orders>)request.getAttribute("pageModel");
    		List<Orders> list=pageModel.getList();
    		for(int i=0;i<list.size();i++){
    			Orders order=list.get(i);
    		%>
    			<tr align="center" height="35">
    				<td class="positive"><%=order.getOrderId() %></td>
    				<td class="warning"><%=order.getOrderDate() %></td>
    				<td class="negative"><%=order.getCustomer().getCustomerName() %></td>
    				<td class="positive"><%=order.getEmployee().getEmpName() %></td>
    				<td><a href="DetailDoQuery.jsp?orderId=<%=order.getOrderId()%>">查看明细</a></td>
    			</tr>
    	<%
    		}
    	%>
  </tbody>
</table>
    <form action="OrderDoQuery.jsp" method="post" id="searchForm">
    	<input type="hidden" name="currentPage" id="currentPage"/>
    </form>
    <%@include file="page.jsp"%>
  </body>
</html>
