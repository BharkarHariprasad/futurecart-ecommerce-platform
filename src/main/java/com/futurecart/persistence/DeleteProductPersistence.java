package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.futurecart.data_access.DeleteProductConnectivity;

public class DeleteProductPersistence
        implements DeleteProductConnectivity {

    @Override
    public boolean deleteProduct(int productId) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "YOUR_PASSWORD"
            );

            String sql = "DELETE FROM products WHERE product_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, productId);

            int count = ps.executeUpdate();
            con.close();

            return count > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}