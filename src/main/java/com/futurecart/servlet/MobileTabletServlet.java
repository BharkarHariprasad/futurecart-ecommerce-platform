package com.futurecart.servlet;

import java.util.ArrayList;

import com.futurecart.business.MobileTabletBusiness;
import com.futurecart.model.Product;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MobileTablet")
public class MobileTabletServlet extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) {
		
		MobileTabletBusiness ref = new MobileTabletBusiness();
		
		ArrayList<Product> mobileList = ref.getMobiles();
		ArrayList<Product> tabletList = ref.getTablets();
		
		req.setAttribute("mobiles", mobileList);
		req.setAttribute("tablets", tabletList);
		
		req.getRequestDispatcher("Mobile&Tablet.jsp");
		
	}

}
