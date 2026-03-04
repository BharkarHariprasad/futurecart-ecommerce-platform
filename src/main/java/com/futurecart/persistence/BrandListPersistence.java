package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.futurecart.data_access.BrandListConnectivity;
import com.futurecart.model.Brand;
import com.futurecart.model.Category;

public class BrandListPersistence implements BrandListConnectivity {

	@Override
	public ArrayList<Brand> brand() {
		
		ArrayList<Brand> list = new ArrayList<Brand>();
		
		try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart", "root", "Hari@9970");

            String query = "SELECT brand_id, brand_name FROM brands";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Brand b = new Brand();
                b.setBrandId(rs.getInt("brand_id"));
                b.setBrandName(rs.getString("brand_name"));
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
		return list;
	}

}
