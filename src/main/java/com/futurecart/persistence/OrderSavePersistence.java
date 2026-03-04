package com.futurecart.persistence;

import java.sql.*;
import java.util.ArrayList;

import com.futurecart.model.CartItem;

public class OrderSavePersistence {

    public int createOrder(int userId, double totalAmount) {

        int orderId = 0;

        try {
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root","Hari@9970"
            );

            String sql =
                "INSERT INTO orders (user_id, total_amount) VALUES (?, ?)";

            PreparedStatement ps =
                con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, userId);
            ps.setDouble(2, totalAmount);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderId;
    }

    public void saveOrderItems(int orderId,
                               ArrayList<CartItem> cart) {

        try {
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root","Hari@9970"
            );

            String sql =
                "INSERT INTO order_items " +
                "(order_id, product_name, price, quantity) " +
                "VALUES (?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            for (CartItem item : cart) {
                ps.setInt(1, orderId);
                ps.setString(2,
                    item.getProduct().getName());
                ps.setDouble(3,
                    item.getProduct().getPrice());
                ps.setInt(4, item.getQuantity());
                ps.addBatch();
            }

            ps.executeBatch();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}