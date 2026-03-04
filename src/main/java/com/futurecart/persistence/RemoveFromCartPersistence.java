package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.futurecart.data_access.RemoveFromCartConnectivity;

public class RemoveFromCartPersistence
        implements RemoveFromCartConnectivity {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/Future_Cart",
            "root",
            "Hari@9970"
        );
    }
    
    @Override
    public int getQuantity(int userId, int productId) {

        int qty = 0;
        String sql =
            "SELECT quantity FROM cart WHERE user_id=? AND product_id=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                qty = rs.getInt("quantity");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return qty;
    }
    
    @Override
    public void decreaseQuantity(int userId, int productId) {

        String sql =
            "UPDATE cart SET quantity = quantity - 1 " +
            "WHERE user_id=? AND product_id=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteProduct(int userId, int productId) {

        String sql =
            "DELETE FROM cart WHERE user_id=? AND product_id=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}