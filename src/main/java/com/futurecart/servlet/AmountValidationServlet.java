package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.AmountBusiness;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/validateAmount")
public class AmountValidationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("cardId") == null) {
            res.sendRedirect("paymentPage.jsp");
            return;
        }

        int cardId = (int) session.getAttribute("cardId");

        // example: total amount from order
        Double orderAmount = (Double) session.getAttribute("orderAmount");

        if (orderAmount == null) {
            res.sendRedirect("cart");
            return;
        }

        AmountBusiness biz = new AmountBusiness();
        boolean success = biz.validateAndDeduct(cardId, orderAmount);

        if (success) {
            res.sendRedirect("paymentSuccess.jsp");
        } else {
            res.sendRedirect("paymentPage.jsp?error=insufficient_balance");
        }
    }
}