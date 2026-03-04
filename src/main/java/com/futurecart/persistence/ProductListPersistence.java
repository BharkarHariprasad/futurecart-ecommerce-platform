package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.futurecart.data_access.ProductListConnectivity;
import com.futurecart.model.Product;

public class ProductListPersistence implements ProductListConnectivity {

	@Override
	public ArrayList<Product> getProduct(int brandId) {
		
		ArrayList<Product> list = new ArrayList<>();

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Future_Cart","root","Hari@9970");

            String query = "SELECT * FROM Products WHERE brand_id = ?";

            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setInt(1, brandId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Product p = new Product();

                p.setCategoryId(rs.getInt("category_id"));
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescription(rs.getString("description"));
                p.setImageUrl(rs.getString("product_image"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
	}

}
