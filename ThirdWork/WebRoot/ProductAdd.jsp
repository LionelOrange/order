<%@page import="com.bean.Provider"%>
<%@page import="com.bean.Categorys"%>
<%@page import="com.serviceDao.ProductServiceDaoImpl"%>
<%@page import="com.serviceDao.ProductServiceDao"%>
<%@page import="com.dao.ProductDaoImpl"%>
<%@page import="com.dao.ProductDao"%>
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
			$('#productId').blur(function(){
				var productIdValue=$('#productId').val();
				if(!(/^[0-9]{1,4}$/.test($('#productId').val()))){
    				$('.high').text("请输入1~4位数字");
    				$('#productId').val("");
    			}else{
    				$('.high').text("");
    			}
				$.ajax({
					   type: "POST",
					   url: "ProductAjax.jsp",
					   data: "productId="+productIdValue,
					   dataType: "json",
					   success: function(msg){
						   if(msg.productId=='0'){
 								if(!($('.high').text()=='')){
								   
							   }else{
								   $('.high').text('');
							   }
							}else{
								$('#productId').val('');
								$('#high').text('productId is repeated');
							}
					   }
					});
    		});
			$('#productName').blur(function(){
    			if(!(/^[\u4E00-\u9FA5]{1,6}$/.test($('#productName').val()))){
    				$('.high1').text("请输入1~6个汉字");
    			}else{
    				$('.high1').text("");
    			}
    		});
    		$('#incomePrice').blur(function(){
    			if(!(/^[0-9]{1,6}$/.test($('#incomePrice').val()))){
    				$('.high2').text("请输入1~6个数字");
    			}else{
    				$('.high2').text("");
    			}
    		});
    		$('#providerName').blur(function(){
    			if($('#providerName').val()=='请选择'){
    				$('.high3').text("请选择");
    				
    			}else{
    				$('.high3').text("");
    			}
    		});
    		$('#salesPrice').blur(function(){
    			if(!(/^[0-9]{1,6}$/.test($('#salesPrice').val()))){
    				$('.high4').text("请输入1~6个数字");
    			}else{
    				$('.high4').text("");
    			}
    		});
    		$('#categoryName').blur(function(){
    			if($('#categoryName').val()=='请选择'){
    				$('.high5').text("请选择");
    			}else{
    				$('.high5').text("");
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
		ProductServiceDao dao=new ProductServiceDaoImpl();
		Map<String,Object> maps=dao.toAddProduct();
		List<Categorys> caList=(List<Categorys>)maps.get("categoryList");
		List<Provider> prList=(List<Provider>)maps.get("providerList");
	%>
	<div class="ui horizontal divider">or</div>
	<form class="ui form segment" action="ProductDoAdd.jsp" method="post">
    <h1>添加产品</h1>
        <div class="field" style="margin:0 auto;">
            <label>productId</label>
            <input type="text" name="productId" id="productId"/><strong class="high" id="high" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>productName</label>
            <input type="text" name="productName" id="productName"/><strong class="high1" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>incomePrice</label>
            <input type="text" name="incomePrice" id="incomePrice"/><strong class="high2" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
		      <label>providerName</label>
		      <select name="providerName" id="providerName"class="ui fluid dropdown">
			<option selected="selected">请选择</option>
			<%
				for(int i=0;i<prList.size();i++){
					Provider pr=prList.get(i);
					%>
				<option><%=pr.getProviderName() %></option>	
			<%
				}
			%>
		</select><strong class="high3" style="color:red"></strong>
    	</div><br>
        <div class="field" style="margin:0 auto;">
            <label>salesPrice</label>
            <input type="text" name="salesPrice" id="salesPrice"/><strong class="high4" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
		      <label>categoryName</label>
		     <select name="categoryName" id="categoryName" class="ui fluid dropdown">
				<option selected="selected">请选择</option>
			<%
				for(int i=0;i<caList.size();i++){
					Categorys ca=caList.get(i);
					%>
				<option><%=ca.getCategoryName() %></option>	
			<%
				}
			%>
		</select><strong class="high5" style="color:red"></strong>
    	</div><br>
    <div class="ui primary submit button" style="margin:0 auto" id="sub"><input type="submit" value="Add"/></div>
    <div class="ui error message"></div>
	</form>
  </body>
</html>
