package com.serviceDao;

import com.bean.Orders;
import com.db.PageModel;

public interface OrderServiceDao {
	public void add(Orders order);
	public void delete(int orderId);
	public PageModel<Orders> queryOrders(int currentPage,int pagesize);
}
