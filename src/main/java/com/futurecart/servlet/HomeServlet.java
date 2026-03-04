package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.HomeBusiness;
import com.futurecart.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HomeBusiness biz = new HomeBusiness();
        ArrayList<Product> featuredProducts = biz.getFeaturedProducts();
        
        req.setAttribute("featuredProducts", featuredProducts);

        req.getRequestDispatcher("LandingPage.jsp").forward(req, res);
    }
}