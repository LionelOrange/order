<%@page import="com.serviceDao.CustomerServiceDaoImpl"%>
<%@page import="com.serviceDao.CustomerServiceDao"%>
<%@page import="com.bean.Customer"%>
<%@page import="com.db.PageModel"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CustomerDoQuery.jsp' starting page</title>
    
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
    	String currentPage=request.getParameter("currentPage");
    	if(currentPage==null||"".equals(currentPage)){
    		currentPage="1";
    	}
    	CustomerServiceDao dao=new CustomerServiceDaoImpl();
    	PageModel<Customer> pageModel=dao.queryCustomer(Integer.parseInt(currentPage),2);
    	request.setAttribute("pageModel", pageModel);
    	request.getRequestDispatcher("CustomerQuery.jsp").forward(request, response);
    %>
  </body>
</html>
