package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.futurecart.data_access.CategoryAddConnectivity;

public class CategoryAddPersistence implements CategoryAddConnectivity {

	@Override
	public boolean insertCategory(String categoryName) {
		boolean result = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/Future_Cart",
                    "root",
                    "Hari@9970"
            );

            String query = "INSERT INTO categories (category_name) VALUES (?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, categoryName);

            int count = pstmt.executeUpdate();
            result = count > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
		return result;
	}

}
