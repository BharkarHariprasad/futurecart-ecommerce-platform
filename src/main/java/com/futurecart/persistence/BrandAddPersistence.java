package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.futurecart.data_access.BrandAddConnectivity;

public class BrandAddPersistence implements BrandAddConnectivity {

	@Override
	public boolean storeBrand(String brandName, int categoryId) {
		
		try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String query = "INSERT INTO brands (brand_name, category_id) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, brandName);
            ps.setInt(2, categoryId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
		return false;
	}

}
