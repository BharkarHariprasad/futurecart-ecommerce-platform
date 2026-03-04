package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.futurecart.data_access.SignUpConnectivity;

public class SignUpPersistence implements SignUpConnectivity {

	@Override
	public boolean storeUser(String fullName, String email, String mobile) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Future_Cart","root","Hari@9970");
			String query = "INSERT INTO Users (FullName, Email, Mobile)" 
                    + "VALUES (?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, fullName);
			pstmt.setString(2, email);
			pstmt.setString(3, mobile);
//			pstmt.setString(5, hashPassword);
//			pstmt.setString(6, password);
			
			int insertQuery = pstmt.executeUpdate();
			if(insertQuery > 0) {
				return true;
			}
			else {
				return false;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
