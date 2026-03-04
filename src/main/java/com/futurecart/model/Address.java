package com.futurecart.model;

public class Address {
	int AddressId;
	int userId;
	String fullName;
	String mobile;
	String pincode;
	String addressType;
	String addressLine1;
	String addressLine2;
	String city;
	String state;
	
	public Address() {
		
	}

	public Address(int AddressId, int userId, String fullName, String mobile, String pincode, String addressType, String addressLine1,
			String addressLine2, String city, String state) {
		this.AddressId = AddressId;
		this.userId = userId;
		this.fullName = fullName;
		this.mobile = mobile;
		this.pincode = pincode;
		this.addressType = addressType;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.city = city;
		this.state = state;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getAddressType() {
		return addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getAddressId() {
		return AddressId;
	}

	public void setAddressId(int addressId) {
		AddressId = addressId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
