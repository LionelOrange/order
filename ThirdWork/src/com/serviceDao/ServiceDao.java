package com.serviceDao;

import com.bean.Categorys;
import com.db.PageModel;

public interface ServiceDao {
	public void save(Categorys category);
	public void delete(int categoryId);
	public void update(Categorys category);
	public Categorys findByCategoryId(int categoryId);
	public Categorys findByCategoryName(String categoryName);
	public PageModel<Categorys> queryCategorys(int currentPage,int pagesize);
}
