package com.futurecart.persistence;

import java.sql.*;

import com.futurecart.data_access.AdminViewUserConnectivity;
import com.futurecart.model.User;

public class AdminViewUserPersistence
        implements AdminViewUserConnectivity {

    @Override
    public User getUserById(int userId) {

        User u = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String sql =
                "SELECT UserId, FullName, Email, Mobile, created_at, active " +
                "FROM users WHERE UserId = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u = new User();
                u.setUserId(rs.getInt("UserId"));
                u.setFullName(rs.getString("FullName"));
                u.setEmail(rs.getString("Email"));
                u.setMobile(rs.getString("Mobile"));
                u.setCreatedAt(rs.getString("created_at"));
                u.setActive(rs.getInt("active"));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }
}