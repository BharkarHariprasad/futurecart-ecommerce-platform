package com.futurecart.business;

import com.futurecart.data_access.AdminUserStatusConnectivity;
import com.futurecart.persistence.AdminUserStatusPersistence;

public class AdminUserStatusBusiness {

    public boolean updateStatus(int userId, String action) {

        int status = action.equalsIgnoreCase("block") ? 0 : 1;

        AdminUserStatusConnectivity ref =
                new AdminUserStatusPersistence();

        return ref.updateUserStatus(userId, status);
    }
}