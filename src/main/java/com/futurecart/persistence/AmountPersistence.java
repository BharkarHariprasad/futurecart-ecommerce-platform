package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.futurecart.data_access.AmountConnectivity;

public class AmountPersistence implements AmountConnectivity {

    @Override
    public boolean validateAndDeduct(int cardId, double amount) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root", "password"
            );

            String checkSql =
              "SELECT available_balance FROM amount WHERE card_id=?";

            PreparedStatement ps = con.prepareStatement(checkSql);
            ps.setInt(1, cardId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                double balance = rs.getDouble("available_balance");

                if (balance >= amount) {
                    String updateSql =
                      "UPDATE amount SET available_balance = available_balance - ? WHERE card_id=?";

                    PreparedStatement ups = con.prepareStatement(updateSql);
                    ups.setDouble(1, amount);
                    ups.setInt(2, cardId);
                    ups.executeUpdate();

                    con.close();
                    return true;
                }
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}