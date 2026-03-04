<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@ page import="java.util.ArrayList" %>
<%@ page import="com.futurecart.model.CartItem" %>

<%@ page import="com.futurecart.business.CartCountBusiness" %>

<%
Integer userId = (Integer) session.getAttribute("userId");
int cartCount = 0;

if (userId != null) {
    CartCountBusiness biz = new CartCountBusiness();
    cartCount = biz.getCartCount(userId);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

<style>
/* ========== RESET & BASE ========== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
    background-color: #f5f5f5;
}

a {
    text-decoration: none;
    color: inherit;
}

/* ========== HEADER ========== */
.fc-header {
    position: sticky;
    top: 0;
    z-index: 100;
    background-color: #ffffff;
    border-bottom: 1px solid #e0e0e0;
}

.fc-header-inner {
    max-width: 1300px;
    margin: 0 auto;
    height: 72px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 16px;
}

/* ========== LOGO ========== */
.fc-logo {
    display: flex;
    align-items: center;
    gap: 10px;
}

.fc-logo-icon {
    width: 42px;
    height: 42px;
    border-radius: 12px;
    background: linear-gradient(135deg, #ff3f6c, #ff7a18);
    display: flex;
    align-items: center;
    justify-content: center;
    color: #ffffff;
    font-weight: 900;
    font-size: 20px;
}

.fc-logo-text {
    display: flex;
    flex-direction: column;
    line-height: 1.1;
}

.fc-logo-main {
    font-size: 18px;
    font-weight: 800;
    letter-spacing: 0.08em;
    color: #282c3f;
}

.fc-logo-sub {
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 0.14em;
    color: #ff3f6c;
}

/* ========== NAV (NO DROPDOWNS) ========== */
.fc-nav {
    display: flex;
    gap: 22px;
    flex: 1;
    justify-content: center;
}

.fc-nav-link {
    font-size: 13px;
    font-weight: 700;
    letter-spacing: 0.06em;
    text-transform: uppercase;
    color: #282c3f;
    position: relative;
}

.fc-nav-link::after {
    content: "";
    position: absolute;
    left: 0;
    bottom: -6px;
    width: 0%;
    height: 2px;
    background: #ff3f6c;
    transition: width 0.3s ease;
}

.fc-nav-link:hover::after {
    width: 100%;
}

/* ========== RIGHT SIDE ========== */
.fc-right {
    display: flex;
    align-items: center;
    gap: 48px;
}

.fc-right-item {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    font-size: 11px;
    text-transform: uppercase;
    color: #282c3f;
    cursor: pointer;
}

.fc-icon {
    font-size: 16px;
    margin-bottom: 4px;
}

.fc-right-label {
    font-size: 11px;
    font-weight: 600;
    letter-spacing: 0.08em;
}

/* CART COUNT BADGE */
.fc-cart-badge {
    position: absolute;
    top: -4px;
    right: -10px;
    background: #ff3f6c;
    color: #ffffff;
    font-size: 10px;
    font-weight: 700;
    min-width: 18px;
    height: 18px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* ========== PROFILE DROPDOWN (KEEP) ========== */
.fc-profile-dropdown {
    position: absolute;
    top: 100%;
    left: 50%;
    transform: translateX(-50%);
    margin-top: 17px;
    width: 280px;
    background: #ffffff;
    border-radius: 4px;
    border: 1px solid #e0e0e0;
    box-shadow: 0 8px 24px rgba(0,0,0,0.12);
    padding: 14px;
    font-size: 13px;
    color: #282c3f;
    display: none;
}

.fc-right-item.profile::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 0;
    width: 100%;
    height: 17px;
}

.fc-right-item.profile:hover .fc-profile-dropdown,
.fc-profile-dropdown:hover {
    display: block;
}

.fc-profile-title {
    font-weight: 600;
    margin-bottom: 6px;
}

.fc-profile-sub {
    font-size: 11px;
    color: #757575;
    margin-bottom: 10px;
}

.fc-profile-separator {
    height: 1px;
    background: #eeeeee;
    margin: 8px 0;
}

.fc-profile-list {
    list-style: none;
}

.fc-profile-list li {
    padding: 4px 0;
    font-size: 13px;
}

.fc-profile-list li:hover {
    color: #ff3f6c;
}

/* Login / Signup button */
.nav-cta {
    display: block;
    padding: 6px 0;
    font-size: 13px;
    font-weight: 600;
}

.nav-cta:hover {
    color: #ff3f6c;
}

/* ========== RESPONSIVE ========== */
@media (max-width: 900px) {
    .fc-nav {
        display: none;
    }
}
</style>

</head>
<body>

<header class="fc-header">
    <div class="fc-header-inner">

        <!-- LOGO -->
        <a href="home" class="fc-logo">
            <div class="fc-logo-icon">F</div>
            <div class="fc-logo-text">
                <span class="fc-logo-main">FUTURECART</span>
                <span class="fc-logo-sub">SMART SHOPPING</span>
            </div>
        </a>

        <!-- NAV (NO DROPDOWNS) -->
        <nav class="fc-nav">
            <a href="categoryProducts?categoryId=1" class="fc-nav-link">Mobiles</a>
            <a href="categoryProducts?categoryId=3" class="fc-nav-link">Laptops</a>
            <a href="categoryProducts?categoryId=6" class="fc-nav-link">Speakers</a>
            <a href="categoryProducts?categoryId=5" class="fc-nav-link">TV</a>
            <a href="categoryProducts?categoryId=4" class="fc-nav-link">Home Appliances</a>
        </nav>

        <!-- RIGHT -->
        <div class="fc-right">

            <!-- PROFILE -->
            <div class="fc-right-item profile">
                <span class="fc-icon">👤</span>
                <span class="fc-right-label">Profile</span>

                <div class="fc-profile-dropdown">
                    <div class="fc-profile-title">Welcome</div>
                    <div class="fc-profile-sub">
                        To access account and manage orders
                    </div>

                    <a href="Login.html" class="nav-cta">Login / Signup</a>

                    <div class="fc-profile-separator"></div>

                    <ul class="fc-profile-list">
                    	<li><a href="orders">My Orders</a></li>
                        <li><a href="addresses">Saved Addresses</a></li>
                        <li><a href="logout">Logout</a></li>
                    </ul>
                </div>
            </div>

            <!-- BAG -->
<!-- BAG -->
<div class="fc-right-item">

    <a href="cart" style="position:relative; display:flex; flex-direction:column; align-items:center;">

        <span class="fc-icon">🛍️</span>

        <% if (cartCount > 0) { %>
            <span class="fc-cart-badge"><%= cartCount %></span>
        <% } %>

        <span class="fc-right-label">Bag</span>

    </a>
</div>

        </div>
    </div>
</header>

</body>
</html>