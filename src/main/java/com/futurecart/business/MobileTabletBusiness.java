package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.data_access.MobileTabletConnectivity;
import com.futurecart.model.Product;
import com.futurecart.persistence.MobileTabletPersistence;

public class MobileTabletBusiness {

	MobileTabletConnectivity ref = new MobileTabletPersistence();
	
	public ArrayList<Product> getMobiles() {
		
		return ref.getProduct("Mobile");
	}

	public ArrayList<Product> getTablets() {
		
		return ref.getProduct("Tablet");
	}

}
