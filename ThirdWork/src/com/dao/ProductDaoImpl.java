package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Categorys;
import com.bean.Products;
import com.db.PageModel;

public class ProductDaoImpl extends BaseDao implements ProductDao {

	public void add(Connection conn, Products product) throws Exception {
		String sql="insert into products(productId,productName,incomePrice,providerId,salesPrice,categoryId)values(?,?,?,?,?,?)";
		Object[] params={product.getProductId(),product.getProductName(),product.getIncomePrice(),product.getProviderId(),product.getSalesPrice(),product.getCategoryId()};
		this.exesql(conn, sql, params);
	}

	public void delete(Connection conn, int productId) throws Exception {
		String sql="delete from products where productId=?";
		Object[] params={productId};
		this.exesql(conn, sql, params);
	}

	public void update(Connection conn, Products product) throws Exception {
		String sql="update products set productName=?,incomePrice=?,providerId=?,salesPrice=?,categoryId=? where productId=?";
		Object[] params={product.getProductName(),product.getIncomePrice(),product.getProviderId(),product.getSalesPrice(),product.getCategoryId(),product.getProductId()};
		this.exesql(conn, sql, params);
	}

	public Products findByProductId(Connection conn, int productId)
			throws Exception {
		Products pr=new Products();
		String sql="select * from products where productId=?";
		Object[] params={productId};
		ResultSet rs=this.getRs(conn, sql, params);
		if(rs.next()){
			pr.setProductId(rs.getInt("productId"));
	    	pr.setProductName(rs.getString("productName"));
	    	pr.setIncomePrice(rs.getInt("incomePrice"));
	    	pr.setProviderId(rs.getInt("providerId"));
	    	pr.setSalesPrice(rs.getInt("salesPrice"));
	    	pr.setCategoryId(rs.getInt("categoryId"));
		}
		return pr;
	}

	public PageModel<Products> queryProducts(Connection conn, int currentPage,
			int pagesize) throws Exception {
		PageModel<Products> pageModel=new PageModel<Products>();
		List<Products> list=new ArrayList<Products>();
		String sql="select * from(select rownum rn,pr.* from(select * from products order by productId) pr where rownum<=?) where rn>?";
		Object[] params={currentPage*pagesize,(currentPage-1)*pagesize};
		ResultSet rs=this.getRs(conn, sql, params);
		while(rs.next()){
			Products pr=new Products();
			pr.setProductId(rs.getInt("productId"));
	    	pr.setProductName(rs.getString("productName"));
	    	pr.setIncomePrice(rs.getInt("incomePrice"));
	    	pr.setProviderId(rs.getInt("providerId"));
	    	pr.setSalesPrice(rs.getInt("salesPrice"));
	    	pr.setCategoryId(rs.getInt("categoryId"));
			list.add(pr);
		}
		pageModel.setList(list);
		pageModel.setCurrentPage(currentPage);
		pageModel.setPagesize(pagesize);
		pageModel.setTotalRecord(this.rowCount(conn, "select count(*) from products",null));
		return pageModel;
	}

}
