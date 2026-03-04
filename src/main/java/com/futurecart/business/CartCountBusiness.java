package com.futurecart.business;

import com.futurecart.persistence.CartCountPersistence;

public class CartCountBusiness {

    private CartCountPersistence ref = new CartCountPersistence();

    public int getCartCount(int userId) {
        return ref.getCartCount(userId);
    }
}