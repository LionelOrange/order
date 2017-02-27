package com.dao;

import java.sql.Connection;
import java.util.Set;

import com.bean.OrderDetail;
import com.bean.Orders;
import com.db.PageModel;

public interface OrderDetailDao {
	public void add(Connection conn,Set<OrderDetail> setDetail)throws Exception;
	public OrderDetail findByOrderId(int orderId)throws Exception;
	public PageModel<OrderDetail> queryOrderDetail(Connection conn,int currentPage,int pagesize,Orders order)throws Exception;
}
