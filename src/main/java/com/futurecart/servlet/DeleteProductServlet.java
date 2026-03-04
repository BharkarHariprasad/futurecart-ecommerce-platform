package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.DeleteProductBusiness;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        String adminName = (String) session.getAttribute("adminName");

        if (adminName == null) {
            res.sendRedirect("AdminLogin.html");
            return;
        }

        int productId = Integer.parseInt(req.getParameter("productId"));

        DeleteProductBusiness biz = new DeleteProductBusiness();
        boolean result = biz.deleteProduct(productId);

        if (result) {
            res.sendRedirect("adminDashboard?msg=product_deleted");
        } else {
            res.sendRedirect("adminDashboard?msg=delete_failed");
        }
    }
}