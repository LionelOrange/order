<%@page import="com.serviceDao.ProviderServiceDaoImpl"%>
<%@page import="com.serviceDao.ProviderServiceDao"%>
<%@page import="com.bean.Provider"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doAddProvider.jsp' starting page</title>
    
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
		Provider pr=new Provider();
		pr.setProviderId(Integer.parseInt(request.getParameter("providerId")));
		pr.setProviderName(request.getParameter("providerName"));
		pr.setProviderAdd(request.getParameter("providerAdd"));
		pr.setProviderTel(Integer.parseInt(request.getParameter("providerTel")));
		pr.setAccount(request.getParameter("account"));
		pr.setEmail(request.getParameter("email"));
		ProviderServiceDao dao=new ProviderServiceDaoImpl();
		dao.save(pr);
		response.sendRedirect("doProvider.jsp");
	%>
  </body>
</html>
