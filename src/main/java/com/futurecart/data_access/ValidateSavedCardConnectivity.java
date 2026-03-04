package com.futurecart.data_access;

public interface ValidateSavedCardConnectivity {

    boolean isValid(int cardId, int cvv);
}