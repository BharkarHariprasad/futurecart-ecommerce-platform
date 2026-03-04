package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.AdminProductListBusiness;
import com.futurecart.business.BrandListBusiness;
import com.futurecart.business.CategoryListBusiness;
import com.futurecart.model.Brand;
import com.futurecart.model.Category;
import com.futurecart.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        // 1️⃣ Load categories
        CategoryListBusiness catBiz = new CategoryListBusiness();
        ArrayList<Category> categories = catBiz.getAllCategories();

        // 2️⃣ Load brands
        BrandListBusiness brandBiz = new BrandListBusiness();
        ArrayList<Brand> brands = brandBiz.getAllBrand();

        // 3️⃣ Load products (🔥 THIS WAS MISSING)
        AdminProductListBusiness productBiz =
                new AdminProductListBusiness();
        ArrayList<Product> products =
                productBiz.getAllProducts();

        // 4️⃣ Set attributes
        req.setAttribute("categories", categories);
        req.setAttribute("brands", brands);
        req.setAttribute("products", products);

        // 5️⃣ Forward
        req.getRequestDispatcher("adminDashboard.jsp")
           .forward(req, res);
    }
}