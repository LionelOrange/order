<%@page import="java.io.PrintWriter"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="com.bean.Products"%>
<%@page import="com.serviceDao.ProductServiceDaoImpl"%>
<%@page import="com.serviceDao.ProductServiceDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  </head>
  <body>
    <%
    	request.setCharacterEncoding("UTF-8");
    	String productId=request.getParameter("productId");
    	ProductServiceDao dao=new ProductServiceDaoImpl();
    	Products product=dao.findByProductId(Integer.parseInt(productId));
    	String jsonStr=null;
    	if(product==null){
    		jsonStr="{\"productId\":\"0\"}";
    	}else{
    		jsonStr=JSON.toJSONString(product);
    	}
    	PrintWriter wri=response.getWriter();
    	wri.write(jsonStr);
    	wri.flush();
    	wri.close();
    %>
  </body>
</html>
