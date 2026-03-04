package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.CartBusiness;
import com.futurecart.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderSummary")
public class OrderSummaryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("Login.html");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        // 🔥 FETCH CART FROM DATABASE AGAIN
        ArrayList<CartItem> cart =
            new CartBusiness().getCartItems(userId);

        if (cart == null || cart.isEmpty()) {
            res.sendRedirect("cart");
            return;
        }
        
        double totalAmount = 0;
        for (CartItem item : cart) {
            totalAmount += item.getProduct().getPrice() * item.getQuantity();
        }

        session.setAttribute("orderAmount", totalAmount);

        req.setAttribute("cart", cart);
        req.getRequestDispatcher("orderSummary.jsp")
           .forward(req, res);
    }
}