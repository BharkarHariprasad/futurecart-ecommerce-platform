package com.futurecart.business;

import com.futurecart.data_access.AddressUpdateConnectivity;
import com.futurecart.model.Address;
import com.futurecart.persistence.AddressUpdatePersistence;

public class AddressUpdateBusiness {
	
	public void updateAddress(Address address) {
        AddressUpdateConnectivity ref = new AddressUpdatePersistence();
        ref.updateAddress(address);
    }
}
