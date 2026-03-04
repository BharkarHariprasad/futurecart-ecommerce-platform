package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.futurecart.data_access.AdminConnectivity;
import com.futurecart.model.Admin;

public class AdminPersistence implements AdminConnectivity {

	@Override
	public Admin validAdmin(String adminEmail, String password) {
		
		Admin admin = new Admin();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Future_Cart","root","Hari@9970");
			String query = "select full_name, email, password from admin where email = ? and password = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, adminEmail);
			pstmt.setString(2, password);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				admin.setEmail(rs.getString("email"));
				admin.setFullName(rs.getString("full_name"));
			}
			
			
		 } catch (ClassNotFoundException e) {
			e.printStackTrace();
		 } catch (SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}

}
