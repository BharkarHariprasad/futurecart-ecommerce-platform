package com.futurecart.persistence;

import java.sql.*;
import java.util.ArrayList;

import com.futurecart.data_access.CartConnectivity;
import com.futurecart.model.CartItem;
import com.futurecart.model.Product;

public class CartPersistence implements CartConnectivity {

    @Override
    public ArrayList<CartItem> getCartItems(int userId) {

        ArrayList<CartItem> cart = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String sql =
            	    "SELECT c.quantity, " +
            	    "p.product_id, p.product_name, p.price, p.product_image " +
            	    "FROM cart c " +
            	    "JOIN products p ON c.product_id = p.product_id " +
            	    "WHERE c.user_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("price"));
                p.setImageUrl(rs.getString("product_image"));

                CartItem item =
                    new CartItem(p, rs.getInt("quantity"));

                cart.add(item);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cart;
    }
    
    @Override
    public void clearCart(int userId) {

        try {
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String sql = "DELETE FROM cart WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}