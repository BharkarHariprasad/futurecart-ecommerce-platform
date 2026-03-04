package com.futurecart.model;

public class Admin {
	
	int adminId;
	String fullName;
	String email;
	
	public Admin() {}

    public Admin(int adminId, String fullName, String email) {
        this.adminId = adminId;
        this.fullName = fullName;
        this.email = email;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
