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
			$('#providerId').blur(function(){
				var providerIdValue=$('#providerId').val();
				if(!(/^[0-9]{1,4}$/.test($('#providerId').val()))){
    				$('.high').text("请输入1~4位数字");
    				$('#providerId').val("");
    			}else{
    				$('.high').text("");
    			}
    			$.ajax({
					   type: "POST",
					   url: "ProviderAjax.jsp",
					   data: "providerId="+providerIdValue,
					   dataType: "json",
					   success: function(msg){
						   if(msg.providerId=='0'){
								if(!($('.high').text()=='')){
								   
							   }else{
								   $('.high').text('');
							   }
							}else{
								$('#providerId').val('');
								$('.high').text('providerId is repeated');
							}
					   }
					});
    		});
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
    			if(!(/^[0-9]{4,11}$/.test($('#providerTel').val()))){
    				$('.high3').text("请输入4~11位数字");
    				$('#providerTel').val("");
    			}else{
    				$('.high3').text("");
    			}
    		});
    		$('#account').blur(function(){
    			if(!(/^[a-zA-Z0-9_]{3,}$/.test($('#account').val()))){
    				$('.high4').text("请输入3个以上的字母或数字");
    			}else{
    				$('.high4').text("");
    			}
    		});
    		$('#email').blur(function(){
    			if(!(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]{2,}(\.[a-z0-9]{2,}){1,2}$/.test($('#email').val()))){
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
	<div class="ui horizontal divider">or</div>
	<form class="ui form segment" action="doAddProvider.jsp" method="post">
    <h1>添加供应商</h1>
        <div class="field" style="margin:0 auto;">
            <label>编号</label>
            <input type="text" name="providerId" id="providerId"/><strong class="high" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>名称</label>
            <input type="text" name="providerName" id="providerName"/><strong class="high1" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>地址</label>
            <input type="text" name="providerAdd" id="providerAdd"/><strong class="high2" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>电话</label>
            <input type="text" name="providerTel" id="providerTel"/><strong class="high3" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>账号</label>
            <input type="text" name="account" id="account"/><strong class="high4" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>邮箱</label>
            <input type="text" name="email" id="email"/><strong class="high5" style="color:red"></strong>
        </div><br>
    <div class="ui primary submit button" style="margin:0 auto" id="sub"><input type="submit" value="Add"/></div>
    <div class="ui error message"></div>
	</form>
  </body>
</html>
