package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Customer;
import com.bean.Employees;
import com.bean.Orders;
import com.db.PageModel;

public class OrderDaoImpl extends BaseDao implements OrderDao {

	public void add(Connection conn, Orders order) throws Exception {
		String sql="insert into orders(orderId,orderDate,customerId,empId)values(?,to_date(?,'yyyy-MM-dd'),?,?)";
		Object[] params={order.getOrderId(),order.getOrderDate(),order.getCustomer().getCustomerId(),order.getEmployee().getEmpId()};
		this.exesql(conn, sql, params);
	}

	public void delete(Connection conn, int orderId) throws Exception {
		String sql="delete from orders where orderId=?";
		Object[] params={orderId};
		this.exesql(conn, sql, params);
	}

	public PageModel<Orders> queryOrders(Connection conn, int currentPage,
			int pagesize) throws Exception {
		PageModel<Orders> pageModel=new PageModel<Orders>();
		List<Orders> list=new ArrayList<Orders>();
		String sql="select * from(select rownum rn,pr.* from(select o.orderId,to_char(o.orderDate,'yyyy-mm-dd') orderDate,c.customerId,c.customerName,em.empId,em.empName from Orders o,customer c,employees em  where o.customerId=c.customerId and o.empId=em.empId order by o.orderDate desc) pr where rownum<=?) where rn>?";
		Object[] params={currentPage*pagesize,(currentPage-1)*pagesize};
		ResultSet rs=this.getRs(conn, sql, params);
		while(rs.next()){
			Orders order=new Orders();
			order.setOrderId(rs.getString("orderId"));
			order.setOrderDate(rs.getString("orderDate"));
			order.setCustomer(new Customer(rs.getInt("customerId"),rs.getString("customerName")));
			order.setEmployee(new Employees(rs.getInt("empId"),rs.getString("empName")));
			list.add(order);
		}
		pageModel.setList(list);
		pageModel.setCurrentPage(currentPage);
		pageModel.setPagesize(pagesize);
		pageModel.setTotalRecord(this.rowCount(conn, "select count(*) from Orders",null));
		return pageModel;
	}

}
