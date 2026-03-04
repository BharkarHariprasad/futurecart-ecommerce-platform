package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.ProductDetailsBusiness;
import com.futurecart.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/buyNow")
public class BuyNowServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("Login.html");
            return;
        }

        int productId =
            Integer.parseInt(req.getParameter("productId"));

        // ✅ USE ProductDetailsBusiness
        Product product =
            new ProductDetailsBusiness().getProductById(productId);

        if (product == null) {
            res.sendRedirect("home");
            return;
        }

        // ✅ DIRECT BUY → quantity = 1
        session.setAttribute("orderAmount", product.getPrice());
        session.setAttribute("buyNowProduct", product);
        session.setAttribute("buyNow", true);

        res.sendRedirect("payment");
    }
}