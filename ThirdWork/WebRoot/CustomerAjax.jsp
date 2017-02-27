<%@page import="java.io.PrintWriter"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="com.bean.Customer"%>
<%@page import="com.serviceDao.CustomerServiceDaoImpl"%>
<%@page import="com.serviceDao.CustomerServiceDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  </head>
  <body>
    <%
    	request.setCharacterEncoding("UTF-8");
    	String customerId=request.getParameter("customerId");
    	CustomerServiceDao dao=new CustomerServiceDaoImpl();
    	Customer customer=dao.findByCustomerId(Integer.parseInt(customerId));
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
