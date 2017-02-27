<%@page import="java.io.PrintWriter"%>
<%@page import="com.alibaba.fastjson.JSON"%>
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
    
    <title>My JSP 'doCustomerAjax.jsp' starting page</title>
    
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
    	String customerName=request.getParameter("customerName");
    	CustomerServiceDao dao=new CustomerServiceDaoImpl();
    	Customer customer=dao.findByCustomerName(customerName);
    	String jsonStr=null;
    	if(customer==null){
    		jsonStr="{\"customerId\":\"0\"}";
    	}else{
    		jsonStr=JSON.toJSONString(customer);
    	}
    	PrintWriter wri=response.getWriter();
    	wri.write(jsonStr);
    	wri.flush();
    	wri.close();
    %>
  </body>
</html>
