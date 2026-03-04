package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.CategoryAddBusiness;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addCategory")
public class CategoryAddServlet extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		String categoryName = req.getParameter("category_name");

        CategoryAddBusiness ref = new CategoryAddBusiness();
        boolean result = ref.addCategory(categoryName);

        if (result) {
        	res.sendRedirect("adminDashboard?msg=Category Added");
        } else {
        	res.sendRedirect("adminDashboard?msg=Category Failed");
        }
	}

}
