<%@page import="com.bean.Provider"%>
<%@page import="com.serviceDao.ProviderServiceDaoImpl"%>
<%@page import="com.serviceDao.ProviderServiceDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'findByProviderId.jsp' starting page</title>
    
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
		String providerId=request.getParameter("providerId");
		ProviderServiceDao dao=new ProviderServiceDaoImpl();
		Provider provider=dao.findByProviderId(Integer.parseInt(providerId));
		request.setAttribute("provider", provider);
		request.getRequestDispatcher("providerUpdate.jsp").forward(request, response);
	%>
  </body>
</html>
