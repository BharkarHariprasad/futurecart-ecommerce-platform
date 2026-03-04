package com.futurecart.data_access;

import java.util.ArrayList;
import com.futurecart.model.SavedCard;

public interface SavedCardConnectivity {

    ArrayList<SavedCard> getSavedCards(int userId);
}