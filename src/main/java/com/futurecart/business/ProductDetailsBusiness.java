package com.futurecart.business;

import com.futurecart.data_access.ProductDetailsConnectivity;
import com.futurecart.model.Product;
import com.futurecart.persistence.ProductDetailsPersistence;

public class ProductDetailsBusiness {

	public Product getProductById(int productId) {
        ProductDetailsConnectivity ref = new ProductDetailsPersistence();
        return ref.getProductById(productId);
    }

}
