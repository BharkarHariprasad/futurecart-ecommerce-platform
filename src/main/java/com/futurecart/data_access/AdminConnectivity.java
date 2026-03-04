package com.futurecart.data_access;

import com.futurecart.model.Admin;

public interface AdminConnectivity {
	public Admin validAdmin(String adminEmail, String password);
}
