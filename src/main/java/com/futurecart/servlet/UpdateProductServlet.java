package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.UpdateProductBusiness;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        HttpSession session = req.getSession(false);

        // 🔐 Admin security check
        if (session == null || session.getAttribute("adminName") == null) {
            res.sendRedirect("AdminLogin.html");
            return;
        }

        int productId = Integer.parseInt(req.getParameter("productId"));
        String name = req.getParameter("product_name");
        double price = Double.parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        String image = req.getParameter("product_image");
        String featured = req.getParameter("featuredProduct");

        UpdateProductBusiness biz = new UpdateProductBusiness();

        boolean updated = biz.updateProduct(
                productId, name, price, description, image, featured
        );

        if (updated) {
            res.sendRedirect("adminDashboard?msg=updated");
        } else {
            res.sendRedirect("adminDashboard?msg=update_failed");
        }
    }
}