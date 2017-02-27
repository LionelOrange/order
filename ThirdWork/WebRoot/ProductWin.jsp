<%@page import="com.bean.Products"%>
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
	<table class="ui selectable celled table" >
  <thead>
    <tr align="center">
      		<th>productId</th>
    		<th>productName</th>
    		<th>salesPrice</th>
    </tr>
  </thead>
  <tbody>
	    <%
		PageModel<Products> pageModel=(PageModel<Products>)request.getAttribute("pageModel");
		List<Products> list=pageModel.getList();
		for(int i=0;i<list.size();i++){
			Products pr=list.get(i);
			%>
			<tr height="35" align="center">
				<td><%=pr.getProductId() %></td>
				<td><a href="#" onclick="fc(this);return false;" pno="<%=pr.getProductId() %>" pname="<%=pr.getProductName() %>" price="<%=pr.getSalesPrice() %>"><%=pr.getProductName() %></a></td>
				<td><%=pr.getSalesPrice() %></td>
			</tr>
	<%
		}
	%>
  </tbody>
</table>
	<script type="text/javascript">
		function f(v){
			var searchForm=document.getElementById("searchForm");
			document.getElementById("currentPage").value=v;
			searchForm.submit();
		}
	</script>
	<form action="DoProductWin.jsp" method="post" id="searchForm">
		<input type="hidden" name="currentPage" id="currentPage"/>
	</form>
	<table width="100%">
    	<tr>
    	<td align="right">
	    	<a href="#" onclick="f(1);return false;">首页</a>
			<a href="#" onclick="f(<%=pageModel.pageUp()%>);return false;">上一页</a>
	    	<a href="#" onclick="f(<%=pageModel.pageDown()%>);return false;">下一页</a>
	    	<a href="#" onclick="f(<%=pageModel.lastPage()%>);return false;">尾页</a>
    	</td>
    	</tr>
    </table>
    <script type="text/javascript">
  		function fc(v){
  			var pinWin=window.parent.dialogArguments;
  			var mytb=pinWin.document.getElementById("tb");
  			if(pinWin.repeat_(v.getAttribute("pno"))){
  				alert('不用重复');
  				return;
  			}
  			var newRow=mytb.insertRow();
  			
  			newRow.setAttribute("align","center");
  			var cell1=newRow.insertCell(0);
  			cell1.setAttribute("width","100");
  			cell1.innerHTML=v.getAttribute("pno")+'<input type="hidden" name="pno"  value="'+v.getAttribute("pno")+'"/>';
  			
  			var cell2=newRow.insertCell(1);
  			cell2.setAttribute("width","100");
  			cell2.innerHTML=v.getAttribute("pname")+'<input type="hidden" name="pname"  value="'+v.getAttribute("pname")+'"/>';
  			var cell3=newRow.insertCell(2);
  			cell3.setAttribute("width","100");
  			cell3.innerHTML=v.getAttribute("price")+'<input type="hidden" name="price"  value="'+v.getAttribute("price")+'"/>';
  			var cell4=newRow.insertCell(3);
  			cell4.setAttribute("width","100");
  			cell4.innerHTML='<a href="#" onclick="changeNum(this);return false;">-</a><input type="text" onblur="chart(this)" name="quantity" value="1" size="5" style="width:100px;height:30px;"/><a href="#" onclick="changeNum(this);return false;">+</a>';
  			var cell5=newRow.insertCell(4);
  			cell5.setAttribute("width","100");
  			cell5.innerHTML=v.getAttribute("price");
  			
  			var cell6=newRow.insertCell(5);
  			cell6.setAttribute("width","100");
  			cell6.innerHTML='<a href="#" onclick="remove_(this);return false">删除</a>';
  			
  			pinWin.sum_();
  		}
  </script>
  </body>
</html>
