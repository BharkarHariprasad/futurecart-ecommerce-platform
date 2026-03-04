package com.futurecart.business;

import com.futurecart.data_access.AddNewCardConnectivity;
import com.futurecart.persistence.AddNewCardPersistence;

public class AddNewCardBusiness {

    public boolean saveCard(int userId,
                            String cardNumber,
                            String CardName,
                            int cvv,
                            int expiryMonth,
                            int expiryYear) {

        AddNewCardConnectivity dao =      
                new AddNewCardPersistence();

        return dao.insertCard(
                userId,
                cardNumber,
                CardName,
                cvv,
                expiryMonth,
                expiryYear
        );
    }
}