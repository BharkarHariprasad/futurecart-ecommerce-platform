package com.futurecart.business;

import com.futurecart.data_access.AmountConnectivity;
import com.futurecart.persistence.AmountPersistence;

public class AmountBusiness {

    public boolean validateAndDeduct(int cardId, double amount) {

        AmountConnectivity ref = new AmountPersistence();
        return ref.validateAndDeduct(cardId, amount);
    }
}