<%@page import="com.bean.Employees"%>
<%@page import="com.serviceDao.EmployeeServiceDaoImpl"%>
<%@page import="com.serviceDao.EmployeeServiceDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'EmployeeFindByEmpId.jsp' starting page</title>
    
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
		String empId=request.getParameter("empId");
		EmployeeServiceDao dao=new EmployeeServiceDaoImpl();
		Employees employee=dao.findByEmployeeId(Integer.parseInt(empId));
		request.setAttribute("employee", employee);
		request.getRequestDispatcher("EmployeeUpdate.jsp").forward(request, response);
	%>
  </body>
</html>
