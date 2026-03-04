package com.futurecart.business;

import com.futurecart.data_access.AdminDeleteProductConnectivity;
import com.futurecart.persistence.AdminDeleteProductPersistence;

public class AdminDeleteProductBusiness {

    public boolean deleteProduct(int productId) {

        AdminDeleteProductConnectivity ref =
                new AdminDeleteProductPersistence();

        return ref.deleteProduct(productId);
    }
}