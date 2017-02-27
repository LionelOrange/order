<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>  
  <body>
  	<script type="text/javascript">
		function f(v){
			var searchForm=document.getElementById("searchForm");
			document.getElementById("currentPage").value=v;
			searchForm.submit();
		}
	</script>
	<table width="100%">
		<tr>
			<td align="right">
				<a href="#" onclick="f(1);return false;">首页</a>
				<a href="#" onclick="f(${pageModel.pageUp()});return false;">上一页</a>
				<a href="#" onclick="f(${pageModel.pageDown()});return false;">下一页</a>
				<a href="#" onclick="f(${pageModel.lastPage()});return false;">尾页</a>
			</td>
		</tr>
	</table>
  </body>
</html>
