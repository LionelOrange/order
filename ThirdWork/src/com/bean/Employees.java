package com.bean;

public class Employees {
	private int empId;
	private String empName;
	private String hireDate;
	private int sal;
	private int psw;
	public Employees(){}
	public Employees(int empId){
		this.empId=empId;
	}
	public Employees(int empId,String empName){
		this.empId=empId;
		this.empName=empName;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getHireDate() {
		return hireDate;
	}
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	public int getPsw() {
		return psw;
	}
	public void setPsw(int psw) {
		this.psw = psw;
	}
	
}
