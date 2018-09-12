package com.ktds.crmai.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ktds.crmai.vo.TableMake_Query;

public class TableDAO {
	private Statement stmt;

	private Connection getConn() throws SQLException, ClassNotFoundException {
		String jdbc_driver = "oracle.jdbc.OracleDriver";
		String db_url = "jdbc:oracle:thin:@crmai.iptime.org:1521:xe";
		String db_id = "aiadm";
		String db_pw = "aiadm";

		Class.forName(jdbc_driver);
		Connection conn = DriverManager.getConnection(db_url, db_id, db_pw);
		return conn;
	} 

	public String create_table(TableMake_Query query){
		Connection conn = null;
		String msg = null;
		try {
			conn = getConn();

			// 드라이버 연결위한 준비  conn객체 생성.
			stmt = conn.createStatement();

			String sql = query.toString();
			ResultSet rs = stmt.executeQuery(sql);
			
		}catch (ClassNotFoundException e) {
			System.err.println("Oracle Driver not Found!");
		} catch(SQLException e) {
			System.err.println("create_table SQL 오류 :: " + e.getMessage() + " :: " + query);
			
			msg = e.getMessage();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(final SQLException e) {
				
			}
			return msg;
		}
	}
	
	
	public String insertData_Pretreatment(ArrayList<String> list){
		Connection conn = null;
		String query = null;
		String msg = null;
		try {
			conn = getConn();
			
			// 드라이버 연결위한 준비  conn객체 생성.
			stmt = conn.createStatement();

			for(int i = 0; i < list.size(); i++) {
				
				query = list.get(i);
				
				stmt.executeUpdate(query);
				
			}
			
			
		}catch (ClassNotFoundException e) {
			System.err.println("Oracle Driver not Found!");
		} catch(SQLException e) {
			System.err.println("insertData_Pretreatment SQL 오류 :: " + e.getMessage() + " :: " + query);
			
			msg = e.getMessage();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(final SQLException e) {
				
			}
			return msg;
		}
	}

}
