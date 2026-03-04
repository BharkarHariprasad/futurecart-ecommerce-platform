package com.futurecart.persistence;

import java.sql.*;

import com.futurecart.data_access.CartCountConnectivity;

public class CartCountPersistence implements CartCountConnectivity {

    @Override
    public int getCartCount(int userId) {

        int count = 0;

        try {
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String sql =
              "SELECT SUM(quantity) FROM cart WHERE user_id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
}