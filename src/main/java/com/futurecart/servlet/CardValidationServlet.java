package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.CardBusiness;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/validateCard")
public class CardValidationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        long cardNumber = Long.parseLong(req.getParameter("cardNumber"));
        String cardName = req.getParameter("cardName");
        String expiryDate = req.getParameter("expiryDate");
        int cvv = Integer.parseInt(req.getParameter("cvv"));

        CardBusiness biz = new CardBusiness();
        int cardId = biz.validateCard(cardNumber, cardName, expiryDate, cvv);

        if (cardId > 0) {
            // ✅ Card valid → pass cardId to next servlet
            req.getSession().setAttribute("cardId", cardId);
            res.sendRedirect("validateAmount");
        } else {
            // ❌ Invalid card
            res.sendRedirect("paymentPage.jsp?error=invalid_card");
        }
    }
}