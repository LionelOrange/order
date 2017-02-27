package com.serviceDao;

import com.bean.Provider;
import com.db.PageModel;

public interface ProviderServiceDao {
	public void save(Provider pr);
	public void delete(int providerId);
	public Provider findByProviderId(int providerId);
	public void update(Provider pr);
	public PageModel<Provider> queryProvider(int currentPage,int pagesize);
	public Provider findByProviderName(String providerName);
}
