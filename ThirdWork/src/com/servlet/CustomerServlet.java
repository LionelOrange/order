package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Customer;
import com.serviceDao.CustomerServiceDao;
import com.serviceDao.CustomerServiceDaoImpl;

public class CustomerServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String customerId=req.getParameter("customerId");
		CustomerServiceDao dao=new CustomerServiceDaoImpl();
		Customer customer=dao.findByCustomerId(Integer.parseInt(customerId));
		PrintWriter out=resp.getWriter();
		if(customer==null){
			out.write("顾客名字错误");
			out.flush();
		}else{
			out.write("");
			out.flush();
		}
		out.close();
	}
}
