package com.futurecart.business;

import com.futurecart.data_access.RemoveFromCartConnectivity;
import com.futurecart.persistence.RemoveFromCartPersistence;

public class RemoveFromCartBusiness {

    private RemoveFromCartConnectivity dao =
        new RemoveFromCartPersistence();

    public void removeItem(int userId, int productId) {

        int qty = dao.getQuantity(userId, productId);

        if (qty > 1) {
            dao.decreaseQuantity(userId, productId);
        } else {
            dao.deleteProduct(userId, productId);
        }
    }
}