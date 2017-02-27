<%@page import="com.bean.Categorys"%>
<%@page import="com.db.PageModel"%>
<%@page import="com.serviceDao.ServiceDaoImpl"%>
<%@page import="com.serviceDao.ServiceDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doQuery.jsp' starting page</title>
    
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
		String currentPage=request.getParameter("currentPage");
		if(currentPage==null||"".equals(currentPage)){
			currentPage="1";
		}
		ServiceDao dao=new ServiceDaoImpl();
		PageModel<Categorys> pageModel=dao.queryCategorys(Integer.parseInt(currentPage),2);
		request.setAttribute("pageModel", pageModel);
		request.getRequestDispatcher("index.jsp").forward(request,response);
		
	%>
  </body>
</html>
