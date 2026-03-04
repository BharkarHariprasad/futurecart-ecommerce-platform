package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.AdminProductListBusiness;
import com.futurecart.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin/products")
public class AdminProductListServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req,
                           HttpServletResponse res)
            throws ServletException, IOException {

        // Admin session check
        HttpSession session = req.getSession();
        if (session.getAttribute("adminName") == null) {
            res.sendRedirect("AdminLogin.html");
            return;
        }

        AdminProductListBusiness biz =
                new AdminProductListBusiness();

        ArrayList<Product> products =
                biz.getAllProducts();

        req.setAttribute("products", products);
        req.getRequestDispatcher("AdminDashboard.jsp")
           .forward(req, res);
    }
}