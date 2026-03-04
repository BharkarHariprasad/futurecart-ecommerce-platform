<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.futurecart.model.User" %>

<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("AdminLogin.html");
        return;
    }

    User u = (User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View User | Admin</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
    background: #f4f6f9;
}

/* HEADER */
.admin-header {
    height: 64px;
    background: white;
    border-bottom: 1px solid #e0e0e0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 24px;
}

.admin-logo {
    font-size: 18px;
    font-weight: 800;
    color: #ff3f6c;
}

.admin-user {
    font-size: 14px;
    font-weight: 600;
}

/* LAYOUT */
.admin-container {
    display: flex;
    min-height: calc(100vh - 64px);
}

/* SIDEBAR */
.admin-sidebar {
    width: 220px;
    background: white;
    border-right: 1px solid #e0e0e0;
    padding: 20px;
}

.admin-sidebar a {
    display: block;
    padding: 10px 14px;
    margin-bottom: 8px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    color: #282c3f;
    text-decoration: none;
}

.admin-sidebar a:hover {
    background: #fff0f4;
    color: #ff3f6c;
}

/* MAIN */
.admin-main {
    flex: 1;
    padding: 30px;
}

/* USER CARD */
.user-card {
    max-width: 520px;
    background: white;
    border-radius: 14px;
    padding: 28px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.08);
}

.user-card h2 {
    margin-bottom: 20px;
    font-size: 22px;
    color: #282c3f;
}

.user-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 14px;
    font-size: 14px;
}

.label {
    font-weight: 700;
    color: #555;
}

.value {
    font-weight: 600;
    color: #222;
}

/* STATUS */
.status {
    padding: 4px 12px;
    border-radius: 999px;
    font-size: 12px;
    font-weight: 700;
}

.active {
    background: #e8f5e9;
    color: #2e7d32;
}

.blocked {
    background: #fdecea;
    color: #c62828;
}

/* BACK BUTTON */
.back-btn {
    display: inline-block;
    margin-top: 24px;
    padding: 10px 18px;
    border-radius: 999px;
    border: 1px solid #ff3f6c;
    color: #ff3f6c;
    text-decoration: none;
    font-weight: 600;
}

.back-btn:hover {
    background: #ff3f6c;
    color: white;
}
</style>
</head>

<body>

<!-- HEADER -->
<div class="admin-header">
    <div class="admin-logo">FutureCart Admin</div>
    <div class="admin-user">
        Welcome, <strong><%= adminName %></strong>
    </div>
</div>

<div class="admin-container">

    <!-- SIDEBAR -->
    <div class="admin-sidebar">
        <a href="adminDashboard">Dashboard</a>
        <a href="adminUsers">Users</a>
        <a href="adminLogout">Logout</a>
    </div>

    <!-- MAIN -->
    <div class="admin-main">

        <div class="user-card">
            <h2>User Details</h2>

            <div class="user-row">
                <span class="label">Full Name</span>
                <span class="value"><%= u.getFullName() %></span>
            </div>

            <div class="user-row">
                <span class="label">Email</span>
                <span class="value"><%= u.getEmail() %></span>
            </div>

            <div class="user-row">
                <span class="label">Mobile</span>
                <span class="value"><%= u.getMobile() %></span>
            </div>

            <div class="user-row">
                <span class="label">Joined On</span>
                <span class="value"><%= u.getCreatedAt() %></span>
            </div>

            <div class="user-row">
                <span class="label">Status</span>
                <span class="status <%= (u.getActive() == 1) ? "active" : "blocked" %>">
                    <%= (u.getActive() == 1) ? "ACTIVE" : "BLOCKED" %>
                </span>
            </div>

            <a href="adminUsers" class="back-btn">⬅ Back to Users</a>
        </div>

    </div>
</div>

</body>
</html>