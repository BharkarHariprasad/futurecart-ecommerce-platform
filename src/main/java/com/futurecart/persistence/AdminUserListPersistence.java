package com.futurecart.persistence;

import java.sql.*;
import java.util.ArrayList;

import com.futurecart.data_access.AdminUserListConnectivity;
import com.futurecart.model.User;

public class AdminUserListPersistence
        implements AdminUserListConnectivity {

    @Override
    public ArrayList<User> getAllUsers() {

        ArrayList<User> list = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String sql =
                "SELECT UserId, FullName, Email, Mobile, created_at, active FROM users";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("UserId"));
                u.setFullName(rs.getString("FullName"));
                u.setEmail(rs.getString("Email"));
                u.setMobile(rs.getString("Mobile"));
                u.setCreatedAt(rs.getString("created_at"));
                u.setActive(rs.getInt("active"));
                list.add(u);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}