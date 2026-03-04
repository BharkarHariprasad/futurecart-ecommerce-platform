<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.futurecart.model.Order" %>

<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("AdminLogin.html");
        return;
    }

    ArrayList<Order> orders =
        (ArrayList<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Orders</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
    background: linear-gradient(135deg, #f5f7fb 0%, #e8ecf1 100%);
    padding: 40px 24px;
    min-height: 100vh;
    line-height: 1.6;
    animation: fadeIn 0.6s ease-out;
    max-width: 1400px;
    margin: 0 auto;
}

@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

h2 {
    margin-bottom: 32px;
    font-size: 32px;
    font-weight: 800;
    color: #1f2937;
    letter-spacing: -0.5px;
    position: relative;
    padding-bottom: 16px;
    animation: slideDown 0.6s ease-out;
}

@keyframes slideDown {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 80px;
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
        width: 80px;
    }
}

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.05);
    margin-top: 24px;
    animation: slideUp 0.6s ease-out 0.2s both;
}

@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

th, td {
    padding: 16px 20px;
    text-align: center;
    transition: all 0.3s ease;
}

th {
    background: linear-gradient(135deg, #ff3f6c, #ff6b9d);
    color: white;
    font-weight: 700;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    position: relative;
}

th:first-child {
    border-top-left-radius: 12px;
}

th:last-child {
    border-top-right-radius: 12px;
}

td {
    background: #ffffff;
    color: #1f2937;
    font-size: 14px;
    border-bottom: 1px solid #e5e7eb;
}

tr {
    transition: all 0.3s ease;
    animation: fadeInRow 0.5s ease-out both;
    animation-delay: calc(var(--index, 0) * 0.05s);
}

@keyframes fadeInRow {
    from {
        opacity: 0;
        transform: translateX(-20px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

tr:nth-child(even) td {
    background: #f9fafb;
}

tr:hover td {
    background: #fff5f7;
    transform: scale(1.01);
    box-shadow: 0 4px 12px rgba(255, 63, 108, 0.1);
}

tr:last-child td:first-child {
    border-bottom-left-radius: 12px;
}

tr:last-child td:last-child {
    border-bottom-right-radius: 12px;
}

tr:last-child td {
    border-bottom: none;
}

td:first-child {
    font-weight: 700;
    color: #ff3f6c;
}

td:nth-child(3) {
    font-weight: 700;
    color: #1f2937;
    font-size: 15px;
}

td:nth-child(4) {
    font-weight: 600;
}

/* Status styling */
td:nth-child(4) {
    position: relative;
}

/* Form styling */
form {
    display: flex;
    gap: 12px;
    align-items: center;
    justify-content: center;
}

select {
    padding: 10px 16px;
    border: 2px solid #e5e7eb;
    border-radius: 8px;
    background: #ffffff;
    color: #1f2937;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    outline: none;
    min-width: 140px;
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23ff3f6c' d='M6 9L1 4h10z'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 12px center;
    padding-right: 40px;
}

select:hover {
    border-color: #ff3f6c;
    background-color: #fff5f7;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(255, 63, 108, 0.15);
}

select:focus {
    border-color: #ff3f6c;
    box-shadow: 0 0 0 3px rgba(255, 63, 108, 0.1);
    background-color: #ffffff;
}

button[type="submit"] {
    padding: 10px 24px;
    border: 2px solid #ff3f6c;
    border-radius: 8px;
    background: linear-gradient(135deg, #ff3f6c, #ff6b9d);
    color: white;
    font-size: 13px;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.3s ease;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    position: relative;
    overflow: hidden;
    isolation: isolate;
}

button[type="submit"]::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.4s, height 0.4s;
    z-index: 0;
    pointer-events: none;
}

button[type="submit"]:hover::before {
    width: 300px;
    height: 300px;
}

button[type="submit"]:hover {
    background: linear-gradient(135deg, #ff6b9d, #ff3f6c);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(255, 63, 108, 0.3);
    color: #ffffff;
}

button[type="submit"]:active {
    transform: translateY(0);
    box-shadow: 0 2px 12px rgba(255, 63, 108, 0.3);
}

button[type="submit"] span {
    position: relative;
    z-index: 1;
}

/* Empty state */
p {
    text-align: center;
    padding: 60px 20px;
    color: #9ca3af;
    font-size: 16px;
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    animation: fadeIn 0.6s ease-out;
}

/* Stagger animation for table rows */
tr:nth-child(1) { --index: 0; }
tr:nth-child(2) { --index: 1; }
tr:nth-child(3) { --index: 2; }
tr:nth-child(4) { --index: 3; }
tr:nth-child(5) { --index: 4; }
tr:nth-child(6) { --index: 5; }
tr:nth-child(7) { --index: 6; }
tr:nth-child(8) { --index: 7; }
tr:nth-child(9) { --index: 8; }
tr:nth-child(10) { --index: 9; }

/* Responsive Design */
@media (max-width: 1024px) {
    table {
        font-size: 13px;
    }
    
    th, td {
        padding: 14px 16px;
    }
}

@media (max-width: 768px) {
    body {
        padding: 24px 16px;
    }
    
    h2 {
        font-size: 26px;
        margin-bottom: 24px;
    }
    
    table {
        display: block;
        overflow-x: auto;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
        border-radius: 16px;
    }
    
    th, td {
        padding: 12px 14px;
        font-size: 12px;
    }
    
    form {
        flex-direction: column;
        gap: 8px;
    }
    
    select {
        width: 100%;
        min-width: auto;
    }
    
    button[type="submit"] {
        width: 100%;
    }
}

@media (max-width: 480px) {
    body {
        padding: 16px 12px;
    }
    
    h2 {
        font-size: 22px;
        margin-bottom: 20px;
    }
    
    th, td {
        padding: 10px 12px;
        font-size: 11px;
    }
}

/* Focus states for accessibility */
select:focus,
button[type="submit"]:focus {
    outline: 3px solid #ff3f6c;
    outline-offset: 2px;
}
</style>
</head>

<body>

<h2>Admin Orders</h2>

<div style="margin-bottom: 20px; text-align: right;">
    <a href="adminDashboard"
       style="
           display:inline-block;
           padding:10px 20px;
           border-radius:8px;
           background:#ff3f6c;
           color:#fff;
           font-weight:700;
           text-decoration:none;
           transition:0.3s;
       "
       onmouseover="this.style.background='#e7335d'"
       onmouseout="this.style.background='#ff3f6c'">
        ← Back to Dashboard
    </a>
</div>

<% if (orders == null || orders.isEmpty()) { %>
    <p>No orders found.</p>
<% } else { %>

<table>
<tr>
    <th>Order ID</th>
    <th>User ID</th>
    <th>Total Amount</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<% for (Order o : orders) { %>
<tr>
    <td>#<%= o.getOrderId() %></td>
    <td><%= o.getUserId() %></td>
    <td>₹ <%= o.getTotalAmount() %></td>
    <td><%= o.getStatus() %></td>

    <td>
        <form action="updateOrderStatus" method="post">
            <input type="hidden" name="orderId" value="<%= o.getOrderId() %>">

            <select name="status">
                <option value="PLACED" <%= "PLACED".equals(o.getStatus())?"selected":"" %>>PLACED</option>
                <option value="SHIPPED" <%= "SHIPPED".equals(o.getStatus())?"selected":"" %>>SHIPPED</option>
                <option value="DELIVERED" <%= "DELIVERED".equals(o.getStatus())?"selected":"" %>>DELIVERED</option>
                <option value="CANCELLED" <%= "CANCELLED".equals(o.getStatus())?"selected":"" %>>CANCELLED</option>
            </select>

            <button type="submit">Update</button>
        </form>
    </td>
</tr>
<% } %>
</table>

<% } %>

</body>
</html>