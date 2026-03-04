package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.AddToCartBusiness;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        HttpSession session = req.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            res.sendRedirect("Login.html");
            return;
        }

        int productId = Integer.parseInt(req.getParameter("productId"));

        new AddToCartBusiness().addToCart(userId, productId);

        res.sendRedirect(req.getHeader("Referer"));
    }
}