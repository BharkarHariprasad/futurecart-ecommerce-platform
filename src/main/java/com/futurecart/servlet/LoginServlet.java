package com.futurecart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.futurecart.business.LoginBusiness;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String loginId = req.getParameter("loginId");
//		String loginPassword = req.getParameter("loginPassword");
		
		LoginBusiness ref = new LoginBusiness();
		int result = ref.isUserValid(loginId);

		if (result > 0) {
		    HttpSession session = req.getSession(true);
		    session.setAttribute("userId", result);
		    res.sendRedirect("home");
		}
		else if (result == -1) {
		    res.sendRedirect("Login.html?error=blocked");
		}
		else {
		    res.sendRedirect("SignUp.html");
		}
	}
}
