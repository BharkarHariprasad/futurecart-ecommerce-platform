package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.data_access.CartConnectivity;
import com.futurecart.model.CartItem;
import com.futurecart.persistence.CartPersistence;

public class CartBusiness {

    public ArrayList<CartItem> getCartItems(int userId) {

        CartConnectivity ref = new CartPersistence();
        return ref.getCartItems(userId);
    }
    
    public void clearCart(int userId) {
        CartConnectivity dao = new CartPersistence();
        dao.clearCart(userId);
    }
}