package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.model.CartItem;
import com.futurecart.persistence.OrderSavePersistence;

public class OrderSaveBusiness {

    public boolean placeOrder(int userId,
                              double totalAmount,
                              ArrayList<CartItem> cart) {

        OrderSavePersistence dao =
            new OrderSavePersistence();

        int orderId = dao.createOrder(userId, totalAmount);

        if (orderId > 0) {
            dao.saveOrderItems(orderId, cart);
            return true;
        }
        return false;
    }
}