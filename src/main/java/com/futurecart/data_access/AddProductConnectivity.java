package com.futurecart.data_access;

public interface AddProductConnectivity {
	public boolean addProduct(String name, int brandId, int categoryId, double price, String description, String image, String featuredProduct);
}
