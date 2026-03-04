package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.AddressDeleteBusiness;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteAddress")
public class AddressDeleteServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		int userId = 0;
		int addressId = Integer.parseInt(req.getParameter("addressId"));
		HttpSession session = req.getSession(false);
		if(session != null) {
			userId = (int) session.getAttribute("userId");
		}
		
		AddressDeleteBusiness ref = new AddressDeleteBusiness();
		ref.isDelete(addressId, userId);
		
		
		res.sendRedirect("addresses");
	
	}
}
