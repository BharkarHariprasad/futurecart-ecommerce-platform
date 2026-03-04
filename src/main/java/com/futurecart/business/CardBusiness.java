package com.futurecart.business;

import com.futurecart.data_access.CardConnectivity;
import com.futurecart.persistence.CardPersistence;

public class CardBusiness {

    public int validateCard(long number, String name,
                            String expiry, int cvv) {

        CardConnectivity ref = new CardPersistence();
        return ref.validateCard(number, name, expiry, cvv);
    }
}