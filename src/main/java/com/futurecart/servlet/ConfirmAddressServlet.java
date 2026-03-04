package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.AddressDisplayBusiness;
import com.futurecart.model.Address;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/confirmAddress")
public class ConfirmAddressServlet extends HttpServlet {

    // 🔹 STEP 1: SHOW ADDRESS PAGE
    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("Login.html");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        AddressDisplayBusiness biz = new AddressDisplayBusiness();
        ArrayList<Address> list = biz.getAddress(userId);

        req.setAttribute("savedAddress", list);
        req.getRequestDispatcher("selectAddress.jsp")
           .forward(req, res);
    }

    // 🔹 STEP 2: HANDLE FORM SUBMIT
    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException, IOException {

        String addrParam = req.getParameter("addressId");

        // 🛡 SAFETY CHECK
        if (addrParam == null) {
            res.sendRedirect("confirmAddress");
            return;
        }

        int addressId = Integer.parseInt(addrParam);

        HttpSession session = req.getSession();
        session.setAttribute("selectedAddressId", addressId);

        res.sendRedirect("payment");
    }
}