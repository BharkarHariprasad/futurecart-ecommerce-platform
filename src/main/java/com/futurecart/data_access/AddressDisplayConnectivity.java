package com.futurecart.data_access;

import java.util.ArrayList;

import com.futurecart.model.Address;

public interface AddressDisplayConnectivity {
	public ArrayList<Address> getAddressList(int userId);
}
