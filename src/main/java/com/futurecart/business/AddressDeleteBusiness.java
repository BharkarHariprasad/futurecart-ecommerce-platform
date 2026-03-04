package com.futurecart.business;

import com.futurecart.data_access.AddressDeleteConnectivity;
import com.futurecart.persistence.AddressDeletePersistence;

public class AddressDeleteBusiness {

	public boolean isDelete(int addressId, int userId) {
		
		AddressDeleteConnectivity ref = new AddressDeletePersistence();
		
		return ref.deleteAddress(addressId, userId);
	}
	
}
