package com.serviceDao;

import java.sql.Connection;
import java.sql.SQLException;

import com.bean.Categorys;
import com.dao.CategoryDao;
import com.dao.CategoryDaoImpl;
import com.db.DBHelper;
import com.db.PageModel;

public class ServiceDaoImpl implements ServiceDao {

	public void update(Categorys category){
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			CategoryDao dao=new CategoryDaoImpl();
			dao.update(conn, category);
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
	public void save(Categorys category) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			CategoryDao dao=new CategoryDaoImpl();
			dao.add(conn, category);
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

	public PageModel<Categorys> queryCategorys(int currentPage, int pagesize) {
		Connection conn=null;
		PageModel<Categorys> pageModel=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			CategoryDao dao=new CategoryDaoImpl();
			pageModel=dao.queryCategorys(conn, currentPage, pagesize);
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

	public void delete(int categoryId) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			CategoryDao dao=new CategoryDaoImpl();
			dao.delete(conn, categoryId);
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
	public Categorys findByCategoryId(int categoryId) {
		Connection conn=null;
		Categorys category=new Categorys();
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			CategoryDao dao=new CategoryDaoImpl();
			category=dao.findByCategoryId(conn, categoryId);
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
		return category;
	}
	public Categorys findByCategoryName(String categoryName) {
		Connection conn=null;
		Categorys category=new Categorys();
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			CategoryDao dao=new CategoryDaoImpl();
			category=dao.findByCategoryName(conn, categoryName);
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
		return category;
	}
}
