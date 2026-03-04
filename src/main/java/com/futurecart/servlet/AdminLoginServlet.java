package com.futurecart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.futurecart.business.AdminBusiness;
import com.futurecart.model.Admin;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException   {
		
		String adminEmail = req.getParameter("email");
		String password = req.getParameter("password");
		
		AdminBusiness ref = new AdminBusiness();
		Admin admin = ref.isValid(adminEmail, password);
		
		PrintWriter out = res.getWriter();
		
		if(admin != null) {
			req.getSession().setAttribute("adminName", admin.getFullName());
			req.getSession().setAttribute("adminEmail", admin.getEmail());
			res.sendRedirect("adminDashboard");
		}
		else {
			res.sendRedirect("AdminLogin.html");
		}
	}

}
