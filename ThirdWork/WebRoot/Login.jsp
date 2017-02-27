<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  	<link rel="stylesheet" type="text/css" href="js/semantic.css">
    <script type="text/javascript" src="js/semantic.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
     <style>
        .field{
            width: 200px;
        }
        form{
            text-align: center;
        }
    </style>
    <script type="text/javascript">
    	$(function(){
    		$(document).keydown(function(event){
    			if(event.keyCode==13){
    				$("#f").submit();
    			}
    		});
    		$("#sub").click(function(){
        		$("#f").submit();
        	});
    	});
    	
    </script>
  <body >
  <div class="ui horizontal divider">or</div>
<form class="ui form segment" action="doLogin.jsp" id="f" method="post">
    <p>Tell Us About Yourself</p>
        <div class="field" style="margin:0 auto;">
            <label>Username</label>
            <input placeholder="Username" name="userName" type="text">
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>Password</label>
            <input type="password" name="password" id="ps">
        </div><br>
    <div class="ui primary submit button" style="margin:0 auto" id="sub">Login</div>
    <div class="ui error message"></div>
</form>
  </body>
</html>
