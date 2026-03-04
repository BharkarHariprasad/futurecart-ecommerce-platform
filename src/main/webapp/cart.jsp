<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.futurecart.model.CartItem" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

<%
ArrayList<CartItem> cart =
(ArrayList<CartItem>) request.getAttribute("cart");

    NumberFormat nf = NumberFormat.getInstance(new Locale("en", "IN"));
    double grandTotal = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart - FutureCart</title>

<style>
body {
    font-family: system-ui, Arial, sans-serif;
    background: #f5f5f5;
    margin: 0;
    padding: 0;
}

.cart-container {
    max-width: 1100px;
    margin: 30px auto;
    background: #ffffff;
    padding: 20px;
    border-radius: 8px;
}

.cart-container {
    min-height: 55vh;
    display: flex;
    flex-direction: column;
}

.cart-container {
    flex: 1;   /* pushes footer down */
}


.cart-title {
    font-size: 24px;
    font-weight: 800;
    margin-bottom: 20px;
}

.cart-item {
    display: flex;
    gap: 16px;
    padding: 16px 0;
    border-bottom: 1px solid #e0e0e0;
}

.cart-img {
    width: 120px;
    height: 120px;
    background: #fafafa;
    display: flex;
    align-items: center;
    justify-content: center;
}

.cart-img img {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
}

.cart-info {
    flex: 1;
}

.cart-name {
    font-size: 16px;
    font-weight: 700;
    margin-bottom: 6px;
}

.cart-price {
    font-size: 15px;
    font-weight: 700;
    margin-bottom: 6px;
}

.cart-qty {
    font-size: 14px;
    color: #555;
}

.cart-actions {
    margin-top: 10px;
}

.cart-actions a {
    color: #ff3f6c;
    font-weight: 700;
    font-size: 13px;
    text-decoration: none;
    margin-right: 12px;
}

.cart-actions a:hover {
    text-decoration: underline;
}

/* TOTAL */
.cart-total {
    text-align: right;
    margin-top: 20px;
}

.cart-total h3 {
    font-size: 20px;
    font-weight: 800;
}

/* BUTTON */
.checkout-btn {
    margin-top: 10px;
    padding: 12px 26px;
    border-radius: 999px;
    border: none;
    background: #ff3f6c;
    color: white;
    font-size: 15px;
    font-weight: 700;
    cursor: pointer;
}

.checkout-btn:hover {
    background: #e7335d;
}

.empty-cart {
    text-align: center;
    padding: 40px;
    font-size: 16px;
    color: #757575;
}

.cart-page {
    max-width: 1200px;
    margin: 30px auto;
    display: grid;
    grid-template-columns: 2fr 1fr;
    gap: 20px;
}

.cart-left {
    background: #ffffff;
    padding: 20px;
    border-radius: 8px;
}

.cart-right {
    background: #ffffff;
    padding: 20px;
    border-radius: 8px;
    height: fit-content;
    position: sticky;
    top: 90px;
}

.cart-right h3 {
    font-size: 16px;
    margin-bottom: 15px;
}

.price-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
    font-size: 14px;
}

.price-row.total {
    font-weight: 800;
    font-size: 16px;
}
</style>
</head>

<body>

<jsp:include page="Header.jsp" />

<div class="cart-page">

    <!-- LEFT : CART ITEMS -->
    <div class="cart-left">

        <div class="cart-title">My Cart</div>

        <% if (cart == null || cart.isEmpty()) { %>
            <div class="empty-cart">
                Your cart is empty 🛒 <br><br>
                <a href="LandingPage.jsp">Shop now</a>
            </div>
        <% } else {
            for (CartItem item : cart) {
                double total = item.getProduct().getPrice() * item.getQuantity();
                grandTotal += total;
        %>

        <div class="cart-item">
            <div class="cart-img">
                <img src="<%= item.getProduct().getImageUrl() %>">
            </div>

            <div class="cart-info">
                <div class="cart-name">
                    <%= item.getProduct().getName() %>
                </div>

                <div class="cart-price">
                    ₹<%= nf.format(item.getProduct().getPrice()) %>
                </div>

                <div class="cart-qty">
                    Quantity: <%= item.getQuantity() %>
                </div>

                <div class="cart-actions">
                    <a href="addToCart?productId=<%= item.getProduct().getProductId() %>">+ Add One</a>
                    <a href="removeFromCart?productId=<%= item.getProduct().getProductId() %>">Remove</a>
                </div>
            </div>
        </div>

        <% } } %>

    </div>

    <!-- RIGHT : PRICE DETAILS -->
    <div class="cart-right">

        <h3>PRICE DETAILS</h3>

        <div class="price-row">
            <span>Price (<%= cart != null ? cart.size() : 0 %> items)</span>
            <span>₹<%= nf.format(grandTotal) %></span>
        </div>

        <div class="price-row">
            <span>Delivery Charges</span>
            <span style="color:green">FREE</span>
        </div>

        <hr>

        <div class="price-row total">
            <span>Total Amount</span>
            <span>₹<%= nf.format(grandTotal) %></span>
        </div>

        <form action="orderSummary" method="get">
    <button class="checkout-btn">PLACE ORDER</button>
</form>

    </div>

</div>

<jsp:include page="Footer.jsp" />

</body>
</html>