package com.futurecart.business;

import com.futurecart.data_access.AdminConnectivity;
import com.futurecart.model.Admin;
import com.futurecart.persistence.AdminPersistence;

public class AdminBusiness {

	public Admin isValid(String adminEmail, String password) {
		
		AdminConnectivity ref = new AdminPersistence();
		return ref.validAdmin(adminEmail, password);
	}

}
