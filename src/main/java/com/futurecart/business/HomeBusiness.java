package com.futurecart.business;

import java.util.ArrayList;

import com.futurecart.data_access.HomeConnectivity;
import com.futurecart.model.Product;
import com.futurecart.persistence.HomePersistence;

public class HomeBusiness {

    public ArrayList<Product> getFeaturedProducts() {
        HomeConnectivity ref = new HomePersistence();
        return ref.getFeaturedProducts();
    }
}