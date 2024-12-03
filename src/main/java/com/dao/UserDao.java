package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

//Write the code for all the operation
public class UserDao {
	//Create Variable in Connection 
	public Connection conn;
   //Create a Parameter Constructor then pass Variable
	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	//Crate Register Method
	public boolean register(User u) {
		boolean f=false;
		try {
			//Write Queries 
			String sql="insert into user_details(full_name,email,password) values(?,?,?)";
			
			//Create Prepared Statement
			PreparedStatement ps=conn.prepareStatement(sql);
			//Set The Value
			ps.setString(1,u.getFullName());
			ps.setString(2,u.getEmail());
			ps.setString(3, u.getPassword());
			//Execute Queries to store a variable
			int i=ps.executeUpdate();
			
			//Check the code is running or not
			if(i==1) {
				f=true;
			}
			
			 
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	//Create login method
		public User login(String em,String psw) {
			User u=null;
			try {
				String sql="select * from user_details where email=? and password=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1,em);
				ps.setString(2, psw);
				ResultSet rs=ps.executeQuery();
				
				while(rs.next()) {
					
					u=new User();
					u.setId(rs.getInt(1));
					u.setFullName(rs.getString(2));
					u.setEmail(rs.getString(3));
					u.setPassword(rs.getString(4));
					
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return u;
		}
		
	//Check Old Password
		public boolean checkOldPassword(int userid,String oldPassword) {
			boolean f=false;
			try {
				String sql="select * from user_details where id=? and password=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setInt(1, userid);
				ps.setString(2, oldPassword);
				
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					f=true;
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return f;
		}
	
		//Update Password (New Password)
				public boolean channgePassword(int userid,String newPassword) {
					boolean f=false;
					try {
						String sql="update user_details set password=? where id=?";
						PreparedStatement ps=conn.prepareStatement(sql);
						ps.setString(1,newPassword );
						ps.setInt(2, userid);
						
						int i = ps.executeUpdate();
						if(i==1) {
							f=true;
						}
						
					}catch(Exception e) {
						e.printStackTrace();
					}
					return f;
				}
}
