package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.data_access.CategoryListConnectivity;
import com.futurecart.model.Category;
import com.futurecart.persistence.CategoryListPersistence;

public class CategoryListBusiness {

	public ArrayList<Category> getAllCategories() {
		
		CategoryListConnectivity ref = new CategoryListPersistence();
		return ref.allCategory();
	}

}
