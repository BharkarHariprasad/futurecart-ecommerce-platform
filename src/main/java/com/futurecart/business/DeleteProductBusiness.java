package com.futurecart.business;

import com.futurecart.data_access.DeleteProductConnectivity;
import com.futurecart.persistence.DeleteProductPersistence;

public class DeleteProductBusiness {

    public boolean deleteProduct(int productId) {
        DeleteProductConnectivity ref = new DeleteProductPersistence();
        return ref.deleteProduct(productId);
    }
}