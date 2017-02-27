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
    
    <title>My JSP 'doProviderUpdate.jsp' starting page</title>
    
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
		String providerId=request.getParameter("providerId");
		String providerName=request.getParameter("providerName");
		String providerAdd=request.getParameter("providerAdd");
		String providerTel=request.getParameter("providerTel");
		String account=request.getParameter("account");
		String email=request.getParameter("email");
		Provider pr=new Provider();
		pr.setProviderId(Integer.parseInt(providerId));
		pr.setProviderName(providerName);
		pr.setProviderAdd(providerAdd);
		pr.setProviderTel(Integer.parseInt(providerTel));
		pr.setAccount(account);
		pr.setEmail(email);
		ProviderServiceDao dao=new ProviderServiceDaoImpl();
		dao.update(pr);
		response.sendRedirect("doProvider.jsp");
	%>
  </body>
</html>
