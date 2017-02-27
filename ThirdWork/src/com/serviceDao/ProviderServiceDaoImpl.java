package com.serviceDao;

import java.sql.Connection;
import java.sql.SQLException;

import com.bean.Provider;
import com.dao.ProviderDao;
import com.dao.ProviderDaoImpl;
import com.db.DBHelper;
import com.db.PageModel;

public class ProviderServiceDaoImpl implements ProviderServiceDao {

	public void save(Provider pr) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			ProviderDao dao=new ProviderDaoImpl();
			dao.add(conn,pr);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			};
		}finally{
			try {
				DBHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void delete(int providerId) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			ProviderDao dao=new ProviderDaoImpl();
			dao.delete(conn, providerId);
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

	public PageModel<Provider> queryProvider(int currentPage, int pagesize) {
		Connection conn=null;
		PageModel<Provider> pageModel=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			ProviderDao dao=new ProviderDaoImpl();
			pageModel=dao.query(conn, currentPage, pagesize);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return pageModel;
	}

	public Provider findByProviderId(int providerId) {
		Connection conn=null;
		Provider pr=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			ProviderDao dao=new ProviderDaoImpl();
			pr=dao.findByProviderId(conn, providerId);
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
		return pr;
	}

	public void update(Provider pr) {
		Connection conn=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			ProviderDao dao=new ProviderDaoImpl();
			dao.update(conn, pr);
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

	public Provider findByProviderName(String providerName) {
		Connection conn=null;
		Provider pr=null;
		try {
			conn=DBHelper.getConn();
			conn.setAutoCommit(false);
			ProviderDao dao=new ProviderDaoImpl();
			pr=dao.findByProviderName(conn, providerName);
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
		return pr;
	}

}
