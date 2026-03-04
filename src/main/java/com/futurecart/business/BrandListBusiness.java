package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.data_access.BrandListConnectivity;
import com.futurecart.model.Brand;
import com.futurecart.persistence.BrandListPersistence;

public class BrandListBusiness {

	public ArrayList<Brand> getAllBrand() {
		
		BrandListConnectivity ref = new BrandListPersistence();
		return ref.brand();
	}
	
}
