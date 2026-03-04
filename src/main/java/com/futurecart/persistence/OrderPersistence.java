package com.futurecart.persistence;

import java.sql.*;
import java.util.ArrayList;

import com.futurecart.model.Order;

public class OrderPersistence {

    public ArrayList<Order> getOrdersByUser(int userId) {

        ArrayList<Order> list = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root", "Hari@9970"
            );

            String sql =
                "SELECT order_id, total_amount, order_status, order_date " +
                "FROM orders WHERE user_id=? ORDER BY order_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setStatus(rs.getString("order_status"));
                o.setOrderDate(rs.getTimestamp("order_date"));
                list.add(o);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}