package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.data_access.ProductCategoryListConnectivity;
import com.futurecart.model.Product;
import com.futurecart.persistence.ProductCategoryListPersistence;

public class ProductCategoryListBusiness {

	public ArrayList<Product> getProductsByCategory(int categoryId) {
		
		ProductCategoryListConnectivity ref = new ProductCategoryListPersistence();
		return ref.getProduct(categoryId);
	}

}
