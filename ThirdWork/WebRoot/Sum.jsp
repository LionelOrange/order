<%@page import="com.bean.Employees"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  		<link rel="stylesheet" type="text/css" href="js/semantic.css">
    <script type="text/javascript" src="js/semantic.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
  </head>
  
  <body>
  <%
  	Employees emp=(Employees)session.getAttribute("emp");
  	if(emp==null){
  		response.sendRedirect("Login.jsp");
  		return;
  	}
  %>
    <table width="100%" height="100%">
		<tr>
			<td colspan="2" height="90">
			&nbsp;&nbsp;<h2 class="ui header" style="position:relative;margin-left:20px;">
		    <img src="js/cc1.jpg" class="ui circular image">
			    欢迎<%=emp.getEmpName() %>到来
			</h2>
			</td>
		</tr>
		<tr>
			<td valign="top" align="center" height="100%" width="18%"></br>
			<div class="ui vertical menu">
			    <a href="doQuery.jsp" target="right" class="item">
			        	类别管理
			    </a>
			    <a href="doProvider.jsp" target="right" class="item">
			       	 供应商管理
			    </a>
			    <a href="ProductDoQuery.jsp" target="right" class="item">
			        	产品管理
			    </a>
			    <a href="EmployeeDoQuery.jsp" target="right" class="item">
			        	员工管理
			    </a>
			    <a href="CustomerDoQuery.jsp" target="right" class="item">
			        	顾客管理
			    </a>
			    <a href="OrderDoQuery.jsp" target="right" class="item">
			        	订单管理
			    </a>
			</div>
			</td>
			<td>
				<iframe src="doQuery.jsp" name="right" width="100%" height="100%"/>
			</td>
		</tr>
	</table>
  </body>
</html>
