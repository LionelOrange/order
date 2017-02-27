<%@page import="com.bean.OrderDetail"%>
<%@page import="com.db.PageModel"%>
<%@page import="com.bean.Orders"%>
<%@page import="com.serviceDao.DetailServiceDaoimpl"%>
<%@page import="com.serviceDao.DetailServiceDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DetailDoQuery.jsp' starting page</title>
    
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
    	String orderId=request.getParameter("orderId");
    	String detailCurrentPage=request.getParameter("detailCurrentPage");
    	if(detailCurrentPage==null||"".equals(detailCurrentPage)){
    		detailCurrentPage="1";
    	}
    	DetailServiceDao dao=new DetailServiceDaoimpl();
    	PageModel<OrderDetail> pageModel=dao.queryDetails(Integer.parseInt(detailCurrentPage),2,new Orders(orderId));
    	request.setAttribute("pageModel", pageModel);
    	request.setAttribute("orderId", orderId);
    	request.getRequestDispatcher("detailQuery.jsp").forward(request, response);
    %>
  </body>
</html>
