package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.futurecart.data_access.AdminUserStatusConnectivity;

public class AdminUserStatusPersistence
        implements AdminUserStatusConnectivity {

    @Override
    public boolean updateUserStatus(int userId, int status) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String sql = "UPDATE users SET active = ? WHERE UserId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, userId);

            int rows = ps.executeUpdate();
            con.close();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}