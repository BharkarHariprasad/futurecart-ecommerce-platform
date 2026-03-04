package com.futurecart.business;

import com.futurecart.data_access.ValidateSavedCardConnectivity;
import com.futurecart.persistence.ValidateSavedCardPersistence;

public class ValidateSavedCardBusiness {

    public boolean validate(int cardId, int cvv) {

        ValidateSavedCardConnectivity dao =
                new ValidateSavedCardPersistence();

        return dao.isValid(cardId, cvv);
    }
}