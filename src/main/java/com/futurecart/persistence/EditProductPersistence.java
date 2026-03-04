package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.futurecart.data_access.EditProductConnectivity;
import com.futurecart.model.Product;

public class EditProductPersistence
        implements EditProductConnectivity {

    @Override
    public Product getProductById(int productId) {

        Product p = null;

        try {
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String sql = "SELECT * FROM products WHERE product_id=?";
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
                p.setFeaturedProduct(rs.getString("is_featured"));
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }
}