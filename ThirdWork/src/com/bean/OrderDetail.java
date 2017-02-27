package com.bean;

public class OrderDetail {
	private Orders order;
	private Products product;
	private int quantity;
	private double discount;
	public OrderDetail(){
		
	}
	public OrderDetail(Orders order,Products product,int quantity,double discount){
		this.order=order;
		this.product=product;
		this.quantity=quantity;
		this.discount=discount;
	}
	public Orders getOrder() {
		return order;
	}
	public void setOrder(Orders order) {
		this.order = order;
	}
	public Products getProduct() {
		return product;
	}
	public void setProduct(Products product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	
	
}
