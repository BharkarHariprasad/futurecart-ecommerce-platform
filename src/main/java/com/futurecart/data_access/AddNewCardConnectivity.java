package com.futurecart.data_access;

public interface AddNewCardConnectivity {

    boolean insertCard(int userId,
                       String cardNumber,
                       String CardName,
                       int cvv,
                       int expiryMonth,
                       int expiryYear);
}