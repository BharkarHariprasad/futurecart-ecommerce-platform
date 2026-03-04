package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.ProductDetailsBusiness;
import com.futurecart.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/productDetails")
public class ProductDetailsServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int productId = Integer.parseInt(req.getParameter("productId"));

        ProductDetailsBusiness biz = new ProductDetailsBusiness();
        Product product = biz.getProductById(productId);

        req.setAttribute("product", product);

        req.getRequestDispatcher("productDetails.jsp").forward(req, res);
    }
}