package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.futurecart.data_access.CardConnectivity;

public class CardPersistence implements CardConnectivity {

    @Override
    public int validateCard(long number, String name,
                            String expiry, int cvv) {

        int cardId = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/future_cart",
                "root", "Hari@9970"
            );

            String sql =
              "SELECT CardId FROM creditcard " +
              "WHERE CardNumber=? AND CardName=? " +
              "AND ExpiryDate=? AND CVVNumber=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, number);
            ps.setString(2, name);
            ps.setString(3, expiry);
            ps.setInt(4, cvv);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cardId = rs.getInt("CardId");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cardId;
    }
}