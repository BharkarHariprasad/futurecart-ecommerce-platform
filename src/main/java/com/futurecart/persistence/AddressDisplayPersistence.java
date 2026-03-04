package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.futurecart.data_access.AddressDisplayConnectivity;
import com.futurecart.model.Address;

public class AddressDisplayPersistence implements AddressDisplayConnectivity {

	@Override
	public ArrayList getAddressList(int userId) {
		
		ArrayList<Address> list = new ArrayList<Address>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Future_Cart","root","Hari@9970");
			String query = "SELECT AddressId, UserId, FullName, Mobile, Pincode, AddressType, AddressLine1, AddressLine2, City, State "
                    + "FROM User_Address WHERE UserId = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

			    Address address = new Address();
			    
			    address.setAddressId(rs.getInt("AddressId"));
			    address.setFullName(rs.getString("FullName"));
			    address.setMobile(rs.getString("Mobile"));
			    address.setPincode(rs.getString("Pincode"));
			    address.setAddressType(rs.getString("AddressType"));
			    address.setAddressLine1(rs.getString("AddressLine1"));
			    address.setAddressLine2(rs.getString("AddressLine2"));
			    address.setCity(rs.getString("City"));
			    address.setState(rs.getString("State"));

			    list.add(address);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
