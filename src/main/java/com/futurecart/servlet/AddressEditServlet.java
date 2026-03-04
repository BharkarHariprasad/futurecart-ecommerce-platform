package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.AddressDisplayBusiness;
import com.futurecart.business.AddressEditBuisness;
import com.futurecart.model.Address;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editAddress")
public class AddressEditServlet extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int userId = 0;
		int addressId = Integer.parseInt(req.getParameter("addressId"));
		
		HttpSession session = req.getSession(false);
		if(session != null) {
			userId = (int) session.getAttribute("userId");
		}
		
		AddressEditBuisness ref = new AddressEditBuisness();
		Address address = ref.userAddress(addressId, userId);
		
		AddressDisplayBusiness addressDisplayBusiness = new AddressDisplayBusiness();
		ArrayList<Address> addressList = addressDisplayBusiness.getAddress(userId);
		
		req.setAttribute("editAddress", address);
		req.setAttribute("savedAddress", addressList);
		
		req.getRequestDispatcher("Address.jsp").forward(req, res);
		
	}

}
