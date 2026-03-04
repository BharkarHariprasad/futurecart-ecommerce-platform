package com.futurecart.business;

import com.futurecart.persistence.BrandAddPersistence;

public class BrandAddBusiness {

	public boolean addBrand(String brandName, int categoryId) {
		
		BrandAddPersistence ref = new BrandAddPersistence();
		return ref.storeBrand(brandName, categoryId);
	}

}
