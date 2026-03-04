package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.data_access.ProductListConnectivity;
import com.futurecart.model.Product;
import com.futurecart.persistence.ProductListPersistence;

public class ProductListBusiness {

	public ArrayList<Product> getProductsByBrand(int brandId) {
		
		ProductListConnectivity ref = new ProductListPersistence();
		return ref.getProduct(brandId);
	}

}
