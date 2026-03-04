package com.futurecart.business;

import com.futurecart.data_access.AddProductConnectivity;
import com.futurecart.persistence.AddProductPersistence;

public class AddProductBusiness {

	public boolean isAddProduct(String name, int brandId, int categoryId, double price, String description,
			String image ,String featuredProduct) {
		
		AddProductConnectivity ref = new AddProductPersistence();
		return ref.addProduct(name, brandId, categoryId, price, description, image, featuredProduct);
	}

}
