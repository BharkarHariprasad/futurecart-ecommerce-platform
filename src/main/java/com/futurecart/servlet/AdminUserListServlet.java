package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.AdminUserListBusiness;
import com.futurecart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/adminUsers")
public class AdminUserListServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req,
                           HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // 🔐 Admin security
        if (session == null || session.getAttribute("adminName") == null) {
            res.sendRedirect("AdminLogin.html");
            return;
        }

        AdminUserListBusiness biz =
                new AdminUserListBusiness();

        ArrayList<User> users = biz.getAllUsers();

        req.setAttribute("users", users);
        req.getRequestDispatcher("adminUsers.jsp")
           .forward(req, res);
    }
}