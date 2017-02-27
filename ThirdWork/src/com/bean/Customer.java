package com.bean;

public class Customer {
	private int customerId;
	private String customerName;
	private String customerAdd;
	private String customerBir;
	private int customerTel;
	public Customer(){}
	public Customer(int customerId){
		this.customerId=customerId;
	}
	public Customer(int customerId,String customerName){
		this.customerId=customerId;
		this.customerName=customerName;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerAdd() {
		return customerAdd;
	}
	public void setCustomerAdd(String customerAdd) {
		this.customerAdd = customerAdd;
	}
	public String getCustomerBir() {
		return customerBir;
	}
	public void setCustomerBir(String customerBir) {
		this.customerBir = customerBir;
	}
	public int getCustomerTel() {
		return customerTel;
	}
	public void setCustomerTel(int customerTel) {
		this.customerTel = customerTel;
	}
	
}
