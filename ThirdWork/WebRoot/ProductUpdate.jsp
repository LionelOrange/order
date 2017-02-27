<%@page import="com.serviceDao.ProductServiceDaoImpl"%>
<%@page import="com.serviceDao.ProductServiceDao"%>
<%@page import="com.bean.Categorys"%>
<%@page import="com.bean.Provider"%>
<%@page import="com.bean.Products"%>
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
			$('#productName').blur(function(){
    			if(!(/^[\u4E00-\u9FA5]{1,6}$/.test($('#productName').val()))){
    				$('.high1').text("请输入1~6个汉字");
    			}else{
    				$('.high1').text("");
    			}
    		});
    		$('#incomePrice').blur(function(){
    			if(!(/^[0-9]{1,8}$/.test($('#incomePrice').val()))){
    				$('.high2').text("请输入1~8个数字");
    			}else{
    				$('.high2').text("");
    			}
    		});
    		$('#salesPrice').blur(function(){
    			if(!(/^[0-9]{1,8}$/.test($('#salesPrice').val()))){
    				$('.high4').text("请输入1~8个数字");
    			}else{
    				$('.high4').text("");
    			}
    		});
    		$('form').submit(function(){
    			if($('#productId').val()==''||$('#productName').val()==''||$('#incomePrice').val()==''||$('#salesPrice').val()==''){
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
  	Products product=(Products)request.getAttribute("product");
	ProductServiceDao dao=new ProductServiceDaoImpl();
	Map<String,Object> maps=dao.toAddProduct();
	List<Categorys> caList=(List<Categorys>)maps.get("categoryList");
	List<Provider> prList=(List<Provider>)maps.get("providerList");
  %>
	<div class="ui horizontal divider">or</div>
	<form class="ui form segment" action="ProductDoUpdate.jsp" method="post">
    <h1>更新产品</h1>
        <div class="field" style="margin:0 auto;">
            <label>productId</label>
            <input type="hidden" name="productId" value="<%=product.getProductId()%>"/>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>productName</label>
            <input type="text" name="productName" value="<%=product.getProductName()%>" id="productName"/><strong class="high1" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
            <label>incomePrice</label>
            <input type="text" name="incomePrice" value="<%=product.getIncomePrice()%>" id="incomePrice"/><strong class="high2" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
		      <label>providerName</label>
		      <select name="providerName" id="providerName"class="ui fluid dropdown">
			<%
				for(int i=0;i<prList.size();i++){
					Provider pr=prList.get(i);
					if(pr.getProviderId()==(product.getProviderId())){
						%>
						<option selected="selected"><%=pr.getProviderName()%></option>
						<%
						continue;
					}
					%>
				<option><%=pr.getProviderName() %></option>	
			<%
				}
			%>
		</select>
    	</div><br>
        <div class="field" style="margin:0 auto;">
            <label>salesPrice</label>
            <input type="text" name="salesPrice" id="salesPrice" value="<%=product.getSalesPrice()%>"/><strong class="high4" style="color:red"></strong>
        </div><br>
        <div class="field" style="margin:0 auto;">
		      <label>categoryName</label>
		     <select name="categoryName" id="categoryName" class="ui fluid dropdown">
				<%
				for(int i=0;i<caList.size();i++){
					Categorys ca=caList.get(i);
					if(ca.getCategoryId()==product.getCategoryId()){
						%>
							<option selected="selected"><%=ca.getCategoryName() %></option>
						<%
						continue;
					}
					%>
				<option><%=ca.getCategoryName() %></option>	
			<%
				}
			%>
		</select>
    	</div><br>
    <div class="ui primary submit button" style="margin:0 auto" id="sub"><input type="submit" value="update"/></div>
    <div class="ui error message"></div>
	</form>
  </body>
</html>
