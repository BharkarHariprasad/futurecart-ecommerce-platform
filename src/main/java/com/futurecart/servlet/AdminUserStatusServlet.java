package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.AdminUserStatusBusiness;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/adminUserStatus")
public class AdminUserStatusServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        HttpSession session = req.getSession(false);

        // 🔐 Admin security
        if (session == null || session.getAttribute("adminName") == null) {
            res.sendRedirect("AdminLogin.html");
            return;
        }

        int userId = Integer.parseInt(req.getParameter("userId"));
        String action = req.getParameter("action"); // block / unblock

        AdminUserStatusBusiness biz = new AdminUserStatusBusiness();

        boolean result = biz.updateStatus(userId, action);

        // Redirect back to users list
        res.sendRedirect("adminUsers");
    }
}