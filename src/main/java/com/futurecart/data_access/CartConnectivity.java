package com.futurecart.data_access;

import java.util.ArrayList;
import com.futurecart.model.CartItem;

public interface CartConnectivity {

    ArrayList<CartItem> getCartItems(int userId);
    
    void clearCart(int userId);

}