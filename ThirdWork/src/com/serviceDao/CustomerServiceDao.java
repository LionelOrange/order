package com.serviceDao;

import com.bean.Customer;
import com.db.PageModel;

public interface CustomerServiceDao {
	public void add(Customer customer);
	public void delete(int customerId);
	public void update(Customer customer);
	public PageModel<Customer> queryCustomer(int currentpage,int pagesize);
	public Customer findByCustomerId(int customerId);
	public Customer findByCustomerName(String customerName);
}
