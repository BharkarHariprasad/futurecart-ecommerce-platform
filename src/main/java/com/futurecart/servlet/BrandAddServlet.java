package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.BrandAddBusiness;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addBrand")
public class BrandAddServlet extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String brandName = req.getParameter("brand_name");
		String catIdStr  = req.getParameter("category_id");
		
		System.out.println(catIdStr);
		
		int categoryId = Integer.parseInt(catIdStr);

        BrandAddBusiness ref = new BrandAddBusiness();
        boolean result = ref.addBrand(brandName, categoryId);

        if (result) {
            res.sendRedirect("adminDashboard?msg=brand_added");
        } else {
            res.sendRedirect("adminDashboard?msg=brand_failed");
        }
	}

}
