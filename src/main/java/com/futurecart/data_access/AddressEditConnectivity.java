package com.futurecart.data_access;

import com.futurecart.model.Address;

public interface AddressEditConnectivity {
	public Address getAddress(int addressId, int userId);
}
