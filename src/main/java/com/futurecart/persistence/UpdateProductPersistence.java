package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.futurecart.data_access.UpdateProductConnectivity;

public class UpdateProductPersistence
        implements UpdateProductConnectivity {

    @Override
    public boolean updateProduct(int id, String name, double price,
                                 String desc, String image, String featured) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String sql =
                "UPDATE products SET product_name=?, price=?, description=?, product_image=?, is_featured=? WHERE product_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, desc);
            ps.setString(4, image);
            ps.setString(5, featured);
            ps.setInt(6, id);

            int rows = ps.executeUpdate();
            con.close();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}