<%@page import="com.bean.Products"%>
<%@page import="com.serviceDao.ProductServiceDaoImpl"%>
<%@page import="com.serviceDao.ProductServiceDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ProductdoFindById.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
		String productId=request.getParameter("productId");
		ProductServiceDao dao=new ProductServiceDaoImpl();
		Products product=dao.findByProductId(Integer.parseInt(productId));
		request.setAttribute("product", product);
		request.getRequestDispatcher("ProductUpdate.jsp").forward(request, response);
	%>
  </body>
</html>
