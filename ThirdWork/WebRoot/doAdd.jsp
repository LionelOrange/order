<%@page import="com.serviceDao.ServiceDaoImpl"%>
<%@page import="com.serviceDao.ServiceDao"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.bean.Categorys"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doAdd.jsp' starting page</title>
    
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
		Categorys category=new Categorys();
		category.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
		category.setCategoryName(request.getParameter("categoryName"));
		category.setCategoryDesc(request.getParameter("categoryDesc"));
		ServiceDao dao=new ServiceDaoImpl();
		dao.save(category);
		response.sendRedirect("doQuery.jsp");
	%>
  </body>
</html>