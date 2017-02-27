<%@page import="com.bean.Provider"%>
<%@page import="com.db.PageModel"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  <a href="AddProvider.jsp">添加数据</a></br>
    <table class="ui selectable celled table" >
  <thead>
    <tr align="center">
      <th>ProviderId</th>
      <th>ProviderName</th>
      <th>ProviderAdd</th>
      <th>ProviderTel</th>
      <th>Account</th>
      <th>Email</th>
      <th>Action</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${pageModel.list}" var="pr">
    		<tr height="35" align="center">
    				<td class="positive">${pr.providerId}</td>
    				<td class="warning">${pr.providerName}</td>
    				<td class="negative">${pr.providerAdd}</td>
    				<td class="positive">${pr.providerTel}</td>
    				<td class="warning">${pr.account}</td>
    				<td class="warning">${pr.email}</td>
    				<td><a href="findByProviderId.jsp?providerId=${pr.providerId}">修改</a>/<a href="doProviderDelete.jsp?providerId=${pr.providerId}">删除</a></td>
    			</tr>
    	</c:forEach>
  </tbody>
</table>
    <form action="doProvider.jsp" method="post" id="searchForm">
    	<input type="hidden" name="currentPage" id="currentPage"/>
    </form>
    <%@include file="page.jsp"%>
  </body>
</html>
