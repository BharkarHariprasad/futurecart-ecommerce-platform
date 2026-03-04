package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.futurecart.data_access.CategoryListConnectivity;
import com.futurecart.model.Category;

public class CategoryListPersistence implements CategoryListConnectivity {

	@Override
	public ArrayList<Category> allCategory() {
		
		ArrayList<Category> list = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart", "root", "Hari@9970");

            String query = "SELECT category_id, category_name FROM categories";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Category c = new Category();
                c.setCategoryId(rs.getInt("category_id"));
                c.setCategoryName(rs.getString("category_name"));
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
		return list;
	}

}
