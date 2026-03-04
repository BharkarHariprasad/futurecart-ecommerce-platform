package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.OrderBusiness;
import com.futurecart.model.Order;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/orders")
public class ViewOrdersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("Login.html");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        ArrayList<Order> orders =
            new OrderBusiness().getUserOrders(userId);

        req.setAttribute("orders", orders);
        req.getRequestDispatcher("orders.jsp").forward(req, res);
    }
}