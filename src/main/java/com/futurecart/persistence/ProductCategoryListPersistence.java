package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.futurecart.data_access.ProductCategoryListConnectivity;
import com.futurecart.model.Product;

public class ProductCategoryListPersistence implements ProductCategoryListConnectivity {

	@Override
	public ArrayList<Product> getProduct(int categoryId) {
		
		ArrayList<Product> list = new ArrayList<>();

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Future_Cart","root","Hari@9970");

            String sql = "SELECT * FROM products WHERE category_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);
                
            ps.setInt(1, categoryId);

            ResultSet rs = ps.executeQuery();

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
