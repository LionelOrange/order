package com.dao;

import java.sql.Connection;
import java.util.List;
import com.bean.Provider;
import com.db.PageModel;

public interface ProviderDao {
	public void add(Connection conn,Provider provider)throws Exception;
	public void delete(Connection conn,int providerId)throws Exception;
	public Provider findByProviderId(Connection conn,int providerId)throws Exception;
	public void update(Connection conn,Provider provider)throws Exception;
	public PageModel<Provider> query(Connection conn,int currentPage,int pagesize)throws Exception;
	public List<Provider> findAll(Connection conn)throws Exception;
	public Provider findByProviderName(Connection conn,String providerName)throws Exception;
}
