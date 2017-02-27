package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.bean.OrderDetail;
import com.bean.Orders;
import com.bean.Products;
import com.db.PageModel;

public class OrderDetailDaoImpl extends BaseDao implements OrderDetailDao {

	public void add(Connection conn, Set<OrderDetail> setDetail)
			throws Exception {
		String sql="insert into orderDetail(orderId,productId,quantity,discount)values(?,?,?,?)";
		this.exeBatch(conn, sql, setDetail);
	}

	public OrderDetail findByOrderId(int orderId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public PageModel<OrderDetail> queryOrderDetail(Connection conn,
			int currentPage, int pagesize, Orders order) throws Exception {
		PageModel<OrderDetail> pageModel=new PageModel<OrderDetail>();
		List<OrderDetail> list=new ArrayList<OrderDetail>();
		String sql="select * from(select rownum rn,od.* from (select o.orderId,p.productId,p.productName,od.quantity,od.discount from orderDetail od,orders o,products p where od.orderId=o.orderId and od.productId=p.productId and o.orderId=? order by p.productId desc)od where rownum<=?) where rn>?";
		Object[] params={order.getOrderId(),currentPage*pagesize,(currentPage-1)*pagesize};
		ResultSet rs=this.getRs(conn, sql, params);
		while(rs.next()){
			OrderDetail od=new OrderDetail();
			od.setOrder(new Orders(rs.getString("orderId")));
			od.setProduct(new Products(rs.getInt("productId"),rs.getString("productName")));
			od.setQuantity(rs.getInt("quantity"));
			od.setDiscount(rs.getDouble("discount"));
			list.add(od);
		}
		pageModel.setList(list);
		pageModel.setCurrentPage(currentPage);
		pageModel.setPagesize(pagesize);
		Object[] params1={order.getOrderId()};
		pageModel.setTotalRecord(this.rowCount(conn, "select count(*) from orderDetail where orderId=?",params1));
		return pageModel;
	}
}
