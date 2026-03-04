package com.futurecart.business;

import com.futurecart.data_access.UpdateProductConnectivity;
import com.futurecart.persistence.UpdateProductPersistence;

public class UpdateProductBusiness {

    public boolean updateProduct(int id, String name, double price,
                                 String desc, String image, String featured) {

        UpdateProductConnectivity ref =
                new UpdateProductPersistence();

        return ref.updateProduct(id, name, price, desc, image, featured);
    }
}