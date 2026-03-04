package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.futurecart.data_access.AddressUpdateConnectivity;
import com.futurecart.model.Address;

public class AddressUpdatePersistence implements AddressUpdateConnectivity {

	@Override
	public void updateAddress(Address address) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Future_Cart","root","Hari@9970");
			String query = "Update User_Address set FullName = ?, Mobile = ?, Pincode = ?, AddressType = ?, AddressLine1 = ?, AddressLine2 = ?, City = ?, State = ? where AddressId = ? and UserId = ?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, address.getFullName());
            pstmt.setString(2, address.getMobile());
            pstmt.setString(3, address.getPincode());
            pstmt.setString(4, address.getAddressType());
            pstmt.setString(5, address.getAddressLine1());
            pstmt.setString(6, address.getAddressLine2());
            pstmt.setString(7, address.getCity());
            pstmt.setString(8, address.getState());
            pstmt.setInt(9, address.getAddressId());
            pstmt.setInt(10, address.getUserId());

			
            pstmt.executeUpdate();

            pstmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
