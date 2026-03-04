package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.futurecart.data_access.AddProductConnectivity;

public class AddProductPersistence implements AddProductConnectivity {

	@Override
	public boolean addProduct(String name, int brandId, int categoryId, double price, String description, String image, String featuredProduct) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Future_Cart","root","Hari@9970");
			String query = """
	                INSERT INTO products
	                (product_name, brand_id, category_id, price, description, product_image, is_featured)
	                VALUES (?, ?, ?, ?, ?, ?, ?)""";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setInt(2, brandId);
			pstmt.setInt(3, categoryId);
			pstmt.setDouble(4, price);
			pstmt.setString(5, description);
			pstmt.setString(6, image);
			pstmt.setString(7, featuredProduct);
//			pstmt.setInt(7, stockString);
			
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
