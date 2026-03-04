package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.futurecart.data_access.ProductDetailsConnectivity;
import com.futurecart.model.Product;

public class ProductDetailsPersistence implements ProductDetailsConnectivity {

    @Override
    public Product getProductById(int productId) {

        Product p = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String sql = "SELECT * FROM products WHERE product_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, productId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescription(rs.getString("description"));
                p.setImageUrl(rs.getString("product_image"));
                p.setCategoryId(rs.getInt("category_id"));
                p.setBrandId(rs.getInt("brand_id"));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }
}