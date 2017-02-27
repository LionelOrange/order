package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Provider;
import com.db.PageModel;

public class ProviderDaoImpl extends BaseDao implements ProviderDao{
	public void add(Connection conn, Provider provider) throws Exception {
		String sql="insert into provider(providerId,providerName,providerAdd,providerTel,account,email)values(?,?,?,?,?,?)";
		Object[] params={provider.getProviderId(),provider.getProviderName(),provider.getProviderAdd(),provider.getProviderTel(),provider.getAccount(),provider.getEmail()};
		this.exesql(conn, sql, params);
	}

	public void delete(Connection conn, int providerId) throws Exception {
		String sql="delete from provider where providerId=?";
		Object[] params={providerId};
		this.exesql(conn, sql, params);
	}

	public void update(Connection conn, Provider provider) throws Exception {
		String sql="update provider set providerName=?,providerAdd=?,providerTel=?,account=?,email=? where providerId=?";
		Object[] params={provider.getProviderName(),provider.getProviderAdd(),provider.getProviderTel(),provider.getAccount(),provider.getEmail(),provider.getProviderId()};
		this.exesql(conn, sql, params);
	}

	public PageModel<Provider> query(Connection conn, int currentPage,
			int pagesize) throws Exception {
		PageModel<Provider> pageModel=new PageModel<Provider>();
		List<Provider> list=new ArrayList<Provider>();
		String sql="select * from (select rownum rn,pr.* from (select * from provider order by providerId)pr where rownum<=?)where rn>?";
		Object[] params={currentPage*pagesize,(currentPage-1)*pagesize};
		ResultSet rs=this.getRs(conn, sql, params);
		while(rs.next()){
			Provider pr=new Provider();
			pr.setProviderId(rs.getInt("providerId"));
			pr.setProviderName(rs.getString("providerName"));
			pr.setProviderAdd(rs.getString("providerAdd"));
			pr.setProviderTel(rs.getInt("providerTel"));
			pr.setAccount(rs.getString("account"));
			pr.setEmail(rs.getString("email"));
			list.add(pr);
		}
		pageModel.setList(list);
		pageModel.setCurrentPage(currentPage);
		pageModel.setPagesize(pagesize);
		pageModel.setTotalRecord(this.rowCount(conn, "select count(*) from provider", null));
		return pageModel;
	}

	public Provider findByProviderId(Connection conn, int providerId)
			throws Exception {
		Provider pr=new Provider();
		String sql="select * from provider where providerId=?";
		Object[] params={providerId};
		ResultSet rs=this.getRs(conn, sql, params);
		if(rs.next()){
			pr.setProviderId(rs.getInt("providerId"));
			pr.setProviderName(rs.getString("providerName"));
			pr.setProviderAdd(rs.getString("providerAdd"));
			pr.setProviderTel(rs.getInt("providerTel"));
			pr.setAccount(rs.getString("account"));
			pr.setEmail(rs.getString("email"));
		}
		return pr;
	}

	public List<Provider> findAll(Connection conn) throws Exception {
		List<Provider> list=new ArrayList<Provider>();
		String sql="select * from provider";
		ResultSet rs=this.getRs(conn, sql, null);
		while(rs.next()){
			Provider provider=new Provider();
			provider.setProviderId(rs.getInt("providerId"));
			provider.setProviderName(rs.getString("providerName"));
			provider.setProviderAdd(rs.getString("providerAdd"));
			provider.setProviderTel(rs.getInt("providerTel"));
			provider.setAccount(rs.getString("account"));
			provider.setEmail(rs.getString("email"));
			list.add(provider);
		}
		return list;
	}

	public Provider findByProviderName(Connection conn, String providerName)
			throws Exception {
		Provider pr=new Provider();
		String sql="select * from provider where providerName=?";
		Object[] params={providerName};
		ResultSet rs=this.getRs(conn, sql, params);
		if(rs.next()){
			pr.setProviderId(rs.getInt("providerId"));
			pr.setProviderName(rs.getString("providerName"));
			pr.setProviderAdd(rs.getString("providerAdd"));
			pr.setProviderTel(rs.getInt("providerTel"));
			pr.setAccount(rs.getString("account"));
			pr.setEmail(rs.getString("email"));
		}
		return pr;
	}
	
}
