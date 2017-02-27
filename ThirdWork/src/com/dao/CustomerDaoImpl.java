package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Customer;
import com.db.PageModel;

public class CustomerDaoImpl extends BaseDao implements CustomerDao {

	public void add(Connection conn, Customer customer) throws Exception {
		String sql="insert into customer(customerId,customerName,customerAdd,customerBir,customerTel)values(?,?,?,?,?)";
		Object[] params={customer.getCustomerId(),customer.getCustomerName(),customer.getCustomerAdd(),customer.getCustomerBir(),customer.getCustomerTel()};
		this.exesql(conn, sql, params);
	}

	public void delete(Connection conn, int customerId) throws Exception {
		String sql="delete from customer where customerId=?";
		Object[] params={customerId};
		this.exesql(conn, sql, params);
	}

	public void update(Connection conn, Customer customer) throws Exception {
		String sql="update customer set customerName=?,customerAdd=?,customerBir=?,customerTel=? where customerId=?";
		Object[] params={customer.getCustomerName(),customer.getCustomerAdd(),customer.getCustomerBir(),customer.getCustomerTel(),customer.getCustomerId()};
		this.exesql(conn, sql, params);

	}

	public Customer findByCustomerId(Connection conn, int customerId)
			throws Exception {
		String sql="select * from customer where customerId=?";
		Object[] params={customerId};
		Customer customer=new Customer();
		ResultSet rs=this.getRs(conn, sql,params);
		if(rs.next()){
			customer.setCustomerId(rs.getInt("customerId"));
			customer.setCustomerName(rs.getString("customerName"));
			customer.setCustomerAdd(rs.getString("customerAdd"));
			customer.setCustomerBir(rs.getString("customerBir"));
			customer.setCustomerTel(rs.getInt("customerTel"));
		}
		return customer;
	}

	public List<Customer> findAll(Connection conn) throws Exception {
		List<Customer> list=new ArrayList<Customer>();
		String sql="select * from customer";
		ResultSet rs=this.getRs(conn, sql, null);
		while(rs.next()){
			Customer customer=new Customer();
			customer.setCustomerId(rs.getInt("customerId"));
			customer.setCustomerName(rs.getString("customerName"));
			customer.setCustomerAdd(rs.getString("customerAdd"));
			customer.setCustomerBir(rs.getString("customerBir"));
			customer.setCustomerTel(rs.getInt("customerTel"));
			list.add(customer);
		}
		return list;
	}

	public PageModel<Customer> queryCustomer(Connection conn, int currentPage,
			int pagesize) throws Exception {
		PageModel<Customer> pageModel=new PageModel<Customer>();
		List<Customer> list=new ArrayList<Customer>();
		String sql="select * from (select rownum rn,cu.* from(select * from customer order by customerId)cu where rownum<=?)where rn>?";
		Object[] params={currentPage*pagesize,(currentPage-1)*pagesize};
		ResultSet rs=this.getRs(conn, sql, params);
		while(rs.next()){
			Customer customer=new Customer();
			customer.setCustomerId(rs.getInt("customerId"));
			customer.setCustomerName(rs.getString("customerName"));
			customer.setCustomerAdd(rs.getString("customerAdd"));
			customer.setCustomerBir(rs.getString("customerBir"));
			customer.setCustomerTel(rs.getInt("customerTel"));
			list.add(customer);
		}
		pageModel.setList(list);
		pageModel.setCurrentPage(currentPage);
		pageModel.setPagesize(pagesize);
		pageModel.setTotalRecord(this.rowCount(conn,"select count(*) from customer",null));
		return pageModel;
	}

	public Customer findByCustoemrName(Connection conn, String customerName)
			throws Exception {
		String sql="select * from customer where customerName=?";
		Object[] params={customerName};
		Customer customer=new Customer();
		ResultSet rs=this.getRs(conn, sql,params);
		if(rs.next()){
			customer.setCustomerId(rs.getInt("customerId"));
			customer.setCustomerName(rs.getString("customerName"));
			customer.setCustomerAdd(rs.getString("customerAdd"));
			customer.setCustomerBir(rs.getString("customerBir"));
			customer.setCustomerTel(rs.getInt("customerTel"));
		}
		return customer;
	}

}
