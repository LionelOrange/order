package com.dao;

import java.sql.Connection;
import java.util.List;

import com.bean.Customer;
import com.db.PageModel;

public interface CustomerDao {
	public void add(Connection conn,Customer customer)throws Exception;
	public void delete(Connection conn,int customerId)throws Exception;
	public void update(Connection conn,Customer customer)throws Exception;
	public Customer findByCustomerId(Connection conn,int customerId)throws Exception;
	public List<Customer> findAll(Connection conn)throws Exception;
	public Customer findByCustoemrName(Connection conn,String customerName)throws Exception;
	public PageModel<Customer> queryCustomer(Connection conn,int currentPage,int pagesize)throws Exception;
}
