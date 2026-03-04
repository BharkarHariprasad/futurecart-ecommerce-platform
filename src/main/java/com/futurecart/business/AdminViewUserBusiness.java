package com.futurecart.business;

import com.futurecart.data_access.AdminViewUserConnectivity;
import com.futurecart.model.User;
import com.futurecart.persistence.AdminViewUserPersistence;

public class AdminViewUserBusiness {

    public User getUserById(int userId) {

        AdminViewUserConnectivity ref =
                new AdminViewUserPersistence();

        return ref.getUserById(userId);
    }
}