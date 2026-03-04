package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.futurecart.data_access.UserBrandListConnectivity;
import com.futurecart.model.Brand;

public class UserBrandListPersistence implements UserBrandListConnectivity  {

	@Override
	public ArrayList<Brand> brandByCategory(int categoryId) {
		
		ArrayList<Brand> list = new ArrayList<>();

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection(
	            "jdbc:mysql://localhost:3306/Future_Cart",
	            "root",
	            "Hari@9970"
	        );

	        String sql =
	            "SELECT brand_id, brand_name FROM brands WHERE category_id = ?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, categoryId);

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Brand b = new Brand();
	            b.setBrandId(rs.getInt("brand_id"));
	            b.setBrandName(rs.getString("brand_name"));
	            list.add(b);
	        }

	        con.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

}
