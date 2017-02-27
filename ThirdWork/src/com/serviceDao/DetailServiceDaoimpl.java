package com.serviceDao;

import java.sql.Connection;
import java.sql.SQLException;

import com.bean.OrderDetail;
import com.bean.Orders;
import com.dao.OrderDao;
import com.dao.OrderDaoImpl;
import com.dao.OrderDetailDao;
import com.dao.OrderDetailDaoImpl;
import com.db.DBHelper;
import com.db.PageModel;

public class DetailServiceDaoimpl implements DetailServiceDao {

	public PageModel<OrderDetail> queryDetails(int currentPage, int pagesize,
			Orders order) {
		Connection conn=null;
		PageModel<OrderDetail> pageModel=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			OrderDetailDao dao=new OrderDetailDaoImpl();
			pageModel=dao.queryOrderDetail(conn, currentPage, pagesize, order);
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

}
