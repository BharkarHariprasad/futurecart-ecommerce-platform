package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.data_access.AdminUserListConnectivity;
import com.futurecart.model.User;
import com.futurecart.persistence.AdminUserListPersistence;

public class AdminUserListBusiness {

    public ArrayList<User> getAllUsers() {

        AdminUserListConnectivity ref =
                new AdminUserListPersistence();

        return ref.getAllUsers();
    }
}