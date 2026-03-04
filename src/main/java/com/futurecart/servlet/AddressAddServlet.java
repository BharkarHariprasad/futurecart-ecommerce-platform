package com.futurecart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.futurecart.business.AddressAddBusiness;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addressesadd")
public class AddressAddServlet extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String fullName = req.getParameter("fullName");
		String mobile = req.getParameter("mobile");
		String pincode = req.getParameter("pincode");
		String addressType = req.getParameter("addressType");
		String addressLine1 = req.getParameter("addressLine1");
		String addressLine2 = req.getParameter("addressLine2");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		
		HttpSession session = req.getSession(false);
		int userId = (int) session.getAttribute("userId");
		
		AddressAddBusiness ref = new AddressAddBusiness();
		boolean result = ref.storeData(userId, fullName, mobile, pincode, addressType, addressLine1, addressLine2, city, state);
		PrintWriter out = res.getWriter();
		if (result) {

		    String redirectTo = req.getParameter("redirectTo");

		    if (redirectTo == null || redirectTo.trim().isEmpty()) {
		        redirectTo = "addresses"; // default
		    }

		    res.sendRedirect(redirectTo);

		} else {
		    res.getWriter().print("Fail");
		}
	}
}
