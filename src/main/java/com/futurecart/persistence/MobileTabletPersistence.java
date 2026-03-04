package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.futurecart.data_access.MobileTabletConnectivity;
import com.futurecart.model.Product;

public class MobileTabletPersistence implements MobileTabletConnectivity {

	@Override
	public ArrayList<Product> getProduct(String category) {
		
		ArrayList<Product> list = new ArrayList<Product>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Future_Cart","root","Hari@9970");
			String query = "SELECT * FROM products WHERE category = ?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, category);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product p = new Product();
				p.setProductId(rs.getInt("productId"));
				p.setName(rs.getString("name"));
				p.setCategory(rs.getString("category"));
				p.setBrand(rs.getString("brand"));
				p.setDescription(rs.getNString("description"));
				p.setPrice(rs.getDouble("price"));
				p.setImageUrl(rs.getString("imageUrl"));
				
				list.add(p);
				
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
