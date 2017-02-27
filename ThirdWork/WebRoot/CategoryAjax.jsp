<%@page import="java.io.PrintWriter"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="com.bean.Categorys"%>
<%@page import="com.serviceDao.ServiceDaoImpl"%>
<%@page import="com.serviceDao.ServiceDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  </head>
  <body>
    <%
    	request.setCharacterEncoding("UTF-8");
    	String categoryId=request.getParameter("categoryId");
    	ServiceDao dao=new ServiceDaoImpl();
    	Categorys category=dao.findByCategoryId(Integer.parseInt(categoryId));
    	String jsonStr=null;
    	if(category==null){
    		jsonStr="{\"categoryId\":\"0\"}";
    	}else{
    		jsonStr=JSON.toJSONString(category);
    	}
    	PrintWriter wri=response.getWriter();
    	wri.write(jsonStr);
    	wri.flush();
    	wri.close();
    %>
  </body>
</html>
