package com.futurecart.persistence;

import java.sql.*;

import com.futurecart.data_access.ValidateSavedCardConnectivity;

public class ValidateSavedCardPersistence
        implements ValidateSavedCardConnectivity {

    @Override
    public boolean isValid(int cardId, int cvv) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String sql =
                "SELECT CardId FROM creditcard " +
                "WHERE CardId=? AND CVVNumber=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, cardId);
            ps.setInt(2, cvv);

            ResultSet rs = ps.executeQuery();

            boolean exists = rs.next();
            con.close();

            return exists;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}