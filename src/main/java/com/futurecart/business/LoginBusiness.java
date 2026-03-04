package com.futurecart.business;

import com.futurecart.data_access.LoginConnectivity;
import com.futurecart.persistence.LoginPersistence;

public class LoginBusiness {

	public int isUserValid(String loginId) {
		
//		String newId = convertArray(loginId);
		
//		String hashPassword = convertHash(loginPassword);
		
		LoginConnectivity ref = new LoginPersistence();
		return ref.verifyUser(loginId);
	}

}
