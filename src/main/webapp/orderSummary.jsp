<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.futurecart.model.CartItem" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

<%
ArrayList<CartItem> cart =
    (ArrayList<CartItem>) request.getAttribute("cart");

NumberFormat nf = NumberFormat.getInstance(new Locale("en","IN"));
double grandTotal = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Summary - FutureCart</title>

<style>
body {
    font-family: system-ui, Arial, sans-serif;
    background: #f1f3f6;
    margin: 0;
    padding: 0;
}

.summary-container {
    max-width: 900px;
    margin: 40px auto;
    background: #ffffff;
    padding: 24px;
    border-radius: 12px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.08);
}

.summary-title {
    font-size: 22px;
    font-weight: 800;
    margin-bottom: 20px;
    border-bottom: 1px solid #eee;
    padding-bottom: 12px;
}

/* ITEM ROW */
.summary-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 14px 0;
    border-bottom: 1px solid #f0f0f0;
}

.item-left {
    display: flex;
    flex-direction: column;
}

.item-name {
    font-size: 15px;
    font-weight: 600;
    color: #212121;
}

.item-qty {
    font-size: 13px;
    color: #757575;
    margin-top: 4px;
}

.item-price {
    font-size: 14px;
    font-weight: 700;
}

/* TOTAL BOX */
.total-box {
    margin-top: 24px;
    padding-top: 16px;
    border-top: 2px dashed #e0e0e0;
    text-align: right;
}

.total-box h3 {
    font-size: 20px;
    font-weight: 800;
    margin-bottom: 16px;
}

/* BUTTON */
.pay-btn {
    padding: 14px 36px;
    border-radius: 999px;
    border: none;
    background: #ff3f6c;
    color: white;
    font-size: 15px;
    font-weight: 700;
    cursor: pointer;
}

.pay-btn:hover {
    background: #e7335d;
}
</style>
</head>

<body>

<div class="summary-container">

    <div class="summary-title">Order Summary</div>

    <% for (CartItem item : cart) {
        double total =
            item.getProduct().getPrice() * item.getQuantity();
        grandTotal += total;
    %>

    <div class="summary-item">
        <div class="item-left">
            <div class="item-name">
                <%= item.getProduct().getName() %>
            </div>
            <div class="item-qty">
                Quantity: <%= item.getQuantity() %>
            </div>
        </div>

        <div class="item-price">
            ₹<%= nf.format(total) %>
        </div>
    </div>

    <% } %>

    <div class="total-box">
        <h3>Total Amount: ₹<%= nf.format(grandTotal) %></h3>

        <form action="payment" method="get">
            <button class="pay-btn">
                PROCEED TO PAYMENT
            </button>
        </form>
    </div>

</div>

</body>
</html>