<%@page import="com.bean.Categorys"%>
<%@page import="com.db.PageModel"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
  <a href="Add.jsp">添加数据</a></br>
	<table class="ui selectable celled table" >
  <thead>
    <tr align="center">
      <th>categoryId</th>
      <th>categoryName</th>
      <th>categoryDesc</th>
      <th>action</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${pageModel.list}" var="category">
			<tr align="center">
					<td class="positive">${category.categoryId}</td>
					<td class="warning">${category.categoryName}</td>
					<td class="negative">${category.categoryDesc}</td>
					<td class="positive"><a href="doFindByCategoryId.jsp?categoryId=${category.categoryId}">修改</a>/<a href="doDelete.jsp?categoryId=${category.categoryId}" onclick="return confirm('真要删除吗？');">删除</a></td>
				</tr>
		</c:forEach>
  </tbody>
</table>
	<form action="doQuery.jsp" method="post" id="searchForm">
		<input type="hidden" name="currentPage" id="currentPage"/>
	</form>
	<%@include file="page.jsp"%>
  </body>
  
</html>
