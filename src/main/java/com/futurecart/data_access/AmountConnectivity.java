package com.futurecart.data_access;

public interface AmountConnectivity {
    boolean validateAndDeduct(int cardId, double amount);
}