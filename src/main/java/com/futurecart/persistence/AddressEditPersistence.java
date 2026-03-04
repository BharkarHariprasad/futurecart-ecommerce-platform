package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.futurecart.data_access.AddressEditConnectivity;
import com.futurecart.model.Address;

public class AddressEditPersistence implements AddressEditConnectivity {

	@Override
	public Address getAddress(int addressId, int userId) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Future_Cart","root","Hari@9970");
			String query = "SELECT AddressId, UserId, FullName, Mobile, Pincode, AddressType, AddressLine1, AddressLine2, City, State "
                    + "FROM User_Address WHERE AddressId = ? and UserId = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, addressId);
			pstmt.setInt(2, userId);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

			    Address address = new Address();
			    
			    address.setAddressId(rs.getInt("AddressId"));
			    address.setUserId(rs.getInt("UserId"));
			    address.setFullName(rs.getString("FullName"));
			    address.setMobile(rs.getString("Mobile"));
			    address.setPincode(rs.getString("Pincode"));
			    address.setAddressType(rs.getString("AddressType"));
			    address.setAddressLine1(rs.getString("AddressLine1"));
			    address.setAddressLine2(rs.getString("AddressLine2"));
			    address.setCity(rs.getString("City"));
			    address.setState(rs.getString("State"));

			    return address;
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
