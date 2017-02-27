<%@page import="com.bean.Employees"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <style>
        .field{
            width: 200px;
        }
        form{
            text-align: center;
        }
        input[type="submit"] {border:none;background:none;cursor:pointer;}
    </style>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <link rel="stylesheet" type="text/css" href="js/semantic.css">
    <script type="text/javascript" src="js/semantic.js"></script>
    <script type="text/javascript">
		$(function(){
    		$('#orderDate').blur(function(){
    			if(!( /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/.test($('#orderDate').val()))){
    				$('.high2').text("按xxxx-xx-xx格式输入");
    			}else{
    				$('.high2').text("");
    			}
    		});
    		$('form').submit(function(){
    			if($('#orderDate').val()==''||$('#customerName').val()==''||($('#tb tr').index()==-1)){
    				alert('有一项没输入！');
    				return false;
    			}
    			else if(($('strong').text()==''||$('#ts').text=='')){
    				return true;
    			}else{
    				return false;
    			}
    		});
		});
		</script>
  </head>
  <body>
	<script type="text/javascript">
		var xmlHttp;
		function createXmlHttpRequest(){
			if(window.ActiveXObject){
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}else{
				xmlHttp=new XMLHttpRequest();
			}
		}
		function sendGet(){
			createXmlHttpRequest();
			var customerName=document.getElementById("customerName").value;
			var url="doCustomerAjax.jsp";
			var data="customerName="+customerName;
			xmlHttp.open("post", url, true);
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlHttp.onreadystatechange=readyStateChange;
			xmlHttp.send(data);
		}
		function readyStateChange(){
			if(xmlHttp.readyState==4){
				if(xmlHttp.status==200){
					var text=xmlHttp.responseText;
					var jso=eval('('+text+')');
					if(jso.customerId=='0'){
						document.getElementById("customerName").value="";
						document.getElementById("ts").firstChild.nodeValue="name error";
					}else{
						document.getElementById("customerId").value=jso.customerId;
						document.getElementById("ts").firstChild.nodeValue="";
					}
				}
			}
		}
	</script>
	<%
    				Date date=new Date();
    				String orderId=date.getTime()+"";
    				Employees emp=(Employees)session.getAttribute("emp");
    			%>
    <form class="ui form segment" action="OrderDoAdd.jsp" method="post">
    	<h1>添加订单</h1>
         <div class="two fields">
        <div class="field" style="margin:0 auto;text-align: center;">
        	订单编号:<label><%=orderId%></label><input type="hidden" name="orderId" value="<%=orderId%>"/>
        </div>
        <div class="field" style="margin:0 auto;text-align: center;">
            <label>员工:</label>
            <label id="employee" name="employee"><%=emp.getEmpName() %></label><input type="hidden" name="empId" value="<%=emp.getEmpId()%>"/>		
        </div></div><br>
        <div class="two fields">
        <div class="field" style="margin:0 auto;text-align: center;">
            <label>顾客：</label>
            <input type="text" name="customerName" id="customerName" onblur="sendGet();"/>
    				<input type="hidden" name="customerId" id="customerId"/>
    				<label id="ts">&nbsp;</label>
        </div>
        <div class="field" style="margin:0 auto;text-align: center;">
            	订单日期：<input type="text" name="orderDate" id="orderDate"/><strong class="high2" style="color:red"></strong>
        </div>
        </div>
        	<a href="#" onclick="f();return false;">选择产品</a><br>
        	总价：<label id="total">&nbsp;</label><br>
    	<table class="ui selectable celled table" >
  <thead>
    <tr align="center">
      		<th>产品编号</th>
    		<th>产品名称</th>
    		<th>产品单价</th>
    		<th>产品数量</th>
    		<th>小计</th>
    		<th>action</th>
    </tr>
  </thead>
  <tbody id="tb">
  </tbody>
</table>
    			<div class="ui primary submit button" style="margin:0 auto" id="sub"><input type="submit" value="添加"/><strong id="sr"class="high3" style="color:red"></strong></div>
    </form>
  </body>
</html>
<script type="text/javascript">
	function f(){
		showModalDialog("ifr.jsp",window,"dialogWidth:400px;dialogHeight:400px;");
	}
	function chart(v){
		var row=v.parentNode.parentNode;
		var va=row.cells[3].childNodes[1].value;
		if(!(/^[0-9]{1,10}$/.test(va))){
			alert('别调皮！');
			row.cells[3].childNodes[1].value=1;
		}
		var price=parseInt(row.cells[2].firstChild.nodeValue);
		var num=parseInt(row.cells[3].childNodes[1].value);
		row.cells[4].firstChild.nodeValue=price*num;
		sum_();
	}
	function changeNum(v){
		var row=v.parentNode.parentNode;
		var op=v.firstChild.nodeValue;
		
		var price=parseInt(row.cells[2].firstChild.nodeValue);
		var num=parseInt(row.cells[3].childNodes[1].value);
		if('+'==op){
			num++;
		}else{
			
			if(num<=1){
				num=1;
			}else{
				num--;
			}
		}
		row.cells[3].childNodes[1].value=num;
		row.cells[4].firstChild.nodeValue=price*num;
		sum_();
	}
	function sum_(){
		var mytb=document.getElementById("tb");
		var sum=0;
		
		for(var i=0;i<mytb.rows.length;i++){
			sum+=parseInt(mytb.rows[i].cells[4].firstChild.nodeValue);
		}
		document.getElementById("total").firstChild.nodeValue=sum;
	}
	function remove_(v){
		var row_=v.parentNode.parentNode;
		var mytb=document.getElementById("tb");
		mytb.deleteRow(row_.rowIndex-1);
		sum_();
	}
	function repeat_(v){
		var mytb=document.getElementById("tb");
		for(var i=0;i<mytb.rows.length;i++){
			var o=mytb.rows[i].cells[0].firstChild.nodeValue;
			if(v==o){
				return true;
			}
		}
	}
</script>
