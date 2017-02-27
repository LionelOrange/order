package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Employees;
import com.db.PageModel;

public class EmployeeDaoImpl extends BaseDao implements EmployeeDao {

	public void add(Connection conn, Employees employee) throws Exception {
		String sql="insert into employees(empId,empName,hireDate,sal,psw)values(?,?,?,?,?)";
		Object[] params={employee.getEmpId(),employee.getEmpName(),employee.getHireDate(),employee.getSal(),employee.getPsw()};
		this.exesql(conn, sql, params);
	}

	public void delete(Connection conn, int employeeId) throws Exception {
		String sql="delete from employees where empId=?";
		Object[] params={employeeId};
		this.exesql(conn, sql, params);
	}

	public void update(Connection conn, Employees employee) throws Exception {
		String sql="update employees set empName=?, hireDate=?,sal=?,psw=? where empId=?";
		Object[] params={employee.getEmpName(),employee.getHireDate(),employee.getSal(),employee.getPsw(),employee.getEmpId()};
		this.exesql(conn, sql, params);
	}

	public Employees findByEmployeeId(Connection conn, int employeeId)
			throws Exception {
		Employees employee=new Employees();
		String sql="select * from employees where empId=?";
		Object[] params={employeeId};
		ResultSet rs=this.getRs(conn, sql, params);
		if(rs.next()){
			employee.setEmpId(rs.getInt("empId"));
			employee.setEmpName(rs.getString("empName"));
			employee.setHireDate(rs.getString("hireDate"));
			employee.setSal(rs.getInt("sal"));
			employee.setPsw(rs.getInt("psw"));
		}
		return employee;
	}

	public List<Employees> findAll(Connection conn) throws Exception {
		List<Employees> list=new ArrayList<Employees>();
		String sql="select * from employees";
		ResultSet rs=this.getRs(conn, sql, null);
		while(rs.next()){
			Employees employee=new Employees();
			employee.setEmpId(rs.getInt("empId"));
			employee.setEmpName(rs.getString("empName"));
			employee.setHireDate(rs.getString("hireDate"));
			employee.setSal(rs.getInt("sal"));
			employee.setPsw(rs.getInt("psw"));
			list.add(employee);
		}
		return list;
	}

	public PageModel<Employees> queryEmployees(Connection conn,
			int currentPage, int pagesize) throws Exception {
		PageModel<Employees> pageModel=new PageModel<Employees>();
		List<Employees> list=new ArrayList<Employees>();
		String sql="select * from (select rownum rn,em.* from(select * from employees order by empId)em where rownum<=?)where rn>?";
		Object[] params={currentPage*pagesize,(currentPage-1)*pagesize};
		ResultSet rs=this.getRs(conn, sql,params);
		while(rs.next()){
			Employees employee=new Employees();
			employee.setEmpId(rs.getInt("empId"));
			employee.setEmpName(rs.getString("empName"));
			employee.setHireDate(rs.getString("hireDate"));
			employee.setSal(rs.getInt("sal"));
			employee.setPsw(rs.getInt("psw"));
			list.add(employee);
		}
		pageModel.setList(list);
		pageModel.setCurrentPage(currentPage);
		pageModel.setPagesize(pagesize);
		pageModel.setTotalRecord(this.rowCount(conn,"select count(*) from employees",null));
		return pageModel;
	}

	public Employees login(Connection conn, String empName, int psw)
			throws Exception {
		Employees employee=new Employees();
		String sql="select * from employees where empName=? and psw=?";
		Object[] params={empName,psw};
		ResultSet rs=this.getRs(conn, sql, params);
		if(rs.next()){
			employee.setEmpId(rs.getInt("empId"));
			employee.setEmpName(rs.getString("empName"));
			employee.setHireDate(rs.getString("hireDate"));
			employee.setSal(rs.getInt("sal"));
			employee.setPsw(rs.getInt("psw"));
		}
		return employee;
	}

}
