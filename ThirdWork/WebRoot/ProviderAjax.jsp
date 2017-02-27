<%@page import="java.io.PrintWriter"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="com.bean.Provider"%>
<%@page import="com.serviceDao.ProviderServiceDaoImpl"%>
<%@page import="com.serviceDao.ProviderServiceDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  </head>
  <body>
    <%
    	request.setCharacterEncoding("UTF-8");
    	String providerId=request.getParameter("providerId");
    	ProviderServiceDao dao=new ProviderServiceDaoImpl();
    	Provider provider=dao.findByProviderId(Integer.parseInt(providerId));
    	String jsonStr=null;
    	if(provider==null){
    		jsonStr="{\"providerId\":\"0\"}";
    	}else{
    		jsonStr=JSON.toJSONString(provider);
    	}
    	PrintWriter wri=response.getWriter();
    	wri.write(jsonStr);
    	wri.flush();
    	wri.close();
    %>
  </body>
</html>
