<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="com.alibaba.fastjson.JSON"%>
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
    
    <title>My JSP 'doLogin.jsp' starting page</title>
    
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
    	String empName=request.getParameter("userName");
    	String psw=request.getParameter("password");
    	String str="[0-9]{1,}";
    	Pattern pattern=Pattern.compile(str);
    	Matcher matcher=pattern.matcher(psw);
    	if(!matcher.matches()){
    		response.sendRedirect("Login.jsp");
    		return;
    	}
    	EmployeeServiceDao dao=new EmployeeServiceDaoImpl();
    	Employees emp=dao.login(empName,Integer.parseInt(psw));
		String path1;
    	if(emp!=null&&(emp.getEmpName()!=null)){
			session.setAttribute("emp", emp);
			path1="Sum.jsp";
		}else{
			path1="Login.jsp";
		}
    	response.sendRedirect(path1);
    %>
  </body>
</html>
