package com.futurecart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.futurecart.business.CartBusiness;
import com.futurecart.business.ValidateSavedCardBusiness;
import com.futurecart.model.CartItem;
import com.futurecart.model.Product;
import com.futurecart.persistence.CartPersistence;
import com.futurecart.persistence.OrderSavePersistence;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/validateSavedCard")
public class ValidateSavedCardServlet extends HttpServlet {

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
        int cardId = Integer.parseInt(req.getParameter("cardId"));
        int cvv = Integer.parseInt(req.getParameter("cvv"));

        boolean valid =
            new ValidateSavedCardBusiness().validate(cardId, cvv);

        if (!valid) {
            res.sendRedirect("paymentFailed.html");
            return;
        }

        // ✅ PAYMENT SUCCESS LOGIC STARTS HERE

        Double orderAmount =
            (Double) session.getAttribute("orderAmount");

        if (orderAmount == null) {
            res.sendRedirect("cart");
            return;
        }

        OrderSavePersistence orderDao =
            new OrderSavePersistence();

        int orderId =
            orderDao.createOrder(userId, orderAmount);

        Boolean buyNow =
            (Boolean) session.getAttribute("buyNow");

        if (buyNow != null && buyNow) {

            // ✅ BUY NOW FLOW
            Product p =
                (Product) session.getAttribute("buyNowProduct");

            ArrayList<CartItem> temp = new ArrayList<>();
            temp.add(new CartItem(p, 1));

            orderDao.saveOrderItems(orderId, temp);

            session.removeAttribute("buyNow");
            session.removeAttribute("buyNowProduct");

        } else {

            // ✅ CART FLOW
            ArrayList<CartItem> cart =
                new CartBusiness().getCartItems(userId);

            orderDao.saveOrderItems(orderId, cart);

            // 🔥 CLEAR CART (YOUR CLASS IS USED HERE)
            new CartPersistence().clearCart(userId);
        }

        session.removeAttribute("orderAmount");
        
        session.removeAttribute("selectedAddressId");

        res.sendRedirect("paymentSuccess.jsp");
    }
}