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
			$('#empId').blur(function(){
				var empIdValue=$('#empId').val();
				if(!(/^[0-9]{1,4}$/.test($('#empId').val()))){
    				$('.high').text("请输入1~4位数字");
    				$('#productId').val("");
    			}else{
    				$('.high').text("");
    			}
    			$.ajax({
					   type: "POST",
					   url: "EmployeeAjax.jsp",
					   data: "empId="+empIdValue,
					   dataType: "json",
					   success: function(msg){
						   if(msg.empId=='0'){
								if(!($('.high').text()=='')){
								   
							   }else{
								   $('.high').text('');
							   }
							}else{
								$('#empId').val('');
								$('.high').text('empId is repeated');
							}
					   }
					});
    		});
			$('#empName').blur(function(){
    			if(!(/^[\u4E00-\u9FA5]{1,6}$/.test($('#empName').val()))){
    				$('.high1').text("请输入1~6个汉字");
    			}else{
    				$('.high1').text("");
    			}
    		});
    		$('#hireDate').blur(function(){
    			if(!( /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/.test($('#hireDate').val()))){
    				$('.high2').text("按xxxx-xx-xx格式输入");
    			}else{
    				$('.high2').text("");
    			}
    		});
    		$('#sal').blur(function(){
    			if(!(/^[0-9]{1,6}$/.test($('#sal').val()))){
    				$('.high3').text("请输入1~6位数字");
    				
    			}else{
    				$('.high3').text("");
    			}
    		});
    		$('#psw').blur(function(){
    			if(!(/^[0-9]{1,8}$/.test($('#psw').val()))){
    				$('.high4').text("请输入1~8个数字");
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
	<div class="ui horizontal divider">or</div>
	<form class="ui form segment" action="EmployeeDoAdd.jsp" method="post">
    <h1>添加员工</h1>
        <div class="field" style="margin:0 auto;">
            <label>empId</label>
            <input type="text" name="empId" id="empId"/><strong class="high" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>empName</label>
            <input type="text" name="empName" id="empName"/><strong class="high1" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>hireDate</label>
            <input type="text" name="hireDate" id="hireDate"/><strong class="high2" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>sal</label>
            <input type="text" name="sal" id="sal"/><strong class="high3" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>psw</label>
            <input type="text" name="psw" id="psw"/><strong class="high4" style="color:red"></strong>
        </div><br>
    <div class="ui primary submit button" style="margin:0 auto" id="sub"><input type="submit" value="Add"/></div>
    <div class="ui error message"></div>
</form>
  </body>
</html>
