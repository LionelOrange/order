package com.serviceDao;

import java.util.Map;

import com.bean.Products;
import com.db.PageModel;

public interface ProductServiceDao {
	public void save(Products product);
	public void delete(int productId);
	public void update(Products product);
	public Products findByProductId(int productId);
	public PageModel<Products> queryProducts(int currentPage,int pagesize);
	public Map<String,Object> toAddProduct();
}
