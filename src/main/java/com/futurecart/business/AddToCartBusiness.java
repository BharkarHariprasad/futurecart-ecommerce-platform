package com.futurecart.business;

import com.futurecart.persistence.AddToCartPersistence;

public class AddToCartBusiness {

    private AddToCartPersistence ref = new AddToCartPersistence();

    public void addToCart(int userId, int productId) {
        ref.addToCart(userId, productId);
    }
}