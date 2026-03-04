package com.futurecart.business;

import com.futurecart.persistence.AddressAddPersistence;

public class AddressAddBusiness {

	public boolean storeData(int userId, String fullName, String mobile, String pincode, String addressType, String addressLine1,
			String addressLine2, String city, String state) {
		
		AddressAddPersistence ref = new AddressAddPersistence();
		return ref.storeAddress(userId, fullName, mobile, pincode, addressType, addressLine1, addressLine2, city, state);
	}

}
