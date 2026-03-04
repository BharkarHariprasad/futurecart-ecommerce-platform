package com.futurecart.data_access;

public interface CardConnectivity {
    int validateCard(long number, String name,
                     String expiry, int cvv);
}