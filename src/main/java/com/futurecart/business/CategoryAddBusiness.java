package com.futurecart.business;

import com.futurecart.data_access.CategoryAddConnectivity;
import com.futurecart.persistence.CategoryAddPersistence;

public class CategoryAddBusiness {

	public boolean addCategory(String categoryName) {
		
		CategoryAddConnectivity ref = new CategoryAddPersistence();
		return ref.insertCategory(categoryName);
	}

}
