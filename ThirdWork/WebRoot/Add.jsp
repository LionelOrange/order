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
    		$('#categoryId').blur(function(){
    			var categoryIdValue=$('#categoryId').val();
    			if(!(/^[0-9]{1,4}$/.test($('#categoryId').val()))){
    				$('.high').text("请输入1~4位数字");
    				$('#categoryId').val("");
    			}else{
    				$('.high').text("");
    			}
    			$.ajax({
					   type: "POST",
					   url: "CategoryAjax.jsp",
					   data: "categoryId="+categoryIdValue,
					   dataType: "json",
					   success: function(msg){
						   if(msg.categoryId=='0'){
								if(!($('.high').text()=='')){
								   
							   }else{
								   $('.high').text('');
							   }
							}else{
								$('#categoryId').val('');
								$('.high').text('categoryId is repeated');
							}
					   }
					});
    		});
    		$('#categoryName').blur(function(){
    			if(!(/^[\u4E00-\u9FA5]{1,6}$/.test($('#categoryName').val()))){
    				$('.high1').text("请输入1~6个汉字");
    			}else{
    				$('.high1').text("");
    			}
    		});
    		$('#categoryDesc').blur(function(){
    			if(!(/^[\u4e00-\u9fa5]{1,6}$/.test($('#categoryDesc').val()))){
    				$('.high2').text("请输入1~6个汉字");
    			}else{
    				$('.high2').text("");
    			}
    		});
    			$("form").submit(function(){
        			if($('#categoryId').val()==''||$('#categoryName').val()==''||$('#categoryDesc').val()==''){
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
	<form class="ui form segment" action="doAdd.jsp" method="post">
    <h1>添加类别</h1>
        <div class="field" style="margin:0 auto;">
            <label>编号</label>
            <input type="text" name="categoryId" id="categoryId"/><strong class="high" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>名称</label>
            <input type="text" name="categoryName" id="categoryName"/><strong class="high1" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>描述</label>
            <input type="text" name="categoryDesc" id="categoryDesc"/><strong class="high2" style="color:red"></strong>
        </div><br>
    <div class="ui primary submit button" style="margin:0 auto" id="sub"><input type="submit" value="Add"/></div>
    <div class="ui error message"></div>
</form>
  </body>
</html>
