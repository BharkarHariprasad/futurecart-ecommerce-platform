package com.futurecart.data_access;

public interface RemoveFromCartConnectivity {
	
	int getQuantity(int userId, int productId);

    void decreaseQuantity(int userId, int productId);

	void deleteProduct(int userId, int productId);
	
}
