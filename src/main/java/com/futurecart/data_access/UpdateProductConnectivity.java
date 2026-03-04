package com.futurecart.data_access;

public interface UpdateProductConnectivity {

    boolean updateProduct(int id, String name, double price,
                          String desc, String image, String featured);
}