<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.ArrayList" %>
<%@ page import="com.futurecart.model.SavedCard" %>

<%
ArrayList<SavedCard> cards =
    (ArrayList<SavedCard>) request.getAttribute("cards");

Double totalAmount =
    (Double) request.getAttribute("totalAmount");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment - FutureCart</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #f5f7fb, #e6edf7);
            margin: 0;
            padding: 24px 12px;
            color: #222;
        }

        /* MAIN LAYOUT */
        .page-shell {
            max-width: 520px;
            margin: 0 auto;
        }

        .brand-header {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 16px;
        }

        .brand-dot {
            width: 32px;
            height: 32px;
            border-radius: 10px;
            background: #ff3f6c;
            box-shadow: 0 6px 16px rgba(255, 63, 108, 0.45);
        }

        .brand-title {
            font-weight: 800;
            font-size: 20px;
        }

        /* MAIN CARD */
        .payment-wrapper {
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 16px 40px rgba(15, 23, 42, 0.10);
            padding: 22px 22px 20px;
        }

        .payment-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 6px;
        }

        .payment-title {
            font-size: 22px;
            font-weight: 800;
            letter-spacing: 0.02em;
        }

        .payment-subtitle {
            font-size: 12px;
            color: #667085;
        }

        .amount-chip {
            padding: 6px 10px;
            border-radius: 999px;
            background: #f9fafb;
            font-size: 13px;
            font-weight: 600;
            color: #111827;
            border: 1px solid #e5e7eb;
        }

        /* TABS */
        .tab-bar {
            display: flex;
            border-radius: 999px;
            background: #f3f4f6;
            padding: 3px;
            margin: 14px 0 18px;
        }

        .tab-btn {
            flex: 1;
            padding: 9px 12px;
            background: transparent;
            border: none;
            border-radius: 999px;
            font-size: 13px;
            font-weight: 700;
            color: #6b7280;
            cursor: pointer;
            transition: all 0.18s ease;
        }

        .tab-btn.active {
            color: #ffffff;
            background: #ff3f6c;
            box-shadow: 0 8px 18px rgba(255, 63, 108, 0.45);
        }

        /* FORM SECTIONS */
        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        /* SAVED CARD BOX */
        .saved-card {
            background: linear-gradient(145deg, #111827, #020617);
            border-radius: 14px;
            padding: 16px 16px 14px;
            margin-bottom: 16px;
            color: #f9fafb;
            position: relative;
            overflow: hidden;
        }

        .saved-card::after {
            content: "";
            position: absolute;
            right: -18px;
            top: -18px;
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: radial-gradient(circle at 30% 30%, #f97316, transparent 60%);
            opacity: 0.7;
        }

        .saved-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 6px;
            position: relative;
            z-index: 1;
        }

        .saved-card h4 {
            margin: 0;
            font-size: 15px;
            letter-spacing: 0.12em;
            text-transform: uppercase;
        }

        .saved-card p {
            margin: 0;
            font-size: 13px;
            color: #e5e7eb;
            position: relative;
            z-index: 1;
        }

        .card-chip {
            width: 26px;
            height: 20px;
            border-radius: 6px;
            background: linear-gradient(135deg, #facc15, #eab308);
            box-shadow: 0 4px 8px rgba(0,0,0,0.35);
        }

        /* FORM */
        .form-group {
            margin-bottom: 12px;
        }

        .form-group label {
            display: block;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 5px;
            color: #374151;
        }

        .form-group input {
            width: 100%;
            height: 40px;
            padding: 8px 12px;
            border-radius: 10px;
            border: 1px solid #d1d5db;
            font-size: 14px;
            line-height: 24px;
            background: #f9fafb;
            transition: border-color 0.16s ease, box-shadow 0.16s ease, background 0.16s ease;
        }

        .form-group input:focus {
            border-color: #ff3f6c;
            outline: none;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(255, 63, 108, 0.18);
        }

        /* BUTTON */
        .pay-btn {
            width: 100%;
            height: 46px;
            border-radius: 999px;
            border: none;
            background: linear-gradient(135deg, #ff3f6c, #ff6b8b);
            color: #fff;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            margin-top: 10px;
            letter-spacing: 0.04em;
            box-shadow: 0 14px 30px rgba(255, 63, 108, 0.45);
            transition: transform 0.1s ease, box-shadow 0.1s ease, filter 0.1s ease;
        }

        .pay-btn:hover {
            filter: brightness(1.05);
            transform: translateY(-1px);
            box-shadow: 0 16px 34px rgba(255, 63, 108, 0.55);
        }

        .pay-btn:active {
            transform: translateY(0);
            box-shadow: 0 10px 22px rgba(255, 63, 108, 0.45);
        }

        /* CARD NUMBER LOOK */
        input[name="cardNumber"] {
            letter-spacing: 1px;
        }

        /* EXPIRY + CVV ROW */
        .card-row {
            display: flex;
            gap: 10px;
        }

        .card-row .form-group {
            flex: 1;
            margin-bottom: 0;
        }

        /* CVV SMALLER */
        input[name="cvv"] {
            letter-spacing: 2px;
        }

        /* FOOTNOTE */
        .helper-text {
            margin-top: 10px;
            font-size: 11px;
            color: #6b7280;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .secure-dot {
            width: 8px;
            height: 8px;
            border-radius: 999px;
            background: #22c55e;
        }

        /* RESPONSIVE */
        @media (max-width: 480px) {
            .payment-wrapper {
                padding: 18px 16px 16px;
            }

            .payment-header {
                flex-direction: column;
                gap: 6px;
            }

            .card-row {
                flex-direction: column;
            }
        }
    </style>

    <script>
        function switchTab(tab) {
            document.getElementById("saved").classList.remove("active");
            document.getElementById("new").classList.remove("active");
            document.getElementById("btnSaved").classList.remove("active");
            document.getElementById("btnNew").classList.remove("active");

            document.getElementById(tab).classList.add("active");
            document.getElementById("btn" + tab.charAt(0).toUpperCase() + tab.slice(1)).classList.add("active");
        }
    </script>
</head>

<body>
<div class="page-shell">
    <div class="brand-header">
        <div class="brand-dot"></div>
        <div>
            <div class="brand-title">FutureCart</div>
            <div class="payment-subtitle">Secure checkout</div>
        </div>
    </div>

    <div class="payment-wrapper">
        <div class="payment-header">
            <div>
                <div class="payment-title">Payment</div>
                <div class="payment-subtitle">Choose a card to complete your order</div>
            </div>
            <div class="amount-chip">
                ₹ <%= totalAmount != null ? totalAmount : 0 %>
            </div>
        </div>

        <!-- TABS -->
<div class="tab-bar">
    <button id="btnSaved" class="tab-btn active" onclick="switchTab('saved')">
        SAVED CARD
    </button>
    <button id="btnNew" class="tab-btn" onclick="switchTab('new')">
        NEW CARD
    </button>
</div>

<!-- ===== SAVED CARD TAB ===== -->
<div id="saved" class="tab-content active">

<% if (cards == null || cards.isEmpty()) { %>

    <p style="font-size:13px;color:#6b7280;">
        No saved cards found. Please add a new card.
    </p>

<% } else { %>

<form action="validateSavedCard" method="post">

    <% for (SavedCard c : cards) { %>

        <label style="display:block; cursor:pointer;">
            <div class="saved-card">
                <div class="saved-card-header">
                    <h4>
                        <input
                            type="radio"
                            name="cardId"
                            value="<%= c.getCardId() %>"
                            required
                            style="margin-right:10px;"
                        >
                        <%= c.getMaskedNumber() %>
                    </h4>
                    <div class="card-chip"></div>
                </div>
                <p>Expiry <%= c.getExpiryMonth() %>/<%= c.getExpiryYear() %></p>
            </div>
        </label>

    <% } %>

    <div class="form-group">
        <label>CVV</label>
        <input type="password"
               name="cvv"
               placeholder="***"
               maxlength="3"
               required>
    </div>

    <button type="submit" class="pay-btn">
        PAY NOW
    </button>

</form>

<% } %>

</div> <!-- ✅ END SAVED TAB -->

<!-- ===== NEW CARD TAB ===== -->
<div id="new" class="tab-content">

    <form action="addNewCard" method="post">
        <div class="form-group">
            <label>Card Number</label>
            <input type="text" name="cardNumber"
                   placeholder="1234 5678 9012 3456" required>
        </div>
        
        <div class="form-group">
    <label for="cardName">Card Holder Name</label>
    <input
        type="text"
        id="cardName"
        name="cardName"
        placeholder="Name on card"
        required
    >
</div>

        <div class="card-row">
            <div class="form-group">
                <label>Expiry (MM/YY)</label>
                <input type="text" name="expiry"
                       placeholder="MM/YY" required>
            </div>

            <div class="form-group">
                <label>CVV</label>
                <input type="password" name="cvv"
                       placeholder="***" required>
            </div>
        </div>

        <button type="submit" class="pay-btn">SAVE & PAY</button>
    </form>

</div>

        <div class="helper-text">
            <span class="secure-dot"></span>
            <span>Your card details are encrypted &amp; processed securely.</span>
        </div>
    </div>
</div>
</body>
</html>


