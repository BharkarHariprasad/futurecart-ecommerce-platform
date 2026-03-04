package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.ProductCategoryListBusiness;
import com.futurecart.business.UserBrandListBusiness;
import com.futurecart.model.Brand;
import com.futurecart.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/categoryProducts")
public class ProductCategoryList extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int categoryId = Integer.parseInt(req.getParameter("categoryId"));
		
		ProductCategoryListBusiness ref = new ProductCategoryListBusiness();
		ArrayList<Product> mobiles = ref.getProductsByCategory(categoryId);
		
		UserBrandListBusiness brandRef = new UserBrandListBusiness();
		ArrayList<Brand> brands = brandRef.getBrandsByCategory(categoryId);
		
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
