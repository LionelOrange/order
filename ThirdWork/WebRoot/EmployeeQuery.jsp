<%@page import="com.bean.Employees"%>
<%@page import="com.db.PageModel"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <link rel="stylesheet" type="text/css" href="js/semantic.css">
    <script type="text/javascript" src="js/semantic.js"></script>
	<style type="text/css">
		a{
			text-decoration:none;
		}
	</style>
  </head>
  
  <body>
  <h2 class="ui center aligned icon header">
    <i class="circular users icon"></i>
    Friends
	</h2>
    <a href="EmployeeAdd.jsp">添加数据</a>
	<table class="ui selectable celled table" >
  <thead>
    <tr align="center">
      		<th>empId</th>
			<th>empName</th>
			<th>hireDate</th>
			<th>sal</th>
			<th>psw</th>
			<th>action</th>
    </tr>
  </thead>
  <tbody>
    <%	
			PageModel<Employees> pageModel=(PageModel<Employees>)request.getAttribute("pageModel");
			List<Employees> list=pageModel.getList();
			for(int i=0;i<list.size();i++){
				Employees employee=list.get(i);
				%>
				<tr height="35" align="center">
					<td class="positive"><%=employee.getEmpId() %></td>
					<td class="warning"><%=employee.getEmpName() %></td>
					<td class="negative"><%=employee.getHireDate() %></td>
					<td class="positive"><%=employee.getSal() %></td>
					<td class="warning"><%=employee.getPsw() %></td>
					<td><a href="EmployeeFindByEmpId.jsp?empId=<%=employee.getEmpId()%>">修改</a>/<a href="EmployeeDoDelete.jsp?empId=<%=employee.getEmpId()%>" onclick="return confirm('要删除吗？')">删除</a></td>
				</tr>		
		<%
			}
		%>
  </tbody>
</table>
	<form action="EmployeeDoQuery.jsp" method="post" id="searchForm">
		<input type="hidden" name="currentPage" id="currentPage"/>
	</form>
	<%@include file="page.jsp"%>
  </body>
</html>
