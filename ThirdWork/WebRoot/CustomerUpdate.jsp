<%@page import="com.bean.Customer"%>
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
			$('#customerName').blur(function(){
    			if(!(/^[\u4E00-\u9FA5]{1,6}$/.test($('#customerName').val()))){
    				$('.high1').text("请输入1~6个汉字");
    			}else{
    				$('.high1').text("");
    			}
    		});
    		$('#customerAdd').blur(function(){
    			if(!(/^[\u4e00-\u9fa5]{1,10}$/.test($('#customerAdd').val()))){
    				$('.high2').text("请输入1~10个汉字");
    			}else{
    				$('.high2').text("");
    			}
    		});
    		$('#customerBir').blur(function(){
    			if(!(/^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/.test($('#customerBir').val()))){
    				$('.high3').text("按xxxx-xx-xx格式输入");
    				
    			}else{
    				$('.high3').text("");
    			}
    		});
    		$('#customerTel').blur(function(){
    			if(!(/^[0-9]{4,11}$/.test($('#customerTel').val()))){
    				$('.high4').text("请输入4~11位数字");
    			}else{
    				$('.high4').text("");
    			}
    		});
    		$('form').submit(function(){
    			if($('#productId').val()==''||$('#productName').val()==''||$('#incomePrice').val()==''||$('#providerName').val()=='请选择'||$('#salesPrice').val()==''||$('#categoryName').val()=='请选择'){
    				alert('啥都没输入！');
    				return false;
    			}else if(($('strong').text()=='')){
    				return true;
    			}else{
    				return false;
    			}
    		});
		});
		</script>
  </head>
  <body>
	<%
		Customer customer=(Customer)request.getAttribute("customer");
	%>
	<div class="ui horizontal divider">or</div>
	<form class="ui form segment" action="CustomerDoUpdate.jsp" method="post">
    <h1>更新顾客</h1>
        <div class="field" style="margin:0 auto;">
            <label>customerId</label>
            <input type="hidden" name="customerId" value="<%=customer.getCustomerId() %>"/>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>customerName</label>
            <input type="text" name="customerName" value="<%=customer.getCustomerName()%>" id="customerName"/><strong class="high1" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>customerAdd</label>
            <input type="text" name="customerAdd" value="<%=customer.getCustomerAdd()%>" id="customerAdd"/><strong class="high2" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>customerBir</label>
            <input type="text" name="customerBir" value="<%=customer.getCustomerBir()%>" id="customerBir"/><strong class="high3" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>customerTel</label>
            <input type="text" name="customerTel" value="<%=customer.getCustomerTel()%>" id="customerTel"/><strong class="high4" style="color:red"></strong>
        </div><br>
    <div class="ui primary submit button" style="margin:0 auto" id="sub"><input type="submit" value="Update"/></div>
    <div class="ui error message"></div>
</form>
  </body>
</html>
