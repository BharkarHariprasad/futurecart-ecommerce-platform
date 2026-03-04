package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.ProductListBusiness;
import com.futurecart.business.UserBrandListBusiness;
import com.futurecart.model.Brand;
import com.futurecart.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/productList")
public class ProductListServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int categoryId = Integer.parseInt(req.getParameter("categoryId"));

        int brandId = 0;
        String brandIdStr = req.getParameter("brandId");
        if (brandIdStr != null && !brandIdStr.isEmpty()) {
            brandId = Integer.parseInt(brandIdStr);
        }

        ProductListBusiness productBiz = new ProductListBusiness();
        ArrayList<Product> mobiles = productBiz.getProductsByBrand(brandId);

        UserBrandListBusiness brandBiz = new UserBrandListBusiness();
        ArrayList<Brand> brands = brandBiz.getBrandsByCategory(categoryId);
        
        String categoryName;
        if (categoryId == 1) categoryName = "Mobiles";
        else if (categoryId == 3) categoryName = "Laptops";
        else if (categoryId == 5) categoryName = "TV";
        else if (categoryId == 6) categoryName = "Speakers";
        else if (categoryId == 4) categoryName = "Home Appliances";
        else categoryName = "Products";

        req.setAttribute("categoryId", categoryId);
        req.setAttribute("categoryName", categoryName);
        req.setAttribute("mobiles", mobiles);
        req.setAttribute("brands", brands);

        req.getRequestDispatcher("Mobile&Tablet.jsp").forward(req, res);
    }
}