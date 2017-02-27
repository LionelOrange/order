package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

import com.bean.OrderDetail;

public class BaseDao {
	public void exesql(Connection conn,String sql,Object[] params) throws Exception{
		PreparedStatement pstmt=conn.prepareStatement(sql);
		if(params!=null){
			for(int i=0;i<params.length;i++){
				pstmt.setObject(i+1,params[i]);
			}
		}
		pstmt.executeUpdate();
	}
	public ResultSet getRs(Connection conn,String sql,Object[] params) throws Exception{
		ResultSet rs=null;
		PreparedStatement pstmt=conn.prepareStatement(sql);
		if(params!=null){
			for(int i=0;i<params.length;i++){
				pstmt.setObject(i+1,params[i]);
			}
		}
		rs=pstmt.executeQuery();
		return rs;
	}
	public int rowCount(Connection conn,String sql,Object[] params) throws Exception{
		ResultSet rs=null;
		PreparedStatement pstmt=conn.prepareStatement(sql);
		if(params!=null){
			for(int i=0;i<params.length;i++){
				pstmt.setObject(i+1,params[i]);
			}
		}
		rs=pstmt.executeQuery();
		while(rs.next()){
			return rs.getInt(1);
		}
		return 0;
	}
	public void exeBatch(Connection conn,String sql,Set<OrderDetail> set)throws Exception{
		PreparedStatement pstmt=null;
		pstmt=conn.prepareStatement(sql);
		for(OrderDetail o:set){
			pstmt.setString(1, o.getOrder().getOrderId());
			pstmt.setInt(2, o.getProduct().getProductId());
			pstmt.setInt(3, o.getQuantity());
			pstmt.setDouble(4, o.getDiscount());
			pstmt.addBatch();
		}
		pstmt.executeBatch();
	}
}
