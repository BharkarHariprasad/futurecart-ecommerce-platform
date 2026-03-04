package com.futurecart.business;

import com.futurecart.data_access.SignUpConnectivity;
import com.futurecart.persistence.SignUpPersistence;

public class SignUpBusiness {

	public boolean isStore(String fullName, String email, String mobile) {
		
//		boolean isValid = confirmPassword(password, confirmPassword);
//		if(!isValid) {
//			return false;
//		}
		
//		String hashPassword = convertHash(password);
		SignUpConnectivity ref = new SignUpPersistence();
		return ref.storeUser(fullName, email, mobile);
	}
	
//	public boolean confirmPassword(String password, String confirmPassword) {
//		if (!password.equals(confirmPassword)) {
//			return false;
//		}
//		return true;
//	}
	
//	public String convertHash(String password) {
//		char[] arr = password.toCharArray();
//		for(int index = 0; index < arr.length; index++) {
//			arr[index] = (char) (arr[index] + 17 * 40 % 10);
//			arr[index] = (char) (arr[index] + (char) (index + 2));
//		}
//		return new String(arr);
//	}
	
}
