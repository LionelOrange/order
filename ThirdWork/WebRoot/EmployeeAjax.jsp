<%@page import="java.io.PrintWriter"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="com.serviceDao.EmployeeServiceDaoImpl"%>
<%@page import="com.serviceDao.EmployeeServiceDao"%>
<%@page import="com.bean.Employees"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <body>
    <%
    	request.setCharacterEncoding("UTF-8");
    	String empId=request.getParameter("empId");
    	EmployeeServiceDao dao=new EmployeeServiceDaoImpl();
    	Employees employee=dao.findByEmployeeId(Integer.parseInt(empId));
    	String jsonStr=null;
    	if(employee==null){
    		jsonStr="{\"empId\":\"0\"}";
    	}else{
    		jsonStr=JSON.toJSONString(employee);
    	}
    	PrintWriter wri=response.getWriter();
    	wri.write(jsonStr);
    	wri.flush();
    	wri.close();
    %>
  </body>
</html>
