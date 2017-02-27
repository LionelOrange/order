package com.serviceDao;


import com.bean.Employees;
import com.db.PageModel;

public interface EmployeeServiceDao {
	public void add(Employees employee);
	public void delete(int empId);
	public void update(Employees employee);
	public PageModel<Employees> queryEmployee(int currentpage,int pagesize);
	public Employees findByEmployeeId(int empId);
	public Employees login(String empName,int psw);
}
