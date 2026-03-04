package com.futurecart.business;

import com.futurecart.data_access.EditProductConnectivity;
import com.futurecart.model.Product;
import com.futurecart.persistence.EditProductPersistence;

public class EditProductBusiness {

    public Product getProductById(int productId) {
        EditProductConnectivity ref =
                new EditProductPersistence();
        return ref.getProductById(productId);
    }
}