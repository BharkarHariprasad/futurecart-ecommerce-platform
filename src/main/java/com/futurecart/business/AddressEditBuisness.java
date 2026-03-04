package com.futurecart.business;

import com.futurecart.data_access.AddressEditConnectivity;
import com.futurecart.model.Address;
import com.futurecart.persistence.AddressEditPersistence;

public class AddressEditBuisness {

	public Address userAddress(int addressId, int userId) {
		
		AddressEditConnectivity ref = new AddressEditPersistence();
		
		return ref.getAddress(addressId, userId);
	}
	
}
