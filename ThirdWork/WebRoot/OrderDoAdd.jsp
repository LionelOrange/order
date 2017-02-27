<%@page import="com.serviceDao.OrderServiceDaoImpl"%>
<%@page import="com.serviceDao.OrderServiceDao"%>
<%@page import="com.bean.Products"%>
<%@page import="com.bean.OrderDetail"%>
<%@page import="com.bean.Employees"%>
<%@page import="com.bean.Customer"%>
<%@page import="com.bean.Orders"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'OrderDoAdd.jsp' starting page</title>
    
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
    	request.setCharacterEncoding("UTF-8");
    	String orderId=request.getParameter("orderId");
    	String orderDate=request.getParameter("orderDate");
    	String customerId=request.getParameter("customerId");
    	String empId=request.getParameter("empId");
    	String productId[]=request.getParameterValues("pno");
    	String quantity[]=request.getParameterValues("quantity");
    	Orders order=new Orders();
    	order.setOrderId(orderId);
    	order.setOrderDate(orderDate);
    	order.setCustomer(new Customer(Integer.parseInt(customerId)));
    	order.setEmployee(new Employees(Integer.parseInt(empId)));
    	Set<OrderDetail> set=new HashSet<OrderDetail>();
    	for(int i=0;i<productId.length;i++){
    		OrderDetail detail=new OrderDetail();
    		detail.setOrder(new Orders(orderId));
    		detail.setProduct(new Products(Integer.parseInt(productId[i])));
    		detail.setQuantity(Integer.parseInt(quantity[i]));
    		detail.setDiscount(0.9);
    		set.add(detail);
    	}
    	order.setSet(set);
    	OrderServiceDao dao=new OrderServiceDaoImpl();
    	dao.add(order);
    	response.sendRedirect("OrderDoQuery.jsp");
    %>
  </body>
</html>
