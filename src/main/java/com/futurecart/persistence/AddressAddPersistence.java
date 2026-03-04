package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.futurecart.data_access.AddressAddConnectivity;

public class AddressAddPersistence implements AddressAddConnectivity {

	@Override
	public boolean storeAddress(int userId, String fullName, String mobile, String pincode, String addressType, String addressLine1,
			String addressLine2, String city, String state) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Future_Cart","root","Hari@9970");
			String query = "INSERT INTO User_Address (UserId, FullName, Mobile, Pincode, addressType, addressLine1, addressLine2, city, state)" 
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
			pstmt.setString(2, fullName);
			pstmt.setString(3, mobile);
			pstmt.setString(4, pincode);
			pstmt.setString(5, addressType);
			pstmt.setString(6, addressLine1);
			pstmt.setString(7, addressLine2);
			pstmt.setString(8, city);
			pstmt.setString(9, state);
			
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
