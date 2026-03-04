<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.futurecart.model.User" %>

<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("AdminLogin.html");
        return;
    }

    ArrayList<User> users =
        (ArrayList<User>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin - Users | FutureCart</title>

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
    background: #ffffff;
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
    background: #ffffff;
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
    padding: 24px;
}

.admin-title {
    font-size: 22px;
    font-weight: 800;
    margin-bottom: 20px;
}

/* TABLE */
.user-table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    border-radius: 12px;
    overflow: hidden;
}

.user-table thead {
    background: #ff3f6c;
    color: white;
}

.user-table th,
.user-table td {
    padding: 14px 16px;
    font-size: 14px;
    text-align: left;
}

.user-table tbody tr {
    border-bottom: 1px solid #eee;
}

.user-table tbody tr:hover {
    background: #f9f9f9;
}

/* STATUS BADGE */
.user-badge {
    padding: 4px 10px;
    border-radius: 999px;
    font-size: 11px;
    font-weight: 700;
}

.active {
    background: #e8f5e9;
    color: #2e7d32;
}

/* ACTION BUTTON */
.view-btn {
    padding: 6px 14px;
    border-radius: 999px;
    border: 1px solid #ff3f6c;
    background: white;
    color: #ff3f6c;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    text-decoration: none;
}

/* BLOCK BUTTON */
.btn-block {
    padding: 6px 14px;
    border-radius: 999px;
    border: 1px solid #ff1744;
    background: white;
    color: #ff1744;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    text-decoration: none;
}

.btn-block:hover {
    background: #ff1744;
    color: white;
}

/* UNBLOCK BUTTON */
.btn-unblock {
    padding: 6px 14px;
    border-radius: 999px;
    border: 1px solid #2e7d32;
    background: white;
    color: #2e7d32;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    text-decoration: none;
}

.btn-unblock:hover {
    background: #2e7d32;
    color: white;
}

/* BLOCKED STATUS BADGE */
.inactive {
    background: #fdecea;
    color: #c62828;
}

.view-btn:hover {
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
        <div class="admin-title">Registered Users</div>

        <table class="user-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Joined On</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
            <% if (users != null && !users.isEmpty()) {
                for (User u : users) { %>
                <tr>
                    <td><%= u.getUserId() %></td>
                    <td><%= u.getFullName() %></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getMobile() %></td>
                    <td><%= u.getCreatedAt() %></td>
                    <td>
    <% if (u.getActive() == 1) { %>
        <span class="user-badge active">ACTIVE</span>
    <% } else { %>
        <span class="user-badge inactive">BLOCKED</span>
    <% } %>
</td>
                    <td style="display:flex; gap:10px;">

    <a class="view-btn"
       href="adminViewUser?userId=<%=u.getUserId()%>">
       View
    </a>

    <% if (u.getActive() == 1) { %>
        <a class="btn-block"
           href="adminUserStatus?userId=<%=u.getUserId()%>&action=block"
           onclick="return confirm('Block this user?')">
           Block
        </a>
    <% } else { %>
        <a class="btn-unblock"
           href="adminUserStatus?userId=<%=u.getUserId()%>&action=unblock"
           onclick="return confirm('Unblock this user?')">
           Unblock
        </a>
    <% } %>

</td>
                </tr>
            <% } } else { %>
                <tr>
                    <td colspan="7">No users found</td>
                </tr>
            <% } %>
            </tbody>
        </table>

    </div>

</div>

</body>
</html>