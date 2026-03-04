package com.futurecart.data_access;

import java.util.ArrayList;

import com.futurecart.model.Product;

public interface ProductCategoryListConnectivity {
	ArrayList<Product> getProduct(int categoryId);
}
