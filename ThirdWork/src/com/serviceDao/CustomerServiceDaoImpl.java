package com.serviceDao;

import java.sql.Connection;
import java.sql.SQLException;

import com.bean.Customer;
import com.dao.CustomerDao;
import com.dao.CustomerDaoImpl;
import com.db.DBHelper;
import com.db.PageModel;

public class CustomerServiceDaoImpl implements CustomerServiceDao {

	public void add(Customer customer) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			CustomerDao dao=new CustomerDaoImpl();
			dao.add(conn, customer);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				DBHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void delete(int customerId) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			CustomerDao dao=new CustomerDaoImpl();
			dao.delete(conn, customerId);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				DBHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public void update(Customer customer) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			CustomerDao dao=new CustomerDaoImpl();
			dao.update(conn, customer);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				DBHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public PageModel<Customer> queryCustomer(int currentpage, int pagesize) {
		Connection conn=null;
		PageModel<Customer> pageModel=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			CustomerDao dao=new CustomerDaoImpl();
			pageModel=dao.queryCustomer(conn, currentpage, pagesize);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				DBHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return pageModel;
	}

	public Customer findByCustomerId(int customerId) {
		Connection conn=null;
		Customer customer=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			CustomerDao dao=new CustomerDaoImpl();
			customer=dao.findByCustomerId(conn, customerId);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				DBHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return customer;
	}

	public Customer findByCustomerName(String customerName) {
		Connection conn=null;
		Customer customer=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			CustomerDao dao=new CustomerDaoImpl();
			customer=dao.findByCustoemrName(conn, customerName);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				DBHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return customer;
	}

}
