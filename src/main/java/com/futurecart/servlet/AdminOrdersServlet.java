package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.AdminOrderBusiness;
import com.futurecart.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminOrders")
public class AdminOrdersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        ArrayList<Order> orders =
            new AdminOrderBusiness().getAllOrders();

        req.setAttribute("orders", orders);
        req.getRequestDispatcher("adminOrders.jsp")
           .forward(req, res);
    }
}