package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.futurecart.data_access.LoginConnectivity;

public class LoginPersistence implements LoginConnectivity {

	@Override
	public int verifyUser(String loginId) {
		
		 int userId = 0;

		    try {
		        Class.forName("com.mysql.cj.jdbc.Driver");

		        Connection con = DriverManager.getConnection(
		            "jdbc:mysql://localhost:3306/Future_Cart",
		            "root",
		            "Hari@9970"
		        );

		        String query =
		            "SELECT UserId, active FROM Users WHERE Mobile = ? OR Email = ?";

		        PreparedStatement pstmt = con.prepareStatement(query);
		        pstmt.setString(1, loginId);
		        pstmt.setString(2, loginId);

		        ResultSet rs = pstmt.executeQuery();

		        if (rs.next()) {

		            int active = rs.getInt("active");

		            if (active == 1) {
		                userId = rs.getInt("UserId");
		            } else {
		                userId = -1;
		            }
		        }

		        con.close();

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return userId;
		    
	}

}
