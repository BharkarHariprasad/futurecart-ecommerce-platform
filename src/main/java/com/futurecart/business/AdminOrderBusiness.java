package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.model.Order;
import com.futurecart.persistence.AdminOrderPersistence;

public class AdminOrderBusiness {

    // Get all orders for admin
    public ArrayList<Order> getAllOrders() {
        return new AdminOrderPersistence().getAllOrders();
    }

    // Update order status
    public void updateOrderStatus(int orderId, String status) {
        new AdminOrderPersistence().updateOrderStatus(orderId, status);
    }
}