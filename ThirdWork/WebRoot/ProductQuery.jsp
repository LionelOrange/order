<%@page import="com.db.PageModel"%>
<%@page import="com.bean.Products"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<style type="text/css">
		a{
			text-decoration:none;
		}
	</style>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <link rel="stylesheet" type="text/css" href="js/semantic.css">
    <script type="text/javascript" src="js/semantic.js"></script>
  </head>
  
  <body>
  <h2 class="ui center aligned icon header">
    <i class="circular users icon"></i>
    Friends
	</h2>
    <a href="ProductAdd.jsp">添加数据</a></br>
	<table class="ui selectable celled table" >
  <thead>
    <tr align="center">
      		<th>productId</th>
			<th>productName</th>
			<th>incomePrice</th>
			<th>providerId</th>
			<th>salesPrice</th>
			<th>categoryId</th>
			<th>action</th>
    </tr>
  </thead>
  <tbody>
    <%
			PageModel<Products> pageModel=(PageModel<Products>)request.getAttribute("pageModel");
			List<Products> list=pageModel.getList();
			for(int i=0;i<list.size();i++){
				Products pr=list.get(i);
				%>
				<tr height="35" align="center">
					<td class="positive"><%=pr.getProductId() %></td>
					<td class="warning"><%=pr.getProductName() %></td>
					<td class="negative"><%=pr.getIncomePrice() %></td>
					<td class="positive"><%=pr.getProviderId() %></td>
					<td class="warning"><%=pr.getSalesPrice() %></td>
					<td class="warning"><%=pr.getCategoryId() %></td>
					<td><a href="ProductdoFindById.jsp?productId=<%=pr.getProductId()%>">修改</a>/<a href="ProductdoDelete.jsp?productId=<%=pr.getProductId()%>" onclick="return confirm('真要删除吗？');">删除</a></td>
				</tr>
		<%
			}
		%>
  </tbody>
</table>
	<form action="ProductDoQuery.jsp" method="post" id="searchForm">
		<input type="hidden" name="currentPage" id="currentPage"/>
	</form>
	<%@include file="page.jsp" %>
  </body>
</html>
