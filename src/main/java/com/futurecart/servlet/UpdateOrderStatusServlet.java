package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.AdminOrderBusiness;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateOrderStatus")
public class UpdateOrderStatusServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        int orderId = Integer.parseInt(req.getParameter("orderId"));
        String status = req.getParameter("status");

        new AdminOrderBusiness().updateOrderStatus(orderId, status);

        res.sendRedirect("adminOrders");
    }
}