package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.UserBrandListBusiness;
import com.futurecart.model.Brand;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HeaderDataServlet extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		UserBrandListBusiness brandBiz = new UserBrandListBusiness();

        ArrayList<Brand> mobileBrands = brandBiz.getBrandsByCategory(1);

        req.setAttribute("mobileBrands", mobileBrands);

        req.getRequestDispatcher("LandingPage.jsp").forward(req, res);
	}

}
