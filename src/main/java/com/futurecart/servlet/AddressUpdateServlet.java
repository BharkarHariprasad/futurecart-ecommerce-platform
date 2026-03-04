package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.AddressUpdateBusiness;
import com.futurecart.model.Address;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateAddress")
public class AddressUpdateServlet extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		int userId = 0;
		int addressId = Integer.parseInt(req.getParameter("addressId"));
		
		HttpSession session = req.getSession(false);
		if(session != null) {
			userId = (int) session.getAttribute("userId");
		}
		
		Address address = new Address();
        address.setAddressId(Integer.parseInt(req.getParameter("addressId")));
        address.setFullName(req.getParameter("fullName"));
        address.setMobile(req.getParameter("mobile"));
        address.setPincode(req.getParameter("pincode"));
        address.setAddressType(req.getParameter("addressType"));
        address.setAddressLine1(req.getParameter("addressLine1"));
        address.setAddressLine2(req.getParameter("addressLine2"));
        address.setCity(req.getParameter("city"));
        address.setState(req.getParameter("state"));
        address.setUserId(userId);
        
        AddressUpdateBusiness business = new AddressUpdateBusiness();
        business.updateAddress(address);
         
        res.sendRedirect("addresses");
	}
}
