package com.dao;

import java.sql.Connection;

import com.bean.Orders;
import com.db.PageModel;

public interface OrderDao {
	public void add(Connection conn,Orders order)throws Exception;
	public void delete(Connection conn,int orderId)throws Exception;
	public void update(Connection conn,Orders order)throws Exception;
	public Orders findByOrderId(Connection conn,int orderId)throws Exception;
	public PageModel<Orders> queryOrders(Connection conn,int currentPage,int pagesize)throws Exception;
}
