package com.futurecart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.futurecart.business.SignUpBusiness;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
		public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
			String fullName = req.getParameter("fullName");
			String email = req.getParameter("email");
			String mobile = req.getParameter("mobile");
//			String password = req.getParameter("password");
//			String confirmPassword = req.getParameter("confirmPassword");
			
			SignUpBusiness ref = new SignUpBusiness();
			boolean result = ref.isStore(fullName, email, mobile);
			PrintWriter out = res.getWriter();
			if(result == true) {
				out.print("Success");
			}
			else {
				out.print("Try Again");
			}
	}
}
