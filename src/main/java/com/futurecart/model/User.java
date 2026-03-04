package com.futurecart.model;

public class User {

    private int userId;
    private String fullName;
    private String email;
    private String mobile;
    private String createdAt;
    private int active;

    // getters & setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
    

    public int getActive() {
    	return active;
    }
    public void setActive(int active) {
    	this.active = active;
    }
}