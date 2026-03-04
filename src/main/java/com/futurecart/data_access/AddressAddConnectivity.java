package com.futurecart.data_access;

public interface AddressAddConnectivity {
	public boolean storeAddress(int userId, String fullName, String mobile, String pincode, String addressType, String addressLine1,
			String addressLine2, String city, String state);
}
