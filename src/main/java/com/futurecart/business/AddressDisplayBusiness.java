package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.data_access.AddressDisplayConnectivity;
import com.futurecart.model.Address;
import com.futurecart.persistence.AddressDisplayPersistence;

public class AddressDisplayBusiness {
	
	

	public ArrayList<Address> getAddress(int userId) {
		
		AddressDisplayConnectivity ref = new AddressDisplayPersistence();
		return ref.getAddressList(userId);
	}

}
