package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.futurecart.model.Order;

public class AdminOrderPersistence {

    public ArrayList<Order> getAllOrders() {

        ArrayList<Order> list = new ArrayList<>();

        try {
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root","Hari@9970"
            );

            String sql =
                "SELECT * FROM orders ORDER BY order_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUserId(rs.getInt("user_id"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setStatus(rs.getString("status"));
                o.setOrderDate(rs.getTimestamp("order_date"));

                list.add(o);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void updateOrderStatus(int orderId, String status) {

        try {
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root","Hari@9970"
            );

            String sql =
                "UPDATE orders SET status=? WHERE order_id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, orderId);
            ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}