package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.futurecart.data_access.AdminDeleteProductConnectivity;

public class AdminDeleteProductPersistence
        implements AdminDeleteProductConnectivity {

    @Override
    public boolean deleteProduct(int productId) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String sql = "DELETE FROM products WHERE product_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, productId);

            int rows = ps.executeUpdate();
            con.close();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}