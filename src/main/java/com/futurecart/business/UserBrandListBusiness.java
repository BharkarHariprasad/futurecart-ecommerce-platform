package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.data_access.UserBrandListConnectivity;
import com.futurecart.model.Brand;
import com.futurecart.persistence.UserBrandListPersistence;

public class UserBrandListBusiness {

	public ArrayList<Brand> getBrandsByCategory(int categoryId) {
		
		UserBrandListConnectivity ref = new UserBrandListPersistence();
		return ref.brandByCategory(categoryId);
	}

}
