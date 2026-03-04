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

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("Login.html");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        // 🔥 FETCH CART FROM DATABASE
        ArrayList<CartItem> cart =
            new CartBusiness().getCartItems(userId);

        req.setAttribute("cart", cart);

        req.getRequestDispatcher("cart.jsp")
           .forward(req, res);
    }
}