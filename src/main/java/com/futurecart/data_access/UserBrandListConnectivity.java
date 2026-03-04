package com.futurecart.data_access;

import java.util.ArrayList;

import com.futurecart.model.Brand;

public interface UserBrandListConnectivity {
	public ArrayList<Brand> brandByCategory(int categoryId);
}
