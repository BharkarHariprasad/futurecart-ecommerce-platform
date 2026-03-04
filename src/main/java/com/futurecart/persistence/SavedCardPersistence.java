package com.futurecart.persistence;

import java.sql.*;
import java.util.ArrayList;

import com.futurecart.data_access.SavedCardConnectivity;
import com.futurecart.model.SavedCard;

public class SavedCardPersistence implements SavedCardConnectivity {

    @Override
    public ArrayList<SavedCard> getSavedCards(int userId) {

        ArrayList<SavedCard> list = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Future_Cart",
                "root",
                "Hari@9970"
            );

            String sql =
                "SELECT CardId, CardNumber, ExpiryMonth, ExpiryYear " +
                "FROM creditcard WHERE user_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SavedCard c = new SavedCard();
                c.setCardId(rs.getInt("CardId"));
                c.setUserId(userId);
                c.setCardNumber(rs.getString("CardNumber"));
                c.setExpiryMonth(rs.getInt("ExpiryMonth"));
                c.setExpiryYear(rs.getInt("ExpiryYear"));

                list.add(c);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}