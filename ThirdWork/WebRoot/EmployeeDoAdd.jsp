<%@page import="com.serviceDao.EmployeeServiceDaoImpl"%>
<%@page import="com.serviceDao.EmployeeServiceDao"%>
<%@page import="com.bean.Employees"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'EmployeeDoAdd.jsp' starting page</title>
    
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
    	Employees employee=new Employees();
    	employee.setEmpId(Integer.parseInt(request.getParameter("empId")));
    	employee.setEmpName(request.getParameter("empName"));
    	employee.setHireDate(request.getParameter("hireDate"));
    	employee.setSal(Integer.parseInt(request.getParameter("sal")));
    	employee.setPsw(Integer.parseInt(request.getParameter("psw")));
    	EmployeeServiceDao dao=new EmployeeServiceDaoImpl();
    	dao.add(employee);
    	response.sendRedirect("EmployeeDoQuery.jsp");
    %>
  </body>
</html>
