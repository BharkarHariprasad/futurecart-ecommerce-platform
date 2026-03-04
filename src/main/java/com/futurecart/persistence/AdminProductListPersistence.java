package com.futurecart.persistence;

import java.sql.*;
import java.util.ArrayList;

import com.futurecart.data_access.AdminProductListConnectivity;
import com.futurecart.model.Product;

public class AdminProductListPersistence
        implements AdminProductListConnectivity {

    @Override
    public ArrayList<Product> getAllProducts() {

        ArrayList<Product> list = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String sql = "SELECT * FROM products ORDER BY created_at DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();

                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescription(rs.getString("description"));
                p.setImageUrl(rs.getString("product_image"));
//                p.setStock(rs.getInt("stock"));
                p.setFeaturedProduct(rs.getString("is_featured"));

                list.add(p);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}