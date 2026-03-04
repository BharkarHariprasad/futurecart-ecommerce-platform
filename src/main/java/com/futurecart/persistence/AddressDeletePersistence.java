package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.futurecart.data_access.AddressDeleteConnectivity;
import com.futurecart.model.Address;

public class AddressDeletePersistence implements AddressDeleteConnectivity {

	@Override
	public boolean deleteAddress(int addressId, int userId) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Future_Cart","root","Hari@9970");
			String query = "DELETE FROM User_Address WHERE AddressId = ? AND UserId = ?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, addressId);
			pstmt.setInt(2, userId);
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
}
