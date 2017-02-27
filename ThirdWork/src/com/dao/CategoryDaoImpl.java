package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Categorys;
import com.db.PageModel;

public class CategoryDaoImpl extends BaseDao implements CategoryDao {

	public void add(Connection conn, Categorys category) throws Exception {
		String sql="insert into categorys(categoryId,categoryName,categoryDesc)values(?,?,?)";
		Object[] params={category.getCategoryId(),category.getCategoryName(),category.getCategoryDesc()};
		this.exesql(conn, sql, params);
	}

	public void delete(Connection conn, int categoryId) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from categorys where categoryId=?";
		Object[] params={categoryId};
		this.exesql(conn, sql, params);
	}

	public void update(Connection conn, Categorys category) throws Exception {
		// TODO Auto-generated method stub
		String sql="update categorys set categoryName=?,categoryDesc=? where categoryId=?";
		Object[] params={category.getCategoryName(),category.getCategoryDesc(),category.getCategoryId()};
		this.exesql(conn, sql, params);
	}

	public PageModel<Categorys> queryCategorys(Connection conn,
			int currentPage, int pagesize) throws Exception {
		PageModel<Categorys> pageModel=new PageModel<Categorys>();
		List<Categorys> list=new ArrayList<Categorys>();
		String sql="select * from(select rownum rn,ca.* from(select * from categorys order by categoryId) ca where rownum<=?) where rn>?";
		Object[] params={currentPage*pagesize,(currentPage-1)*pagesize};
		ResultSet rs=this.getRs(conn, sql, params);
		while(rs.next()){
			Categorys category=new Categorys();
			category.setCategoryId(rs.getInt("categoryId"));
			category.setCategoryName(rs.getString("categoryName"));
			category.setCategoryDesc(rs.getString("categoryDesc"));
			list.add(category);
		}
		pageModel.setList(list);
		pageModel.setCurrentPage(currentPage);
		pageModel.setPagesize(pagesize);
		pageModel.setTotalRecord(this.rowCount(conn, "select count(*) from categorys",null));
		return pageModel;
	}

	public Categorys findByCategoryId(Connection conn, int categoryId)
			throws Exception {
		Categorys category=new Categorys();
		String sql="select * from categorys where categoryId=?";
		Object[] params={categoryId};
		ResultSet rs=this.getRs(conn, sql, params);
		if(rs.next()){
			category.setCategoryId(categoryId);
			category.setCategoryName(rs.getString("categoryName"));
			category.setCategoryDesc(rs.getString("categoryDesc"));
		}
		return category;
	}

	public List<Categorys> findAll(Connection conn) throws Exception {
		List<Categorys> list=new ArrayList<Categorys>();
		String sql="select * from categorys";
		ResultSet rs=this.getRs(conn, sql, null);
		while(rs.next()){
			Categorys category=new Categorys();
			category.setCategoryId(rs.getInt("categoryId"));
			category.setCategoryName(rs.getString("categoryName"));
			category.setCategoryDesc(rs.getString("categoryDesc"));
			list.add(category);
		}
		return list;
	}

	public Categorys findByCategoryName(Connection conn, String categoryName)
			throws Exception {
		Categorys category=new Categorys();
		String sql="select * from categorys where categoryName=?";
		Object[] params={categoryName};
		ResultSet rs=this.getRs(conn, sql, params);
		if(rs.next()){
			category.setCategoryId(rs.getInt("categoryId"));
			category.setCategoryName(rs.getString("categoryName"));
			category.setCategoryDesc(rs.getString("categoryDesc"));
		}
		return category;
	}

}
