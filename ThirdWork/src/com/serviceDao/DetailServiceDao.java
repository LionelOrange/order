package com.serviceDao;

import com.bean.OrderDetail;
import com.bean.Orders;
import com.db.PageModel;

public interface DetailServiceDao {
	public PageModel<OrderDetail> queryDetails(int currentPage,int pagesize,Orders order);
}
