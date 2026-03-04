package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.data_access.AdminProductListConnectivity;
import com.futurecart.model.Product;
import com.futurecart.persistence.AdminProductListPersistence;

public class AdminProductListBusiness {

    public ArrayList<Product> getAllProducts() {

        AdminProductListConnectivity ref =
                new AdminProductListPersistence();

        return ref.getAllProducts();
    }
}