package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	//Declare variable
	private static Connection conn;
	//Create Connection Method
	public static Connection  getConn() {
		
		try {
			//Driver Loaded
			Class.forName("com.mysql.cj.jdbc.Driver");
			//Connection
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_dbs","root","Ranjan@7894");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return conn;
	}
	
	
	

}
