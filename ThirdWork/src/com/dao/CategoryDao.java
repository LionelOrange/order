package com.dao;

import java.sql.Connection;
import java.util.List;

import com.bean.Categorys;
import com.db.PageModel;

public interface CategoryDao {
	public void add(Connection conn,Categorys category)throws Exception;
	public void delete(Connection conn,int categoryId) throws Exception;
	public void update(Connection conn,Categorys category)throws Exception;
	public Categorys findByCategoryId(Connection conn,int categoryId)throws Exception;
	public PageModel<Categorys> queryCategorys(Connection conn,int currentPage,int pagesize)throws Exception;
	public List<Categorys> findAll(Connection conn)throws Exception;
	public Categorys findByCategoryName(Connection conn,String categoryName)throws Exception;
}
