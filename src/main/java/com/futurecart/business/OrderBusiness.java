package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.model.Order;
import com.futurecart.persistence.OrderPersistence;

public class OrderBusiness {

    public ArrayList<Order> getUserOrders(int userId) {
        return new OrderPersistence().getOrdersByUser(userId);
    }
}