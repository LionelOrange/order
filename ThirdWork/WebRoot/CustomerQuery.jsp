<%@page import="com.bean.Customer"%>
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
  <a href="CustomerAdd.jsp">添加数据</a>
	<table class="ui selectable celled table" >
  <thead>
    <tr align="center">
      		<th>customerId</th>
			<th>customerName</th>
			<th>customerAdd</th>
			<th>customerBir</th>
			<th>customerTel</th>
			<th>action</th>
    </tr>
  </thead>
  <tbody>
    <%
			PageModel<Customer> pageModel=(PageModel<Customer>)request.getAttribute("pageModel");
			List<Customer> list=pageModel.getList();
			for(int i=0;i<list.size();i++){
				Customer customer=list.get(i);
				%>
				<tr align="center" height="35">
					<td class="positive"><%=customer.getCustomerId() %></td>
					<td class="warning"><%=customer.getCustomerName() %></td>
					<td class="negative"><%=customer.getCustomerAdd() %></td>
					<td class="positive"><%=customer.getCustomerBir() %></td>
					<td class="warning"><%=customer.getCustomerTel() %></td>
					<td><a href="CustomerFindByCustomerId.jsp?customerId=<%=customer.getCustomerId()%>">修改</a>/<a href="CustomerDoDelete.jsp?customerId=<%=customer.getCustomerId()%>" onclick="return confirm('要删除吗？')">删除</a></td>
				</tr>		
		<%
			}
		%>
  </tbody>
</table>
	<form action="CustomerDoQuery.jsp" method="post" id="searchForm">
		<input type="hidden" name="currentPage" id="currentPage"/>
	</form>
	<%@include file="page.jsp"%>
  </body>
</html>
