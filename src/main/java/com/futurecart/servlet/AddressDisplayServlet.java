package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.AddressDisplayBusiness;
import com.futurecart.model.Address;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addresses")
public class AddressDisplayServlet extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);
		
		if(session == null || session.getAttribute("userId") == null) {
			res.sendRedirect("Login.html");
			return;
		}
		int userId = (int) session.getAttribute("userId");
		
		AddressDisplayBusiness ref = new AddressDisplayBusiness();
		ArrayList<Address> address = ref.getAddress(userId);
		
//		if(address == null || address.isEmpty()) {
//			res.sendRedirect("addressesadd");
//		}
		req.setAttribute("savedAddress", address);
		req.getRequestDispatcher("Address.jsp").forward(req, res);
		return;
	}
}
