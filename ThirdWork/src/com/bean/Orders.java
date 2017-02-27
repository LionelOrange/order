package com.bean;

import java.util.HashSet;
import java.util.Set;

public class Orders {
	private String orderId;
	private String orderDate;
	private Customer customer;
	private Employees employee;
	private Set<OrderDetail> set=new HashSet<OrderDetail>(0);
	
	public Set<OrderDetail> getSet() {
		return set;
	}
	public void setSet(Set<OrderDetail> set) {
		this.set = set;
	}
	public Orders(){
	}
	public Orders(String orderId){
		super();
		this.orderId=orderId;
	}
	public Orders(String orderId,String orderDate,Customer customer,Employees employee){
		this.orderId=orderId;
		this.orderDate=orderDate;
		this.customer=customer;
		this.employee=employee;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Employees getEmployee() {
		return employee;
	}
	public void setEmployee(Employees employee) {
		this.employee = employee;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
	
}
