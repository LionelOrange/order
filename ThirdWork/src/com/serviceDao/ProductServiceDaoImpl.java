package com.serviceDao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bean.Categorys;
import com.bean.Products;
import com.bean.Provider;
import com.dao.CategoryDao;
import com.dao.CategoryDaoImpl;
import com.dao.ProductDao;
import com.dao.ProductDaoImpl;
import com.dao.ProviderDao;
import com.dao.ProviderDaoImpl;
import com.db.DBHelper;
import com.db.PageModel;

public class ProductServiceDaoImpl implements ProductServiceDao {

	public void save(Products product) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			ProductDao dao=new ProductDaoImpl();
			dao.add(conn, product);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				DBHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void delete(int productId) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			ProductDao dao=new ProductDaoImpl();
			dao.delete(conn, productId);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				DBHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void update(Products product) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			ProductDao dao=new ProductDaoImpl();
			dao.update(conn, product);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				DBHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public Products findByProductId(int productId) {
		Connection conn=null;
		Products product=new Products();
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			ProductDao dao=new ProductDaoImpl();
			product=dao.findByProductId(conn, productId);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				DBHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return product;
	}

	public PageModel<Products> queryProducts(int currentPage, int pagesize) {
		Connection conn=null;
		PageModel<Products> pageModel=new PageModel<Products>();
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			ProductDao dao=new ProductDaoImpl();
			pageModel=dao.queryProducts(conn, currentPage, pagesize);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				DBHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return pageModel;
	}

	public Map<String, Object> toAddProduct() {
		Connection conn=null;
		Map<String, Object> maps=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			CategoryDao categoryDao=new CategoryDaoImpl();
			ProviderDao providerDao=new ProviderDaoImpl();
			List<Categorys> categoryList=categoryDao.findAll(conn);
			List<Provider> providerList=providerDao.findAll(conn);
			maps=new HashMap<String, Object>();
			maps.put("categoryList", categoryList);
			maps.put("providerList", providerList);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				DBHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return maps;
	}

}
