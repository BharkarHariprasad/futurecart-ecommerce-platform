package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.AdminViewUserBusiness;
import com.futurecart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/adminViewUser")
public class AdminViewUserServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req,
                           HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // 🔐 Admin Security
        if (session == null || session.getAttribute("adminName") == null) {
            res.sendRedirect("AdminLogin.html");
            return;
        }

        int userId = Integer.parseInt(req.getParameter("userId"));

        AdminViewUserBusiness biz =
                new AdminViewUserBusiness();

        User user = biz.getUserById(userId);

        req.setAttribute("user", user);
        req.getRequestDispatcher("adminViewUser.jsp")
           .forward(req, res);
    }
}