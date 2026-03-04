package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.EditProductBusiness;
import com.futurecart.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editProduct")
public class EditProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        int productId = Integer.parseInt(req.getParameter("productId"));

        EditProductBusiness biz = new EditProductBusiness();
        Product product = biz.getProductById(productId);

        req.setAttribute("product", product);
        req.getRequestDispatcher("updateProduct.jsp")
           .forward(req, res);
    }
}