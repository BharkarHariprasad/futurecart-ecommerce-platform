package com.futurecart.servlet;

import java.io.IOException;

import com.futurecart.business.AddNewCardBusiness;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addNewCard")
public class AddNewCardServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("Login.html");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String cardNumber = req.getParameter("cardNumber");
        String cardName = req.getParameter("cardName");
        String expiry = req.getParameter("expiry"); // MM/YY
        int cvv = Integer.parseInt(req.getParameter("cvv"));

        int expiryMonth = Integer.parseInt(expiry.split("/")[0]);
        int expiryYear = Integer.parseInt("20" + expiry.split("/")[1]);

        AddNewCardBusiness biz = new AddNewCardBusiness();
        boolean saved = biz.saveCard(
                userId,
                cardNumber,
                cardName,
                cvv,
                expiryMonth,
                expiryYear
        );

        if (saved) {
            res.sendRedirect("payment");
        } else {
            res.sendRedirect("payment?error=card_save_failed");
        }
    }
}