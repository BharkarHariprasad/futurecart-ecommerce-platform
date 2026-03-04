<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.ArrayList" %>
<%@ page import="com.futurecart.model.Order" %>

<%
ArrayList<Order> orders =
    (ArrayList<Order>) request.getAttribute("orders");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
    background: linear-gradient(135deg, #f5f7fb 0%, #e8ecf1 100%);
    /* padding: 30px; */
    min-height: 100vh;
}

.container {
    max-width: 900px;
    margin: auto;
    animation: fadeIn 0.6s ease-out;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

h2 {
	margin-top:20px;
    margin-bottom: 28px;
    font-size: 32px;
    font-weight: 800;
    color: #1f2937;
    position: relative;
    padding-bottom: 12px;
}

h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 60px;
    height: 4px;
    background: linear-gradient(90deg, #ff3f6c, #ff6b9d);
    border-radius: 2px;
    animation: expandLine 0.8s ease-out 0.3s both;
}

@keyframes expandLine {
    from {
        width: 0;
    }
    to {
        width: 60px;
    }
}

.order-card {
    background: white;
    padding: 24px;
    border-radius: 16px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    margin-bottom: 20px;
    border: 2px solid transparent;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    overflow: hidden;
    cursor: pointer;
    animation: slideIn 0.5s ease-out both;
    animation-delay: calc(var(--index, 0) * 0.1s);
}

@keyframes slideIn {
    from {
        opacity: 0;
        transform: translateX(-30px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

.order-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 63, 108, 0.1), transparent);
    transition: left 0.6s ease;
}

.order-card:hover::before {
    left: 100%;
}

.order-card:hover {
    transform: translateY(-6px) scale(1.01);
    box-shadow: 0 12px 32px rgba(0,0,0,0.15);
    border-color: #ff3f6c;
    background: linear-gradient(135deg, #ffffff 0%, #fff5f7 100%);
}

.order-card:active {
    transform: translateY(-2px) scale(0.99);
    transition: transform 0.1s ease;
}

.row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 12px;
    font-size: 15px;
    padding: 8px 0;
    transition: all 0.3s ease;
    position: relative;
}

.order-card:hover .row {
    padding-left: 8px;
}

.row:last-child {
    margin-bottom: 0;
}

.row span:first-child {
    color: #6b7280;
    font-weight: 500;
    transition: color 0.3s ease;
}

.order-card:hover .row span:first-child {
    color: #374151;
}

.row span:last-child {
    color: #1f2937;
    font-weight: 600;
    transition: all 0.3s ease;
}

.order-card:hover .row span:last-child {
    color: #111827;
    transform: translateX(-4px);
}

.row b {
    color: #1f2937;
    font-weight: 700;
    transition: color 0.3s ease;
}

.order-card:hover .row b {
    color: #ff3f6c;
}

.status {
    font-weight: 700;
    color: #22c55e;
    padding: 6px 14px;
    border-radius: 20px;
    background: rgba(34, 197, 94, 0.1);
    display: inline-block;
    position: relative;
    transition: all 0.4s ease;
    animation: pulseStatus 2s ease-in-out infinite;
}

@keyframes pulseStatus {
    0%, 100% {
        box-shadow: 0 0 0 0 rgba(34, 197, 94, 0.4);
    }
    50% {
        box-shadow: 0 0 0 8px rgba(34, 197, 94, 0);
    }
}

.order-card:hover .status {
    background: linear-gradient(135deg, #22c55e, #16a34a);
    color: white;
    transform: scale(1.1);
    box-shadow: 0 4px 12px rgba(34, 197, 94, 0.3);
    animation: none;
}

.status::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 8px;
    transform: translateY(-50%);
    width: 6px;
    height: 6px;
    background: currentColor;
    border-radius: 50%;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.order-card:hover .status::before {
    opacity: 1;
    animation: blink 1s ease-in-out infinite;
}

@keyframes blink {
    0%, 100% {
        opacity: 1;
    }
    50% {
        opacity: 0.3;
    }
}

/* Empty State */
p {
    text-align: center;
    padding: 60px 20px;
    color: #9ca3af;
    font-size: 16px;
    background: white;
    border-radius: 16px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    animation: fadeIn 0.6s ease-out;
}

/* Responsive Design */
@media (max-width: 768px) {
    body {
        padding: 20px 16px;
    }

    h2 {
        font-size: 26px;
        margin-bottom: 20px;
    }

    .order-card {
        padding: 20px;
        margin-bottom: 16px;
    }

    .row {
        font-size: 14px;
        flex-wrap: wrap;
        gap: 8px;
    }

    .status {
        padding: 5px 12px;
        font-size: 13px;
    }
}

@media (max-width: 480px) {
    h2 {
        font-size: 22px;
    }

    .order-card {
        padding: 16px;
    }

    .row {
        flex-direction: column;
        align-items: flex-start;
        gap: 4px;
    }

    .row span:last-child {
        transform: none;
    }
}

/* Focus states for accessibility */
.order-card:focus-within {
    outline: 3px solid #ff3f6c;
    outline-offset: 2px;
}

/* Subtle shine effect on hover */
.order-card {
    position: relative;
}

.order-card::after {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 50%;
    height: 100%;
    background: linear-gradient(
        90deg,
        transparent,
        rgba(255, 255, 255, 0.6),
        transparent
    );
    transition: left 0.5s ease;
    pointer-events: none;
}

.order-card:hover::after {
    left: 150%;
}

/* Stagger animation for multiple cards */
.order-card:nth-child(1) { --index: 0; }
.order-card:nth-child(2) { --index: 1; }
.order-card:nth-child(3) { --index: 2; }
.order-card:nth-child(4) { --index: 3; }
.order-card:nth-child(5) { --index: 4; }
.order-card:nth-child(6) { --index: 5; }
.order-card:nth-child(7) { --index: 6; }
.order-card:nth-child(8) { --index: 7; }
.order-card:nth-child(9) { --index: 8; }
.order-card:nth-child(10) { --index: 9; }
</style>
</head>

<body>

<jsp:include page="Header.jsp"></jsp:include>

<div class="container">
<h2>My Orders</h2>

<% if (orders == null || orders.isEmpty()) { %>
    <p>No orders found.</p>
<% } else {
    for (Order o : orders) { %>

    <div class="order-card">
        <div class="row">
            <span><b>Order ID:</b> #<%= o.getOrderId() %></span>
            <span class="status"><%= o.getStatus() %></span>
        </div>
        <div class="row">
            <span>Total Amount</span>
            <span>₹ <%= o.getTotalAmount() %></span>
        </div>
        <div class="row">
            <span>Order Date</span>
            <span><%= o.getOrderDate() %></span>
        </div>
    </div>

<% } } %>
</div>

</body>
</html>