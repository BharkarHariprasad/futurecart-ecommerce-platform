package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.SavedCardBusiness;
import com.futurecart.model.SavedCard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payment")
public class PaymentPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // 🔐 Login check
        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("Login.html");
            return;
        }

        // 📍 Address must be confirmed
        Integer addressId =
            (Integer) session.getAttribute("selectedAddressId");

        if (addressId == null) {
            res.sendRedirect("confirmAddress");
            return;
        }

        // 💰 Order amount check
        Double totalAmount =
            (Double) session.getAttribute("orderAmount");

        if (totalAmount == null) {
            res.sendRedirect("cart");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        // 💳 Load saved cards
        SavedCardBusiness biz = new SavedCardBusiness();
        ArrayList<SavedCard> cards = biz.getUserCards(userId);

        // ✅ Pass data to JSP
        req.setAttribute("cards", cards);
        req.setAttribute("totalAmount", totalAmount);
        req.setAttribute("addressId", addressId); // ⭐ important

        req.getRequestDispatcher("paymentPage.jsp")
           .forward(req, res);
    }
}