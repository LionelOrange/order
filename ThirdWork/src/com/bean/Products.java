package com.bean;

public class Products {
	private int productId;
	private String productName;
	private int incomePrice;
	private int providerId;
	private int salesPrice;
	private int categoryId;
	public Products(){}
	public Products(int productId){
		super();
		this.productId=productId;
	}
	public Products(int productId,String productName){
		this.productId=productId;
		this.productName=productName;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getIncomePrice() {
		return incomePrice;
	}
	public void setIncomePrice(int incomePrice) {
		this.incomePrice = incomePrice;
	}
	public int getProviderId() {
		return providerId;
	}
	public void setProviderId(int providerId) {
		this.providerId = providerId;
	}
	public int getSalesPrice() {
		return salesPrice;
	}
	public void setSalesPrice(int salesPrice) {
		this.salesPrice = salesPrice;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
}
