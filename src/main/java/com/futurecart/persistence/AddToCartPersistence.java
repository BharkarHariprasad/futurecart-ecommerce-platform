package com.futurecart.persistence;

import java.sql.*;
import com.futurecart.data_access.AddToCartConnectivity;

public class AddToCartPersistence implements AddToCartConnectivity {

    public void addToCart(int userId, int productId) {
        try {
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart","root","Hari@9970");

            String sql =
              "INSERT INTO cart(user_id, product_id, quantity) VALUES(?,?,1) " +
              "ON DUPLICATE KEY UPDATE quantity = quantity + 1";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}