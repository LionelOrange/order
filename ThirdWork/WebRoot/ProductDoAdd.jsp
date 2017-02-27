<%@page import="com.bean.Categorys"%>
<%@page import="com.serviceDao.ProviderServiceDaoImpl"%>
<%@page import="com.serviceDao.ProviderServiceDao"%>
<%@page import="com.serviceDao.ServiceDao"%>
<%@page import="com.serviceDao.ServiceDaoImpl"%>
<%@page import="com.serviceDao.ProductServiceDaoImpl"%>
<%@page import="com.serviceDao.ProductServiceDao"%>
<%@page import="com.bean.Provider"%>
<%@page import="com.bean.Products"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ProductDoAdd.jsp' starting page</title>
    
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
	    String providerName=request.getParameter("providerName");
		String categoryName=request.getParameter("categoryName");
		ServiceDao caDao=new ServiceDaoImpl();
		ProviderServiceDao providerDao=new ProviderServiceDaoImpl();
		Categorys cat=caDao.findByCategoryName(categoryName);
		Provider pro=providerDao.findByProviderName(providerName);
    	Products pr=new Products();
    	pr.setProductId(Integer.parseInt(request.getParameter("productId")));
    	pr.setProductName((String)request.getParameter("productName"));
    	pr.setIncomePrice(Integer.parseInt(request.getParameter("incomePrice")));
    	pr.setProviderId(pro.getProviderId());
    	pr.setSalesPrice(Integer.parseInt(request.getParameter("salesPrice")));
    	pr.setCategoryId(cat.getCategoryId());
    	ProductServiceDao dao=new ProductServiceDaoImpl();
    	dao.save(pr);
    	response.sendRedirect("ProductDoQuery.jsp");
    %>
  </body>
</html>
