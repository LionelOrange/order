package com.serviceDao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.bean.Customer;
import com.bean.Employees;
import com.bean.OrderDetail;
import com.bean.Orders;
import com.dao.CustomerDao;
import com.dao.CustomerDaoImpl;
import com.dao.EmployeeDao;
import com.dao.EmployeeDaoImpl;
import com.dao.OrderDao;
import com.dao.OrderDaoImpl;
import com.dao.OrderDetailDao;
import com.dao.OrderDetailDaoImpl;
import com.dao.ProductDao;
import com.dao.ProductDaoImpl;
import com.db.DBHelper;
import com.db.PageModel;

public class OrderServiceDaoImpl implements OrderServiceDao {
	public void add(Orders order) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			OrderDao dao=new OrderDaoImpl();
			OrderDetailDao dao1=new OrderDetailDaoImpl();
			dao.add(conn, order);
			dao1.add(conn, order.getSet());
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

	public void delete(int orderId) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			OrderDao dao=new OrderDaoImpl();
			dao.delete(conn, orderId);
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

	public void update(Orders order) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			OrderDao dao=new OrderDaoImpl();
			dao.update(conn, order);
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

	public Orders findByOrderId(int orderId) {
		Connection conn=null;
		Orders order=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			OrderDao dao=new OrderDaoImpl();
			order=dao.findByOrderId(conn, orderId);
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
		return order;
	}

	public PageModel<Orders> queryOrders(int currentPage, int pagesize) {
		Connection conn=null;
		PageModel<Orders> pageModel=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			OrderDao dao=new OrderDaoImpl();
			pageModel=dao.queryOrders(conn, currentPage, pagesize);
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
	public Map<String,Object> toAddOrder(){
		Connection conn=null;
		Map<String, Object> map=new HashMap<String, Object>();
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			CustomerDao cudao=new CustomerDaoImpl();
			EmployeeDao epdao=new EmployeeDaoImpl();
			List<Customer> cuList=cudao.findAll(conn);
			List<Employees> epList=epdao.findAll(conn);
			map.put("cuList", cuList);
			map.put("epList", epList);
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
		return map;
	}
}
