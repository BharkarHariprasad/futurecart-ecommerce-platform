package com.futurecart.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.futurecart.data_access.AddNewCardConnectivity;

public class AddNewCardPersistence
        implements AddNewCardConnectivity {

    @Override
    public boolean insertCard(int userId,
                              String cardNumber,
                              String CardName,
                              int cvv,
                              int expiryMonth,
                              int expiryYear) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String sql =
                "INSERT INTO creditcard " +
                "(CardNumber, CardName, CVVNumber, ExpiryMonth, ExpiryYear, user_id) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            	ps.setString(1, cardNumber.replace(" ", ""));
            	ps.setString(2, CardName);
            	ps.setInt(3, cvv);
            	ps.setInt(4, expiryMonth);
            	ps.setInt(5, expiryYear);
            	ps.setInt(6, userId);

            int rows = ps.executeUpdate();
            con.close();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}