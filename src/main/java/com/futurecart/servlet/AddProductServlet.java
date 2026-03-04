package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.AddProductBusiness;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		 	String name = req.getParameter("product_name");
	        int brandId = Integer.parseInt(req.getParameter("brand_id"));
	        int categoryId = Integer.parseInt(req.getParameter("category_id"));
	        String featuredProduct = req.getParameter("featuredProduct");
	        double price = Double.parseDouble(req.getParameter("price"));
	        String description = req.getParameter("description");
	        String image = req.getParameter("product_image");
//	        int stock = Integer.parseInt(req.getParameter("stock"));
	        
	        System.out.println(featuredProduct);
	        
	        AddProductBusiness ref = new AddProductBusiness();
	        boolean result = ref.isAddProduct(name, brandId, categoryId, price, description, image, featuredProduct);
	        
	        if (result) {
	            res.sendRedirect("adminDashboard?msg=product_added");
	        } else {
	            res.sendRedirect("adminDashboard?msg=product_failed");
	        }
	        
	}

}
