package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.UserBrandListBusiness;

import com.futurecart.model.Brand;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/userBrandList") 
public class UserBrandList extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String catId = req.getParameter("categoryId");
		int categoryId = Integer.parseInt(catId);
		
		System.out.println(categoryId);
		
		UserBrandListBusiness ref = new UserBrandListBusiness();
		ArrayList<Brand> brands = ref.getBrandsByCategory(categoryId);
		
		req.setAttribute("brands", brands);
		
		req.getRequestDispatcher("Mobile&Tablet.jsp").forward(req, res);
		
	}

}
