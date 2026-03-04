package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.AdminDeleteProductBusiness;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/adminDeleteProduct")
public class AdminDeleteProductServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        HttpSession session = req.getSession(false);

        // 🔐 Security check
        if (session == null || session.getAttribute("adminName") == null) {
        	res.sendRedirect(req.getContextPath() + "/AdminLogin.html");
            return;
        }

        int productId = Integer.parseInt(req.getParameter("productId"));

        
        System.out.println("DELETE SERVLET HIT");
        System.out.println("Product ID = " + productId);
        
        AdminDeleteProductBusiness biz =
                new AdminDeleteProductBusiness();

        boolean deleted = biz.deleteProduct(productId);

        if (deleted) {
        	res.sendRedirect(req.getContextPath() + "/adminDashboard");
        } else {
            res.sendRedirect("adminDashboard?msg=delete_failed");
        }
    }
}