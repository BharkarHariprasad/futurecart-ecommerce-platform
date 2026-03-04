package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.RemoveFromCartBusiness;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req,
                         HttpServletResponse res)
            throws IOException {

        HttpSession session = req.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            res.sendRedirect("Login.html");
            return;
        }

        int productId =
            Integer.parseInt(req.getParameter("productId"));

        RemoveFromCartBusiness biz =
            new RemoveFromCartBusiness();

        biz.removeItem(userId, productId);

        res.sendRedirect("cart");
    }
}