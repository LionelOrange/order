package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBHelper {
	public static Connection getConn() throws Exception{
		Connection conn=null;
		Class.forName("oracle.jdbc.OracleDriver");
		conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
		return conn;
	}
	public static void closeAll(Connection conn) throws Exception{
		if(conn!=null){
			conn.close();
		}
	}
}
