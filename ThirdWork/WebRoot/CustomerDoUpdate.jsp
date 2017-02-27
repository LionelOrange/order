<%@page import="com.serviceDao.CustomerServiceDaoImpl"%>
<%@page import="com.serviceDao.CustomerServiceDao"%>
<%@page import="com.bean.Customer"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CustomerDoUpdate.jsp' starting page</title>
    
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
    	request.setCharacterEncoding("utf-8");
    	Customer customer=new Customer();
	    customer.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
		customer.setCustomerName(request.getParameter("customerName"));
		customer.setCustomerAdd(request.getParameter("customerAdd"));
		customer.setCustomerBir(request.getParameter("customerBir"));
		customer.setCustomerTel(Integer.parseInt(request.getParameter("customerTel")));
		CustomerServiceDao dao=new CustomerServiceDaoImpl();
		dao.update(customer);
		response.sendRedirect("CustomerDoQuery.jsp");
    %>
  </body>
</html>
