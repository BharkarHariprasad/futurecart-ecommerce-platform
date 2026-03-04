package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.data_access.SavedCardConnectivity;
import com.futurecart.model.SavedCard;
import com.futurecart.persistence.SavedCardPersistence;

public class SavedCardBusiness {

    public ArrayList<SavedCard> getUserCards(int userId) {

        SavedCardConnectivity dao =
            new SavedCardPersistence();

        return dao.getSavedCards(userId);
    }
}