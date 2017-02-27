package com.dao;

import java.sql.Connection;
import java.util.List;

import com.bean.Employees;
import com.db.PageModel;

public interface EmployeeDao {
	public void add(Connection conn,Employees employee)throws Exception;
	public void delete(Connection conn,int employeeId)throws Exception;
	public void update(Connection conn,Employees employee)throws Exception;
	public Employees findByEmployeeId(Connection conn,int employeeId)throws Exception;
	public List<Employees> findAll(Connection conn)throws Exception;
	public PageModel<Employees> queryEmployees(Connection conn,int currentPage,int pagesize)throws Exception;
	public Employees login(Connection conn,String empName,int psw)throws Exception;
}
