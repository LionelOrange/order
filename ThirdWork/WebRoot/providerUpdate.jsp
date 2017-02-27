<%@page import="com.bean.Provider"%>
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
    		$('#providerName').blur(function(){
    			if(!(/^[\u4E00-\u9FA5]{1,6}$/.test($('#providerName').val()))){
    				$('.high1').text("请输入1~6个汉字");
    			}else{
    				$('.high1').text("");
    			}
    		});
    		$('#providerAdd').blur(function(){
    			if(!(/^[\u4e00-\u9fa5]{1,10}$/.test($('#providerAdd').val()))){
    				$('.high2').text("请输入1~10个汉字");
    			}else{
    				$('.high2').text("");
    			}
    		});
    		$('#providerTel').blur(function(){
    			if(!(/^[0-9]{4,10}$/.test($('#providerTel').val()))){
    				$('.high3').text("请输入4~10位数字");
    				$('#providerTel').val("");
    			}else{
    				$('.high3').text("");
    			}
    		});
    		$('#account').blur(function(){
    			if(!(/^[a-zA-Z0-9_]{3,10}$/.test($('#account').val()))){
    				$('.high4').text("请输入3个以上的字母或数字");
    			}else{
    				$('.high4').text("");
    			}
    		});
    		$('#email').blur(function(){
    			if(!(/^[a-zA-Z0-9_-]{1,10}@[a-zA-Z0-9_-]{2,10}(\.[a-z0-9]{2,5}){1,2}$/.test($('#email').val()))){
    				$('.high5').text("邮箱无效");
    			}else{
    				$('.high5').text("");
    			}
    		});
    		$('form').submit(function(){
    			if($('#providerId').val()==''||$('#providerName').val()==''||$('#providerAdd').val()==''||$('#providerTel').val()==''||$('#account').val()==''||$('#email').val()==''){
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
  	Provider provider=(Provider)request.getAttribute("provider");
  %>
	<div class="ui horizontal divider">or</div>
	<form class="ui form segment" action="doProviderUpdate.jsp" method="post">
    <h1>更新供应商</h1>
        <div class="field" style="margin:0 auto;">
            <label>编号</label>
            <input type="hidden" name="providerId" value="<%=provider.getProviderId()%>"/>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>名称</label>
            <input type="text" name="providerName" value="<%=provider.getProviderName()%>" id="providerName"/><strong class="high1" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>地址</label>
            <input type="text" name="providerAdd" value="<%=provider.getProviderAdd()%>" id="providerAdd"/><strong class="high2" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>电话</label>
            <input type="text" name="providerTel" value="<%=provider.getProviderTel()%>" id="providerTel"/><strong class="high3" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>账号</label>
            <input type="text" name="account" value="<%=provider.getAccount()%>" id="account"/><strong class="high4" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>邮箱</label>
            <input type="text" name="email" value="<%=provider.getEmail()%>" id="email"/><strong class="high5" style="color:red"></strong>
        </div><br>
    <div class="ui primary submit button" style="margin:0 auto" id="sub"><input type="submit" value="update"/></div>
    <div class="ui error message"></div>
	</form>
  </body>
</html>
