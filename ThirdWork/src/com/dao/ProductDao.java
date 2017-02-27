package com.dao;

import java.sql.Connection;

import com.bean.Products;
import com.db.PageModel;

public interface ProductDao {
	public void add(Connection conn,Products product)throws Exception;
	public void delete(Connection conn,int productId)throws Exception;
	public void update(Connection conn,Products product)throws Exception;
	public Products findByProductId(Connection conn,int productId)throws Exception;
	public PageModel<Products> queryProducts(Connection conn,int currentPage,int pagesize)throws Exception;
}
