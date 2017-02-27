package com.test;

import java.util.List;

import com.bean.Categorys;
import com.bean.Provider;
import com.db.PageModel;
import com.serviceDao.ProviderServiceDao;
import com.serviceDao.ProviderServiceDaoImpl;
import com.serviceDao.ServiceDao;
import com.serviceDao.ServiceDaoImpl;

import junit.framework.TestCase;

public class CategoryTest extends TestCase{
	public void testUpdate(){
		ServiceDao dao=new ServiceDaoImpl();
		Categorys category=new Categorys();
		category.setCategoryId(14);
		category.setCategoryName("sds");
		category.setCategoryDesc("fdsf");

	}
	public void testDelete(){
		ServiceDao dao=new ServiceDaoImpl();
		dao.delete(11);
	}
	public void testAddCategory(){
		Categorys category=new Categorys();
		category.setCategoryId(11);
		category.setCategoryName("sds");
		category.setCategoryDesc("fdsf");
		ServiceDao dao=new ServiceDaoImpl();
		dao.save(category);
	}
	public void testQueryCategory(){
		PageModel<Categorys> pageModel=null;
		ServiceDao dao=new ServiceDaoImpl();
		pageModel=dao.queryCategorys(3,2);
		List<Categorys> list=pageModel.getList();
		for(Categorys ca:list){
			System.out.println(ca.getCategoryId()+":"+ca.getCategoryName()+":"+ca.getCategoryDesc());
		}
	}
	public void testAddProvider(){
		Provider pr=new Provider();
		pr.setProviderId(1);
		pr.setProviderName("dsd");
		pr.setProviderAdd("sdas");
		pr.setProviderTel(2243);
		pr.setAccount("sds");
		pr.setEmail("sdaa");
		ProviderServiceDao dao=new ProviderServiceDaoImpl();
		dao.save(pr);
	}
	public void testQueryProvider(){
		ProviderServiceDao dao=new ProviderServiceDaoImpl();
		PageModel<Provider> pageModel=dao.queryProvider(3,2);
		List<Provider> list=pageModel.getList();
		for(Provider p:list){
			System.out.println(p.getProviderId()+":"+p.getProviderName()+":");
		}
	}
}
