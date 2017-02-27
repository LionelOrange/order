package com.serviceDao;

import java.sql.Connection;
import java.sql.SQLException;

import com.bean.Employees;
import com.dao.EmployeeDao;
import com.dao.EmployeeDaoImpl;
import com.db.DBHelper;
import com.db.PageModel;

public class EmployeeServiceDaoImpl implements EmployeeServiceDao {

	public void add(Employees employee) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			EmployeeDao dao=new EmployeeDaoImpl();
			dao.add(conn, employee);
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

	public void delete(int empId) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			EmployeeDao dao=new EmployeeDaoImpl();
			dao.delete(conn, empId);
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

	public void update(Employees employee) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			EmployeeDao dao=new EmployeeDaoImpl();
			dao.update(conn, employee);
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

	public PageModel<Employees> queryEmployee(int currentpage, int pagesize) {
		Connection conn=null;
		PageModel<Employees> pageModel=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			EmployeeDao dao=new EmployeeDaoImpl();
			pageModel=dao.queryEmployees(conn, currentpage, pagesize);
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

	public Employees findByEmployeeId(int empId) {
		Connection conn=null;
		Employees employee=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			EmployeeDao dao=new EmployeeDaoImpl();
			employee=dao.findByEmployeeId(conn, empId);
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
		return employee;
	}

	public Employees login(String empName, int psw) {
		Connection conn=null;
		Employees employee=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			EmployeeDao dao=new EmployeeDaoImpl();
			employee=dao.login(conn, empName, psw);
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
		return employee;
	}

}
